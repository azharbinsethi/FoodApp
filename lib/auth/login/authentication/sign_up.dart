import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login/authentication/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 160),
          Text(
            "Signup",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Please sign up to your new account",
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text('name'),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your name',
                        ),
                      ),
                      Text('email'),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your email',
                        ),
                      ),
                      Text('password'),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your password',
                        ),
                      ),
                      Text('confirm password'),
                      TextFormField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Confirm your password',
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          try {
                            auth
                                .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                )
                                .then(
                                  (value) => FirebaseFirestore.instance
                                      .collection('User')
                                      .doc(value.user!.uid)
                                      .set({
                                        'name': nameController.text,
                                        'email': emailController.text,
                                        'phone': phoneController.text,
                                        'address': addressController.text,
                                      })
                                      .then(
                                        (value) => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Login(),
                                          ),
                                        ),
                                      ),
                                );
                          } on FirebaseAuthException catch (e) {
                            debugPrint(e.code);
                          }
                        },
                      ),
                    ],
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
