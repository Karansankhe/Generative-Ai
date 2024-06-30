import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthcare_app/data/clubs_data.dart';
import 'package:healthcare_app/data/exercise_data.dart';
import 'package:healthcare_app/models/clubs_model.dart';
import 'package:healthcare_app/models/exercise_model.dart';
import 'package:healthcare_app/pages/exerciseDetails.dart';
import 'package:healthcare_app/pages/fitnessClub.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {

    String currentCategory = "Yoga";

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
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
                      child: FaIcon(FontAwesomeIcons.bars, size: 15,),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(242, 241, 249, 1),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 15,),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Fitness Club",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 20),
                ...clubsData.map((club) => ClubBanner(club: club)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 20),
                ...exerciseCategories
                    .map((item) => CategoryElement(imagePath: item[1])),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: const Text(
              "For You",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 10),
          ...customExercises.map((exercise) => WorkoutPlan(exercise: exercise)),
        ],
      ),
    );
  }
}

class ClubBanner extends StatelessWidget {
  const ClubBanner({
    super.key,
    required this.club,
  });

  final ClubsModel club;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FitnessClub(club: club)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        height: MediaQuery.of(context).size.height * 0.35,
        margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: AssetImage(club.imagePath), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(club.clubName,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
            Row(
              children: [
                const FaIcon(FontAwesomeIcons.user,
                    size: 15, color: Colors.white),
                const SizedBox(width: 5),
                Text(club.participantCount.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white)),
              ],
            ),
            const Spacer(),
            Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(23, 20, 51, 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text("Join",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryElement extends StatelessWidget {
  const CategoryElement({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(127, 227, 240, 1),
        shape: BoxShape.circle,
      ),
      child: Center(
          child: Image.asset(
        imagePath,
        height: 30,
      )),
    );
  }
}

class WorkoutPlan extends StatelessWidget {
  const WorkoutPlan({
    super.key,
    required this.exercise,
  });

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: HexColor("#F0F3FF"),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(exercise.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExerciseDetails(exercise: exercise,),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: const Color.fromRGBO(23, 20, 51, 1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const FaIcon(FontAwesomeIcons.play, size: 15, color: Colors.white),
                        const SizedBox(width: 10),
                        Text("${exercise.duration} min",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Lottie.asset(
              exercise.imagePath,
            ),
          ),
        ],
      ),
    );
  }
}
