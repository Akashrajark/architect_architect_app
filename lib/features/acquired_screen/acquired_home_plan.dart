import 'package:dreamhome_architect/common_widgets.dart/custom_button.dart';
import 'package:dreamhome_architect/features/acquired_screen/model.dart';
import 'package:dreamhome_architect/features/acquired_screen/owner_list_screen.dart';
import 'package:flutter/material.dart';

class AcquiredHomePlanWidget extends StatelessWidget {
  final HomePlan homePlan;

  const AcquiredHomePlanWidget({super.key, required this.homePlan});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(12), // Curved image border
                  child: Image.network(
                    homePlan.imageUrl,
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${homePlan.owners.length} Owners',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              homePlan.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(homePlan.description),
            const SizedBox(height: 10),
            CustomButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OwnersListScreen(owners: homePlan.owners),
                ),
              ),
              label: 'View Owners',
            ),
          ],
        ),
      ),
    );
  }
}
