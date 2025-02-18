import 'package:dreamhome_architect/features/view_home_plan/home_plan_card.dart';
import 'package:flutter/material.dart';

class ViewHomeplan extends StatelessWidget {
  const ViewHomeplan({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => HomePlanCard(
                    onEdit: () {},
                    onDelete: () {},
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 8,
                  ),
              itemCount: 5)
        ],
      ),
    );
  }
}
