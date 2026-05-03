import 'package:flutter/material.dart';

class OrderItemWidget extends StatelessWidget {
  final String title;
  final String id;
  final String price;
  final String category;
  final String imageUrl;

  const OrderItemWidget({
    super.key,
    required this.title,
    required this.id,
    required this.price,
    required this.category,
    this.imageUrl = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Image Placeholder
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: const Color(0xFF94A3B8), // Image color from your design
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(width: 12),

          // 2. Details Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Color(0xFF1E293B),
                  ),
                ),
                Text(
                  "ID: $id",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$$price",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Buttons
                    Row(
                      children: [
                        _buildActionButton("Done", Colors.orange, Colors.white),
                        const SizedBox(width: 8),
                        _buildActionButton(
                          "Cancel",
                          Colors.white,
                          Colors.orange,
                          isBorder: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for Done/Cancel buttons
  Widget _buildActionButton(
    String label,
    Color bgColor,
    Color textColor, {
    bool isBorder = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: isBorder ? Border.all(color: Colors.orange.shade200) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
