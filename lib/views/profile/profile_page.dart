import 'package:flutter/material.dart';
import 'package:modul_3/views/authentication/login_page.dart';

class ProfilePage extends StatelessWidget {
  final String nama;
  final String username;
  final String email;
  final String nomor;
  final String alamat;
  const ProfilePage(
      {super.key,
      required this.nama,
      required this.username,
      required this.email,
      required this.nomor,
      this.alamat = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Biodata",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const FlutterLogo(
                size: 150,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                nama,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                username,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                nomor,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                alamat,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                    ),
                    child: const Text("Back"),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }), (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 30,
                      ),
                    ),
                    child: const Text("Logout"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
