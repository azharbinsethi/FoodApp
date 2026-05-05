import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FtureBuilderScreen extends StatefulWidget {
  const FtureBuilderScreen({super.key});

  @override
  State<FtureBuilderScreen> createState() => _FtureBuilderScreenState();
}

class _FtureBuilderScreenState extends State<FtureBuilderScreen> {
  String userid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('User').doc(userid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error ${snapshot.error}"));
        }
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Scaffold(body: Center(child: Text("${data['name']}")));
      },
    );
  }
}
