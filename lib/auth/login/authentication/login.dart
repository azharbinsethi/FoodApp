import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/Futurebuilder/Futurebuilder.dart';
import 'package:flutter_application_1/auth/Seller_Dashboard_Home/dashboard.dart';
import 'package:flutter_application_1/auth/login/authentication/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 160),
          Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Please sign in to your existing account",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 80),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),

              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        Text('Email'),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Email",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }

                            // Naya aur behtar Regex pattern
                            final emailRegex = RegExp(
                              r'^[^@]+@[a-zA-Z]+\.(com)$',
                            );

                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        Text('Password'),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Password",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            // Yahan '!' lagaya hai: "Agar match NA kare to error do"
                            else if (!RegExp(
                              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>])[A-Za-z\d!@#\$%^&*(),.?":{}|<>]{8,}$',
                            ).hasMatch(value)) {
                              return 'Password must be at least 8 characters, \ninclude an uppercase letter, number and symbol.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            Text('Remember me'),
                            SizedBox(width: 18),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Colors.orange,
                                  ),
                                ),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    try {
                                      await auth.signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                      emailController.clear();
                                      passwordController.clear();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SellerDashboard(),
                                        ),
                                      );
                                    } on FirebaseAuthException catch (e) {
                                      debugPrint('Exception $e');
                                    }
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
