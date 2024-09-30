import 'package:flutter/material.dart';
import 'package:kuis124220128/autentication/login_page.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mau makan apa hari ini?",
            style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.purple,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text("Halo, $username",
                style: const TextStyle(fontSize: 15, color: Colors.white)),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              _showLogoutConfirmation(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                'https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/banner/bg_banner.webp',
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          'https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/menu_img/img_noodle_menu.webp',
                          height: 15,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Mie Kuah',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Rp5.000',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          child: const Text('Beli'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah kamu yakin ingin logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
