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
  TextEditingController controller1 = TextEditingController();
  // ignore: strict_top_level_inference
  List<Animal> animalList = [];
  bool isLoading = false;
  var formatedData;
  Animal animal = Animal();
  getAnimals() async {
    var url = Uri.parse(
      'https://api.api-ninjas.com/v1/animals?name=${controller1.text}',
    );
    final headers = {'X-Api-Key': 'cPn3DLgdAW64j3RvRWvg3QUbRpA90cK91wHJGvkd'};

    var response = await http.get(url, headers: headers);
    animal = jsonDecode(response.body);
    debugPrint(response.body);
    debugPrint(animal.characteristics!.averageLitterSize.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Animals");
          getAnimals();
          setState(() {});
        },
        child: Text("Animanls"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller1,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
              onPressed: () {
                getAnimals();
              },
              child: Text("Search"),
            ),
            formatedData == null || formatedData.isEmpty
                ? Center(child: Text("................."))
                : Text(
                    formatedData[0]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            formatedData == null || formatedData.isEmpty
                ? Center(child: Text("................."))
                : Text(
                    "Taxonomy: ${formatedData[0]['taxonomy']['scientific_name']}",
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
          ],
        ),
      ),
    );
  }
}

class Animal {
  String? name;
  Taxonomy? taxonomy;
  List<String>? locations;
  Characteristics? characteristics;

  Animal({this.name, this.taxonomy, this.locations, this.characteristics});

  Animal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    taxonomy = json['taxonomy'] != null
        ? new Taxonomy.fromJson(json['taxonomy'])
        : null;
    locations = json['locations'].cast<String>();
    characteristics = json['characteristics'] != null
        ? new Characteristics.fromJson(json['characteristics'])
        : null;
  }
}

class Taxonomy {
  final String scientificName;

  Taxonomy({this.scientificName = "Unknown"});

  factory Taxonomy.fromJson(Map<String, dynamic> json) {
    return Taxonomy(scientificName: json['scientific_name'] ?? "Unknown");
  }
}

class Characteristics {
  String? temperament;
  String? training;
  String? diet;
  String? averageLitterSize;
  String? commonName;
  String? slogan;
  String? group;
  String? color;
  String? skinType;
  String? lifespan;
  String? height;

  Characteristics({
    this.temperament,
    this.training,
    this.diet,
    this.averageLitterSize,
    this.commonName,
    this.slogan,
    this.group,
    this.color,
    this.skinType,
    this.lifespan,
    this.height,
  });

  Characteristics.fromJson(Map<String, dynamic> json) {
    temperament = json['temperament'];
    training = json['training'];
    diet = json['diet'];
    averageLitterSize = json['average_litter_size'];
    commonName = json['common_name'];
    slogan = json['slogan'];
    group = json['group'];
    color = json['color'];
    skinType = json['skin_type'];
    lifespan = json['lifespan'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperament'] = this.temperament;
    data['training'] = this.training;
    data['diet'] = this.diet;
    data['average_litter_size'] = this.averageLitterSize;
    data['common_name'] = this.commonName;
    data['slogan'] = this.slogan;
    data['group'] = this.group;
    data['color'] = this.color;
    data['skin_type'] = this.skinType;
    data['lifespan'] = this.lifespan;
    data['height'] = this.height;
    return data;
  }
}
