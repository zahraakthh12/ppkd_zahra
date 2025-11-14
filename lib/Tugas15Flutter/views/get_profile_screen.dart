import 'package:flutter/material.dart';
import 'package:ppkd_zahra/Tugas15Flutter/models/get_profile_model.dart';
import 'package:ppkd_zahra/Tugas15Flutter/service/api.dart';
import 'package:ppkd_zahra/Tugas15Flutter/views/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GetProfileModel? profileData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  loadProfile() async {
    try {
      final data = await AuthAPI.getProfile();
      setState(() {
        profileData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      print(e);
    }
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())

          : profileData == null
              ? const Center(child: Text("Tidak dapat memuat data"))

              : SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Foto Profile
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue.shade100,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 55,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Profile Card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // NAME
                            Text(
                              profileData!.data?.name ?? "",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            // EMAIL
                            Text(
                              profileData!.data?.email ?? "",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 20),
                            const Divider(),
                            const SizedBox(height: 10),

                            // INFORMASI TAMBAHAN
                            infoRow("User ID", profileData!.data?.id?.toString() ?? "-"),
                            infoRow("Email Verified", profileData!.data?.emailVerifiedAt?.toString() ?? "-"),
                            infoRow("Created At", profileData!.data?.createdAt?.toString() ?? "-"),
                            infoRow("Updated At", profileData!.data?.updatedAt?.toString() ?? "-"),

                            const SizedBox(height: 25),

                            // Tombol Edit Profile
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: const Color.fromARGB(255, 158, 105, 101),
                                ),

                                onPressed: () async {
                                  final updated = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => UpdateProfileScreen(
                                        name: profileData!.data?.name ?? "",
                                        email: profileData!.data?.email ?? "",
                                      ),
                                    ),
                                  );

                                  // Jika update berhasil → refresh otomatis
                                  if (updated == true) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    loadProfile();
                                  }
                                },

                                child: const Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
    );
  }
}
