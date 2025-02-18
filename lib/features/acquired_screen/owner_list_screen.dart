import 'package:flutter/material.dart';
import 'package:dreamhome_architect/features/acquired_screen/model.dart';

class OwnersListScreen extends StatelessWidget {
  final List<Owner> owners;

  const OwnersListScreen({super.key, required this.owners});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Owners List"),
        centerTitle: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: owners.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final owner = owners[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(owner.imageUrl),
            ),
            title: Text(owner.name),
            subtitle: Text("Revenue: \$${owner.revenue}"),
          );
        },
      ),
    );
  }
}
