import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas14Flutter/models/hp_models.dart';

class CharacterDetailScreen extends StatefulWidget {
  final CharacterModel character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _bgController;

  @override
  void initState() {
    super.initState();

    // Fade-in untuk konten
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..forward();

    // Animasi shimmer pada background gradient
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _bgController.dispose();
    super.dispose();
  }

  Color getHouseColor(String? house) {
    switch (house) {
      case 'Gryffindor':
        return Colors.redAccent.shade400;
      case 'Slytherin':
        return Colors.green.shade700;
      case 'Ravenclaw':
        return Colors.blueAccent.shade700;
      case 'Hufflepuff':
        return Colors.amber.shade700;
      default:
        return Colors.grey.shade700;
    }
  }

  String getHouseAsset(String? house) {
    switch (house) {
      case 'Gryffindor':
        return 'assets/images/gryffindor.png';
      case 'Slytherin':
        return 'assets/images/slytherin.png';
      case 'Ravenclaw':
        return 'assets/images/ravenclaw.png';
      case 'Hufflepuff':
        return 'assets/images/hufflepuff.png';
      default:
        return 'assets/images/hogwarts.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    final character = widget.character;
    final color = getHouseColor(character.house);
    final houseBg = getHouseAsset(character.house);

    // helper card dengan animasi fade + slide
    Widget infoCard(String label, String? value, int index) {
      if (value == null || value.isEmpty) return const SizedBox();
      final intervalStart = 0.1 + (index * 0.05);
      final animation = CurvedAnimation(
        parent: _fadeController,
        curve: Interval(intervalStart, 1, curve: Curves.easeOut),
      );

      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.2),
            end: Offset.zero,
          ).animate(animation),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.5)),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 15, height: 1.3),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: FadeTransition(
          opacity: CurvedAnimation(
            parent: _fadeController,
            curve: const Interval(0, 0.3, curve: Curves.easeIn),
          ),
          child: Text(
            character.name ?? 'Character Detail',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: _bgController,
        builder: (context, child) {
          return Stack(
            children: [
              // Animated gradient background
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withOpacity(0.9),
                      Colors.black.withOpacity(0.9),
                      Color.lerp(color, Colors.black, _bgController.value * 0.6)!
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              // House logo faint
              Positioned(
                top: 120,
                right: -40,
                child: Opacity(
                  opacity: 0.12,
                  child: Image.asset(houseBg, height: 280),
                ),
              ),

              // Main content
              SafeArea(
                child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: FadeTransition(
                    opacity: _fadeController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Character Image
                        Center(
                          child: Hero(
                            tag: character.name ?? "unknown_hero",
                            child: ScaleTransition(
                              scale: CurvedAnimation(
                                parent: _fadeController,
                                curve: const Interval(0, 0.5,
                                    curve: Curves.easeOutBack),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: color.withOpacity(0.7),
                                      blurRadius: 25,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: (character.image != null &&
                                          character.image!.isNotEmpty)
                                      ? Image.network(
                                          character.image!,
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          'assets/images/hogwarts.png',
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Character Name
                        Center(
                          child: ScaleTransition(
                            scale: CurvedAnimation(
                                parent: _fadeController,
                                curve: const Interval(0.2, 0.6,
                                    curve: Curves.easeOutBack)),
                            child: Text(
                              character.name ?? "Unknown",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.2,
                                shadows: [
                                  Shadow(
                                    color: color.withOpacity(0.7),
                                    blurRadius: 12,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),

                        // Info fields (staggered)
                        infoCard('Full Name', character.name, 1),
                        infoCard('Alternate Names',
                            character.alternateNames?.join(', '), 2),
                        infoCard('Species', character.species, 3),
                        infoCard('Gender', character.gender, 4),
                        infoCard('House', character.house, 5),
                        infoCard('Date of Birth', character.dateOfBirth, 6),
                        infoCard(
                            'Year of Birth',
                            character.yearOfBirth?.toString() ?? 'Unknown',
                            7),
                        infoCard('Wizard',
                            character.wizard == true ? 'Yes' : 'No', 8),
                        infoCard('Ancestry', character.ancestry, 9),
                        infoCard('Eye Colour', character.eyeColour, 10),
                        infoCard('Hair Colour', character.hairColour, 11),
                        if (character.wand != null)
                          infoCard(
                              'Wand',
                              "${character.wand!.wood ?? ''} ${character.wand!.core ?? ''} "
                              "(${character.wand!.length ?? ''} inches)",
                              12),
                        infoCard('Patronus', character.patronus, 13),
                        infoCard(
                            'Hogwarts Student',
                            character.hogwartsStudent == true ? 'Yes' : 'No',
                            14),
                        infoCard(
                            'Hogwarts Staff',
                            character.hogwartsStaff == true ? 'Yes' : 'No',
                            15),
                        infoCard('Actor', character.actor, 16),
                        infoCard('Alternate Actors',
                            character.alternateActors?.join(', '), 17),
                        infoCard('Alive',
                            character.alive == true ? 'Yes' : 'No', 18),

                        const SizedBox(height: 25),

                        Center(
                          child: FadeTransition(
                            opacity: CurvedAnimation(
                                parent: _fadeController,
                                curve: const Interval(0.7, 1)),
                            child: ElevatedButton.icon(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.arrow_back, size: 20),
                              label: const Text('Back to List'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: color,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                elevation: 8,
                                shadowColor: color.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
