import 'package:expensetracker/Providers/AuthProvider.dart';
import 'package:expensetracker/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<Authprovider>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Header
              Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
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
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Start tracking your expenses today",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Form
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Full Name"),
                      const SizedBox(height: 7),
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),

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
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text("Confirm Password"),
                      const SizedBox(height: 7),
                      TextField(
                        controller: confirmPasswordController,
                        obscureText: !isConfirmPasswordVisible,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordVisible =
                                    !isConfirmPasswordVisible;
                              });
                            },
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 35),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            final name = nameController.text.trim();
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();
                            final confirmPassword =
                                confirmPasswordController.text.trim();

                            if (name.isEmpty ||
                                email.isEmpty ||
                                password.isEmpty ||
                                confirmPassword.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Fill all details"),
                                ),
                              );
                              return;
                            }

                            if (password != confirmPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Passwords do not match"),
                                ),
                              );
                              return;
                            }

                            final success = await authProvider.signUp(
                              name,
                              email,
                              password,
                            );

                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Account created successfully"),
                                ),
                              );

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const Loginscreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Email already exists"),
                                ),
                              );
                            }
                          },
                          child: const Text("Sign In"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
