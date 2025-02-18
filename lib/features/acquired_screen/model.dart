class HomePlan {
  final String name;
  final String description;
  final String imageUrl;
  final List<Owner> owners;

  HomePlan({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.owners,
  });
}

class Owner {
  final String name;
  final String imageUrl;
  final int revenue;

  Owner({
    required this.name,
    required this.imageUrl,
    required this.revenue,
  });
}
