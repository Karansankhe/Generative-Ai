import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Hey there!", style: TextStyle(fontSize: 15)),
              Text(
                userName,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
