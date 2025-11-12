import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas14Flutter/service/hp_api.dart';
import 'package:ppkd_zahra/Tugas14Flutter/models/hp_models.dart';
import 'package:ppkd_zahra/Tugas14Flutter/views/character_detail.dart';

class CharacterListScreen extends StatefulWidget {
  final String houseName;

  const CharacterListScreen({super.key, required this.houseName});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen>
    with TickerProviderStateMixin {
  late Future<List<CharacterModel>> futureCharacters;
  String searchQuery = '';
  late AnimationController _fadeController;
  final ScrollController _scrollController = ScrollController();

  double scrollOffset = 0.0;
  final Set<String> favoriteCharacters = {}; // simpan karakter favorit

  // === Warna & Logo Tiap House ===
  Color getHouseColor(String house) {
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

  String getHouseAsset(String house) {
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
  void initState() {
    super.initState();
    futureCharacters = getCharactersByHouse(widget.houseName);

    _fadeController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();

    _scrollController.addListener(() {
      setState(() {
        scrollOffset = _scrollController.offset * 0.3; // Parallax effect
      });
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final houseColor = getHouseColor(widget.houseName);
    final houseImage = getHouseAsset(widget.houseName);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("${widget.houseName} House"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // === Background Gradient ===
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [houseColor.withOpacity(0.9), Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // === Parallax Background Logo ===
          AnimatedBuilder(
            animation: _fadeController,
            builder: (context, child) {
              return Positioned(
                top: 120 - scrollOffset,
                right: -50,
                child: Opacity(
                  opacity: 0.15 * _fadeController.value,
                  child: Image.asset(houseImage, height: 300),
                ),
              );
            },
          ),

          // === Main Content ===
          FutureBuilder<List<CharacterModel>>(
            future: futureCharacters,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.white));
              } else if (snapshot.hasError) {
                return Center(
                    child: Text("Error: ${snapshot.error}",
                        style: const TextStyle(color: Colors.white)));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                    child: Text("No characters found.",
                        style: TextStyle(color: Colors.white70)));
              }

              final characters = snapshot.data!;
              final displayedCharacters = characters
                  .where((char) =>
                      char.name
                          ?.toLowerCase()
                          .contains(searchQuery.toLowerCase()) ??
                      false)
                  .toList();

              return SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    // === Search Box ===
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: houseColor.withOpacity(0.4),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search character by name...',
                            prefixIcon: const Icon(Icons.search,
                                color: Colors.white70),
                            border: InputBorder.none,
                            hintStyle:
                                const TextStyle(color: Colors.white70),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 14),
                          ),
                          style: const TextStyle(color: Colors.white),
                          onChanged: (value) {
                            setState(() => searchQuery = value);
                          },
                        ),
                      ),
                    ),

                    // === Character List ===
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        itemCount: displayedCharacters.length,
                        itemBuilder: (context, index) {
                          final char = displayedCharacters[index];
                          final delay = index * 120;
                          final isFavorite =
                              favoriteCharacters.contains(char.name);

                          return TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0, end: 1),
                            duration: Duration(milliseconds: 600 + delay),
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value,
                                child: Transform.translate(
                                  offset: Offset(0, 40 * (1 - value)),
                                  child: child,
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.2)),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          const Duration(milliseconds: 600),
                                      pageBuilder: (_, animation, __) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: CharacterDetailScreen(
                                              character: char),
                                        );
                                      },
                                    ),
                                  );
                                },
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: (char.image != null &&
                                          char.image!.isNotEmpty)
                                      ? Image.network(
                                          char.image!,
                                          width: 55,
                                          height: 55,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          'assets/images/hogwarts.png',
                                          width: 55,
                                          height: 55,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                title: Text(
                                  char.name ?? 'Unknown',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  "${char.species ?? 'Unknown species'}${char.house != null ? ' - ${char.house}' : ''}",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 13,
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: AnimatedScale(
                                    scale: isFavorite ? 1.3 : 1.0,
                                    duration:
                                        const Duration(milliseconds: 250),
                                    child: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavorite
                                          ? Colors.pinkAccent
                                          : Colors.white70,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (isFavorite) {
                                        favoriteCharacters.remove(char.name);
                                      } else {
                                        favoriteCharacters.add(char.name!);
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
