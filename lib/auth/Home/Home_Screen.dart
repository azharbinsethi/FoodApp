import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/login/authentication/login.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Titlecontroller = TextEditingController();
  final Descriptioncontroller = TextEditingController();
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut().then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text('Home Screen')),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No Data Found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,

            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(snapshot.data!.docs[index]['title']),
                  subtitle: Text(snapshot.data!.docs[index]['description']),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('Delete'),
                        value: 'Delete',
                        onTap: () {
                          FirebaseFirestore.instance
                              .collection('tasks')
                              .doc(snapshot.data!.docs[index].id)
                              .delete();
                        },
                      ),
                      PopupMenuItem(
                        child: Text('Edit'),
                        value: 'Edit',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Edit'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: Titlecontroller,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Task Name',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    controller: Descriptioncontroller,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Task Description',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('tasks')
                                          .doc(snapshot.data!.docs[index].id)
                                          .update({
                                            'title': Titlecontroller.text,
                                            'description':
                                                Descriptioncontroller.text,
                                          });
                                      Navigator.pop(context);
                                    },
                                    child: Text('Update'),
                                  ),
                                ],
                              ),
                              actions: [
                                      
                                    ]
                                    ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        stream: FirebaseFirestore.instance
            .collection('tasks')
            .where('userId', isEqualTo: userId)
            .snapshots(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add Todo Tasks'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: Titlecontroller,
                    decoration: InputDecoration(
                      hintText: 'Enter Task Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: Descriptioncontroller,

                    decoration: InputDecoration(
                      hintText: 'Enter Task Description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('tasks')
                        .doc()
                        .set({
                          'title': Titlecontroller.text,
                          'description': Descriptioncontroller.text,
                          'userId': userId,
                        })
                        .then((value) => Navigator.pop(context));
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
