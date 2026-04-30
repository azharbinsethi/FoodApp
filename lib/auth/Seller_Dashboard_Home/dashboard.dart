import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerDashboard extends StatefulWidget {
  const SellerDashboard({super.key});

  @override
  State<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'LOCATION',
              style: TextStyle(
                color: Color(0xffFC6E2A),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Halal Lab office',
              style: GoogleFonts.poppins(
                color: Color(0xff676767),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.notes),
            );
          },
        ),

        actions: [
          CircleAvatar(backgroundColor: Colors.grey),
          SizedBox(width: 15),
        ],
      ),
      drawer: Drawer(child: Center(child: Text("Drawer Content"))),
    );
  }
}
