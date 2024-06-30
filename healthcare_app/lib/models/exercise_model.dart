class Exercise {
  final String name;
  final String category;
  final int duration; // in minutes
  final String difficulty; // Easy, Medium, Hard
  final String description;
  final String imagePath;

  Exercise({
    required this.name,
    required this.category,
    required this.duration,
    required this.difficulty,
    required this.description,
    required this.imagePath,
  });
}
