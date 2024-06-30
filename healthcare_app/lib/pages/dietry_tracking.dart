import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DietryTrackingPage extends StatelessWidget {
  const DietryTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Calories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Week Days", style: TextStyle(fontSize: 15)),
                  const Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(242, 241, 249,1),
                    ),
                    child: const Center(child: FaIcon(FontAwesomeIcons.calendar, size: 25,)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: double.maxFinite,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeekDay(day: "M", date: 12),
                  WeekDay(day: "T", date: 13),
                  WeekDay(day: "W", date: 14),
                  WeekDay(day: "T", date: 15),
                  WeekDay(day: "F", date: 16),
                  WeekDay(day: "S", date: 17),
                  WeekDay(day: "S", date: 18),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: const Row(
                children: [
                  Text("Calorie Left", style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                // border: Border.all(),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("1230", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700)),
                  SizedBox(width: 5),
                  Text("kcal", style: TextStyle(fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: double.maxFinite,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                // border: Border.all()
              ),
              child: const Row(
                children: [
                  FoodItem(),
                  SizedBox(width: 15),
                  FoodItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WeekDay extends StatelessWidget {
  const WeekDay({super.key, required this.day, required this.date});

  final String day;
  final int date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.11,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(day, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
          Container(
            width: MediaQuery.of(context).size.width * 0.12,
            height: 150,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(242, 241, 249,1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(23, 20, 51, 1),
                    )),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(126, 228, 240, 1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(113, 104, 211, 1),
                        ),
                        child: Center(
                          child: Text(date.toString(), style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),),
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItem extends StatelessWidget{
  const FoodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 241, 249,1),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Taco", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                FaIcon(FontAwesomeIcons.ellipsisVertical),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(23, 20, 51, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("635", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                    Text("Calories")
                  ],
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(23, 20, 51, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("635", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                    Text("Calories")
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}
