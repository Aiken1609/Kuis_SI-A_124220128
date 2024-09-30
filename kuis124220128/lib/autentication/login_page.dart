import 'package:flutter/material.dart';
import 'package:kuis124220128/autentication/register_page.dart';
import 'package:kuis124220128/datastore/users.dart';
import 'package:kuis124220128/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _loginIcon(icon: Icons.message),
              _loginText(
                text: "Login untuk mengakses lebih banyak fitur.",
              ),
              _loginForm(
                controller: _usernameController,
                label: "username",
                obscureText: false,
                icon: Icons.person,
              ),
              _loginForm(
                controller: _passwordController,
                label: "password",
                obscureText: true,
                icon: Icons.key,
              ),
              _loginButton(
                text: "Login",
                onPressed: () {
                  var usernameInput = _usernameController.text;
                  var passwordInput = _passwordController.text;

                  if (users.any((user) =>
                      user["username"] == usernameInput &&
                      user["password"] == passwordInput)) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage(username: usernameInput);
                        },
                      ),
                    );

                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Login gagal, username atau password salah!"),
                  ));
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  );
                },
                child: const Text(
                  'Belum Punya Akun?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 144, 0, 255),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginIcon({required IconData icon}) {
    return Image.network(
      "https://raw.githubusercontent.com/YudaSaputraa/FoodApp-assets/refs/heads/main/img_authentication.webp",
      width: 250,
    );
  }

  Widget _loginButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: FilledButton(onPressed: onPressed, child: Text(text)),
    );
  }

  Widget _loginText({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(text, style: Theme.of(context).textTheme.bodySmall),
    );
  }

  Widget _loginForm({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          label: Row(
            children: [
              Icon(
                icon,
                size: 16,
              ),
              const SizedBox(width: 12),
              Text(label),
            ],
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          filled: true,
        ),
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
