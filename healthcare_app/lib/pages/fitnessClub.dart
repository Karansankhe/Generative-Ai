import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:healthcare_app/models/clubs_model.dart';

class FitnessClub extends StatelessWidget {
  const FitnessClub({super.key, required this.club});

  final ClubsModel club;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(club.clubName),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    club.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 400,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                club.clubName,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Established: ${DateFormat.yMMMMd().format(club.establishedDate)}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                club.description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                club.contactInfo,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                'Activities',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8.0),
              ...club.activities.map(
                    (activity) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Color.fromRGBO(23, 20, 51, 1),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        activity,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  const Icon(
                    Icons.group,
                    color: Color.fromRGBO(23, 20, 51, 1),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '${club.participantCount} Participants',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Center(
                child: Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    'Join Club',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
