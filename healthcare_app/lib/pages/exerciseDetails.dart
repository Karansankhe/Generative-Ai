import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import '../models/exercise_model.dart';

class ExerciseDetails extends StatelessWidget {
  const ExerciseDetails({super.key, required this.exercise});

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(242, 241, 249, 1),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.chevronLeft,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: Center(
              child: Lottie.asset(
                exercise.imagePath,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              exercise.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              exercise.description,
              style: const TextStyle(fontSize: 15,),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(23, 20, 51, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          const Text(
                            "Category",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            exercise.category,
                            style: const TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(23, 20, 51, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          const Text(
                            "Difficulty",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            exercise.difficulty,
                            style: const TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
