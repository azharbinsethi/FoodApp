import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  // ignore: strict_top_level_inference
  var formatedData;
  getQuotes() async {
    var url = Uri.parse('https://api.api-ninjas.com/v2/randomquotes');
    final headers = {'X-Api-Key': 'cPn3DLgdAW64j3RvRWvg3QUbRpA90cK91wHJGvkd'};

    var response = await http.get(url, headers: headers);
    formatedData = jsonDecode(response.body);
    debugPrint(response.body);
    // debugPrint(formatedData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Qoutes");
          getQuotes();
          setState(() {});
        },
        child: Text("Qoutes"),
      ),
      body: formatedData == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    formatedData[0]['quote'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    formatedData[0]['author'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
    );
  }
}
