import 'package:flutter/material.dart';
import 'package:dreamhome_architect/features/acquired_screen/acquired_home_plan.dart';
import 'package:dreamhome_architect/features/acquired_screen/model.dart';

class AcquiredScreen extends StatelessWidget {
  AcquiredScreen({super.key});

  // Dummy data for home plans
  final List<HomePlan> homePlans = [
    HomePlan(
      name: 'Modern Villa',
      description: 'A luxurious modern villa with 5 bedrooms and a pool.',
      imageUrl: 'https://images6.alphacoders.com/343/thumb-1920-343179.jpg',
      owners: [
        Owner(
          name: 'John Doe',
          imageUrl:
              'https://www.shutterstock.com/image-photo/young-confident-handsome-man-full-260nw-1416442523.jpg',
          revenue: 120000,
        ),
        Owner(
          name: 'Jane Smith',
          imageUrl:
              'https://i.pinimg.com/originals/ca/0f/ab/ca0fab980a0e70a23bb782fe32a95058.jpg',
          revenue: 150000,
        ),
      ],
    ),
    HomePlan(
      name: 'Cozy Cottage',
      description: 'A small and cozy cottage perfect for a weekend getaway.',
      imageUrl:
          'https://i.pinimg.com/originals/f2/77/0a/f2770a7e835538b9662a47d111e52452.jpg',
      owners: [
        Owner(
          name: 'Alice Johnson',
          imageUrl:
              'https://cgfaces.com/collection/1024px/193ce738-8f83-4866-91ed-398fae7430ab.jpg',
          revenue: 80000,
        ),
      ],
    ),
    HomePlan(
      name: 'Modern Villa',
      description: 'A luxurious modern villa with a stunning ocean view.',
      imageUrl:
          'https://s3-us-west-1.amazonaws.com/realestatesites.com/stock/slider/beautiful-home1.jpg',
      owners: [
        Owner(
          name: 'Michael Carter',
          imageUrl:
              'https://png.pngtree.com/background/20230424/original/pngtree-an-asian-man-with-an-shocked-face-on-the-street-picture-image_2458073.jpg',
          revenue: 120000,
        ),
      ],
    ),
    HomePlan(
      name: 'Rustic Cabin',
      description: 'A charming wooden cabin in the heart of the mountains.',
      imageUrl: 'https://images7.alphacoders.com/341/341475.jpg',
      owners: [
        Owner(
          name: 'Sarah Thompson',
          imageUrl:
              'https://cdn.pixabay.com/photo/2021/06/11/12/26/woman-6328478_1280.jpg',
          revenue: 95000,
        ),
      ],
    ),
    HomePlan(
      name: 'Urban Loft',
      description: 'A sleek and stylish loft in the heart of the city.',
      imageUrl:
          'https://i.pinimg.com/originals/0c/c3/c3/0cc3c33133c28423ced7138b976b7d0b.jpg',
      owners: [
        Owner(
          name: 'David Reynolds',
          imageUrl:
              'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          revenue: 110000,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: homePlans.length,
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemBuilder: (context, index) => AcquiredHomePlanWidget(
        homePlan: homePlans[index],
      ),
    );
  }
}
