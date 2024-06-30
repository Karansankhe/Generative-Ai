import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(height: 40),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text("1425 XP"),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const TopThreeBanner(),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: const Center(
            child: Text("Emerald League",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
          ),
        ),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
        const Text("Promotion Zone",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
        const Text("Demotion Zone",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
        const LeagueMember(name: 'Alex Costa', diff: 5, arrow: true),
      ]),
    );
  }
}

class TopThreeBanner extends StatelessWidget {
  const TopThreeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          // border: Border.all(),
          ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TopThree(
            name: "Alex Costa",
            radius: 45,
            position: 2,
          ),
          TopThree(
            name: "Alex Costa",
            radius: 70,
            position: 1,
          ),
          TopThree(
            name: "Alex Costa",
            radius: 45,
            position: 3,
          ),
        ],
      ),
    );
  }
}

class TopThree extends StatelessWidget {
  const TopThree(
      {super.key,
      required this.name,
      required this.radius,
      required this.position});

  final String name;
  final double radius;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: const AssetImage("assets/images/profile.png"),
        ),
        const SizedBox(height: 3),
        Text(position.toString(),
            style:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        Text(name,
            style:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class LeagueMember extends StatelessWidget {
  const LeagueMember(
      {super.key, required this.name, required this.diff, required this.arrow});

  final String name;
  final int diff;
  final bool arrow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.maxFinite,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            foregroundImage: AssetImage('assets/images/profile.png'),
          ),
          const SizedBox(width: 15),
          Text(name,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          const Spacer(),
          const Text("4",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          const SizedBox(width: 5),
          arrow ? const Icon(FontAwesomeIcons.caretUp) : const Icon(FontAwesomeIcons.caretDown),
        ],
      ),
    );
  }
}
