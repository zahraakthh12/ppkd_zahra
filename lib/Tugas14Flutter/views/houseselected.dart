import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas14Flutter/views/character_list.dart.dart';

class HouseSelectionScreen extends StatefulWidget {
  const HouseSelectionScreen({super.key});

  @override
  State<HouseSelectionScreen> createState() => _HouseSelectionScreenState();
}

class _HouseSelectionScreenState extends State<HouseSelectionScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentIndex = 0;

  final List<Map<String, dynamic>> houses = [
    {
      'name': 'Gryffindor',
      'image': 'assets/images/gryffindor.png',
      'color': Colors.redAccent,
      'desc': 'Bravery, daring, nerve, and chivalry.',
    },
    {
      'name': 'Slytherin',
      'image': 'assets/images/slytherin.png',
      'color': Colors.green,
      'desc': 'Ambition, cunning, leadership, and resourcefulness.',
    },
    {
      'name': 'Ravenclaw',
      'image': 'assets/images/ravenclaw.png',
      'color': Colors.blueAccent,
      'desc': 'Wisdom, wit, creativity, and intellect.',
    },
    {
      'name': 'Hufflepuff',
      'image': 'assets/images/hufflepuff.png',
      'color': Colors.amber,
      'desc': 'Hard work, patience, loyalty, and fair play.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final selectedHouse = houses[_currentIndex];
    final Color houseColor = selectedHouse['color'];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            const Text(
              "⚡ Choose Your Hogwarts House ⚡",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Swipe left or right to pick your destiny...",
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 30),

            // 🔮 SLIDE CAROUSEL
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: houses.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final house = houses[index];
                  final bool isSelected = _currentIndex == index;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    margin: EdgeInsets.symmetric(
                      horizontal: isSelected ? 8 : 18,
                      vertical: isSelected ? 10 : 40,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? house['color'].withOpacity(0.12)
                          : Colors.white10,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: house['color'].withOpacity(isSelected ? 0.9 : 0.2),
                        width: isSelected ? 2.5 : 1,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: house['color'].withOpacity(0.4),
                                blurRadius: 18,
                                offset: const Offset(0, 8),
                              ),
                            ]
                          : [],
                    ),
                    child: Stack(
                      children: [
                        // 🖼️ Gambar House
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              house['image'],
                              fit: BoxFit.cover,
                              color: Colors.black.withOpacity(0.25),
                              colorBlendMode: BlendMode.darken,
                            ),
                          ),
                        ),

                        // 📜 Info Overlay
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                  bottom: Radius.circular(25)),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.3)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  house['name'],
                                  style: TextStyle(
                                    color: house['color'],
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  house['desc'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                AnimatedOpacity(
                                  opacity: isSelected ? 1 : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: Icon(
                                    Icons.star_rounded,
                                    color: house['color'],
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // ⚡ Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(houses.length, (index) {
                final isActive = index == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: isActive ? 18 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isActive
                        ? houses[index]['color']
                        : Colors.white24,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),

            const SizedBox(height: 25),

            // 🪄 BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: houseColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                  shadowColor: houseColor.withOpacity(0.6),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      pageBuilder: (_, animation, __) {
                        return FadeTransition(
                          opacity: animation,
                          child: CharacterListScreen(
                            houseName: houses[_currentIndex]['name'],
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  "Enter ${houses[_currentIndex]['name']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
