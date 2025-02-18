import 'package:dreamhome_architect/features/view_home_plan/feature_card.dart';
import 'package:flutter/material.dart';

class HomePlanCard extends StatelessWidget {
  final Function() onEdit;
  final Function() onDelete;

  const HomePlanCard({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  'https://img.freepik.com/free-photo/3d-electric-car-building_23-2148972401.jpg?t=st=1739425386~exp=1739428986~hmac=24232826ac755ed6be79eaf7a2029586a265a5f0c2451bbe97a18830ec3f867c&w=1060',
                  fit: BoxFit.cover,
                  height: 180,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "32 Owned",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "HomePlan Name",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "description",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  '\$647',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FeatureCard(
                      text: "4 Beds",
                      icon: Icons.bed,
                    ),
                    FeatureCard(
                      icon: Icons.bathtub,
                      text: "2 Bath",
                    ),
                    FeatureCard(
                      icon: Icons.directions_car,
                      text: "1 Parking",
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
}
