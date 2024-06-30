import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class MealGroup extends StatelessWidget{
  const MealGroup({super.key, required this.title, required this.calories, required this.icon});

  final String title;
  final int calories;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        // border: Border.all(),
        color: HexColor("#F0F3FF"),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.maxFinite,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: FaIcon(icon, size: 20),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 20,)),
                    Text("$calories calories", style: const TextStyle(fontSize: 15),),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: FaIcon(FontAwesomeIcons.plus, size: 15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            width: double.maxFinite,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FoodElement(title: "Proteins", amount: 62.5),
                FoodElement(title: "Fats", amount: 23.6),
                FoodElement(title: "Carbs", amount: 45.7),
                FoodElement(title: "RDC", amount: 14),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.maxFinite,
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: HexColor("#211951"),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: FaIcon(FontAwesomeIcons.pen, size: 15, color: HexColor("15F5BA"),),
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

class FoodElement extends StatelessWidget{
  const FoodElement({super.key, required this.title, required this.amount});

  final String title;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          Text(amount.toString(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

}