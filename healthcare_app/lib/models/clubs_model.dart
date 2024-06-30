class ClubsModel {
  final String clubName;
  final int participantCount;
  final String imagePath;
  final String description;
  final String contactInfo;
  final List<String> activities;
  final DateTime establishedDate;

  ClubsModel({
    required this.clubName,
    required this.participantCount,
    required this.imagePath,
    required this.description,
    required this.contactInfo,
    required this.activities,
    required this.establishedDate,
  });
}