import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/Running_Orders/running_Orders.dart';
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
      backgroundColor: Color(0xffF3F3F3),

      appBar: _appBar(),
      drawer: Drawer(child: Center(child: Text("Drawer Content"))),

      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              _runningOrders(),
              SizedBox(height: 20, width: 20),
              _ordersRequest(),
            ],
          ),
          SizedBox(height: 20),
          _buildRevenueCard(),
          SizedBox(height: 20),
          _buildReviewsCard(),
        ],
      ),

      // Background content ko navbar ke peeche dikhane ke liye
      extendBody: true,

      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Container _bottomNavigationBar() {
    return Container(
      height: 80,
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Home/Grid Icon
          IconButton(
            icon: const Icon(
              Icons.grid_view_rounded,
              color: Colors.orange,
              size: 28,
            ),
            onPressed: () {},
          ),
          // Menu Icon
          IconButton(
            icon: Icon(Icons.menu, color: Colors.grey.shade400, size: 28),
            onPressed: () {},
          ),

          // Center Plus Button (image_58d055.png ke mutabiq)
          GestureDetector(
            onTap: () {
              // Yahan bottom sheet open karne ka code aayega
            },
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF5F2), // Light peach color
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange.shade300, width: 1.5),
              ),
              child: const Icon(Icons.add, color: Colors.orange, size: 30),
            ),
          ),

          // Notification Icon
          IconButton(
            icon: Icon(
              Icons.notifications_none_rounded,
              color: Colors.grey.shade400,
              size: 28,
            ),
            onPressed: () {},
          ),
          // Profile Icon
          IconButton(
            icon: Icon(
              Icons.person_outline_rounded,
              color: Colors.grey.shade400,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  // Reviews Card
  Container _buildReviewsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Reviews",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See All Reviews",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 30),
              SizedBox(width: 8),
              Text(
                "4.9",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(width: 15),
              Text(
                "Total 20 Reviews",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildRevenueCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Revenue", style: TextStyle(color: Colors.grey)),
                  Text(
                    "\$2,241",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See Details",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 1),
                      const FlSpot(1, 1.5),
                      const FlSpot(2, 1.2),
                      const FlSpot(3, 2.5),
                      const FlSpot(4, 1.8),
                      const FlSpot(5, 2),
                      const FlSpot(6, 1.5),
                      const FlSpot(7, 3),
                    ],
                    isCurved: true,
                    color: Color(0xffFB6D3A),
                    barWidth: 3,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.orange.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
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
    );
  }

  Container _ordersRequest() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.only(left: 18, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),

      width: 156,
      height: 115,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "05",
            style: GoogleFonts.poppins(
              color: Color(0xff32343E),
              fontSize: 52.32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Orders Request",
            style: GoogleFonts.poppins(
              color: Color(0xff838799),
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector _runningOrders() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          isScrollControlled: true,
          showDragHandle: true,

          builder: (context) => Container(
            height: 670,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OrderItemWidget(
                      title: 'ChickenThai Biryani',
                      id: '121212',
                      price: '60',
                      category: "BreakFast",
                    ),
                    OrderItemWidget(
                      title: 'ChickenThai Biryani',
                      id: '121212',
                      price: '60',
                      category: "BreakFast",
                    ),
                    OrderItemWidget(
                      title: 'ChickenThai Biryani',
                      id: '121212',
                      price: '60',
                      category: "BreakFast",
                    ),
                    OrderItemWidget(
                      title: 'ChickenThai Biryani',
                      id: '121212',
                      price: '60',
                      category: "BreakFast",
                    ),
                    OrderItemWidget(
                      title: 'ChickenThai Biryani',
                      id: '121212',
                      price: '60',
                      category: "BreakFast",
                    ),
                    OrderItemWidget(
                      title: 'ChickenThai Biryani',
                      id: '121212',
                      price: '60',
                      category: "BreakFast",
                    ),
                    OrderItemWidget(
                      title: 'ChickenThai Biryani',
                      id: '121212',
                      price: '60',
                      category: "BreakFast",
                    ),
                    OrderItemWidget(
                      title: 'ChickenThai Biryani',
                      id: '121212',
                      price: '60',
                      category: "BreakFast",
                    ),
                    OrderItemWidget(
                      title: 'ChickenThai Biryani',
                      id: '121212',
                      price: '60',
                      category: "BreakFast",
                    ),
                    OrderItemWidget(
                      title: 'ChickenThai Biryani',
                      id: '121212',
                      price: '60',
                      category: "BreakFast",
                    ),
                    OrderItemWidget(
                      title: 'ChickenThai Biryani',
                      id: '121212',
                      price: '60',
                      category: "BreakFast",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.only(left: 18, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),

        width: 156,
        height: 115,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "20",
              style: GoogleFonts.poppins(
                color: Color(0xff32343E),
                fontSize: 52.32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Running Orders",
              style: GoogleFonts.poppins(
                color: Color(0xff838799),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
