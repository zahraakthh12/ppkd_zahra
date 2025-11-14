import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas15Flutter/models/get_profile_model.dart';
import 'package:ppkd_zahra/Tugas15Flutter/service/api.dart';
import 'package:ppkd_zahra/Tugas15Flutter/views/get_profile_screen.dart';
import 'package:ppkd_zahra/Tugas15Flutter/views/login_screen.dart';
import 'package:ppkd_zahra/preferences/preference_handler.dart';

class DrawerScreenDay33 extends StatefulWidget {
  const DrawerScreenDay33({super.key});

  @override
  State<DrawerScreenDay33> createState() => _DrawerScreenDay33State();
}

class _DrawerScreenDay33State extends State<DrawerScreenDay33> {
  int _selectedIndex = 0;

  GetProfileModel? profileData;
  bool loading = true;

  static const List<String> _titles = [
    "My Profile",
  ];

  static const List<Widget> _widgetOptions = [
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // load once at start
    loadUserProfile();
  }

  Future<void> loadUserProfile() async {
    setState(() => loading = true);
    try {
      final data = await AuthAPI.getProfile();
      setState(() {
        profileData = data;
        loading = false;
      });
    } catch (e) {
      print("Gagal load profile: $e");
      setState(() => loading = false);
    }
  }

  void onTapDrawer(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ketika drawer dibuka/tutup, callback ini terpanggil
      onDrawerChanged: (isOpened) {
        if (isOpened) {
          // refresh profile setiap kali drawer dibuka
          loadUserProfile();
        }
      },

      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),

      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xfffdfbfb), Color(0xffebedee)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundColor: Colors.blue.shade100,
                          child: const Icon(
                            Icons.person,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Nama user (otomatis ter-update ketika drawer dibuka)
                        Text(
                          profileData?.data?.name ?? "User",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Email user
                        Text(
                          profileData?.data?.email ?? "",
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(
                    icon: Icons.person_rounded,
                    title: "My Profile",
                    onTap: () => onTapDrawer(0),
                  ),

                  const Divider(),

                  _buildMenuItem(
                    icon: Icons.logout_rounded,
                    title: "Logout",
                    color: Colors.redAccent,
                    onTap: () async {
                      await PreferenceHandler.removeLogin();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreenDay33()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body: _widgetOptions[_selectedIndex],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Color? color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.black87),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: color ?? Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      horizontalTitleGap: 10,
    );
  }
}
