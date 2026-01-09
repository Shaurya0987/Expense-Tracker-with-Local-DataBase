import 'package:expensetracker/Providers/AuthProvider.dart';
import 'package:expensetracker/Screens/BottomNavigationBar.dart';
import 'package:expensetracker/Screens/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<Authprovider>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            const Spacer(flex: 2),

            Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.blue,
                        blurStyle: BlurStyle.outer,
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet_rounded,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 40),

                const Text("Email Address"),
                const SizedBox(height: 7),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),

                const Text("Password"),
                const SizedBox(height: 7),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Fill all details"),
                          ),
                        );
                        return;
                      }

                      final success =
                          await authProvider.login(email, password);

                      if (success) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const BottomNavigationScreens(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Invalid email or password"),
                          ),
                        );
                      }
                    },
                    child: const Text("Log In"),
                  ),
                ),
              ],
            ),

            const Spacer(flex: 2),

            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SignInScreen(),
                  ),
                );
              },
              child: const Text(
                "Don't have an account? Sign Up",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
