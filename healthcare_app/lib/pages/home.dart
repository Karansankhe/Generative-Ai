import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthcare_app/components/meal_group.dart';
import 'package:healthcare_app/components/home_header.dart';
import 'package:healthcare_app/pages/dietry_tracking.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          const HomeHeader(userName: "Alex Costa"),
          const SizedBox(height: 20),
          Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
            decoration: BoxDecoration(
              color: HexColor("#F0F3FF"),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: FaIcon(FontAwesomeIcons.penToSquare, size: 20),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("Your Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                      ],
                    ),
                    // SizedBox(height: 15),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration:  BoxDecoration(
                            border: Border.all(),
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("Steps Goal", style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration:  BoxDecoration(
                            border: Border.all(),
                            color: HexColor("#fa95e3"),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("Calories Burnt", style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration:  BoxDecoration(
                            border: Border.all(),
                            color: HexColor("#75e4eb"),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text("Water Consumed", style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
                const CustomGauge(),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Carousel(),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Meter(title: "Water\nIntake", measurement: 1.2, unit: "L", percentage: 33.2, imagePath: "assets/icons/water-gallon.png"),
                SizedBox(width: 20),
                Meter(title: "Today's\nCalories", measurement: 1278, unit: "kcal", percentage: 15.28, imagePath: "assets/icons/calorie-calculation.png")
              ],
            ),
          ),
          const SizedBox(height: 25),
          const MealGroup(
              title: 'Breakfast', calories: 350, icon: Icons.wb_sunny_outlined),
          const SizedBox(height: 25),
          const MealGroup(
              title: 'Lunch', calories: 1280, icon: Icons.wb_sunny_outlined),
          const SizedBox(height: 25),
          const MealGroup(
              title: 'Dinner', calories: 1280, icon: CupertinoIcons.moon),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(23, 20, 51, 1),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.plus,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}

class Meter extends StatelessWidget {
  const Meter(
      {super.key,
      required this.title,
      required this.measurement,
      required this.unit,
      required this.percentage, required this.imagePath});

  final String title;
  final double measurement;
  final String unit;
  final double percentage;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DietryTrackingPage(),
            ),
          );
        },
        child: Container(
          height: 160,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: HexColor("#F0F3FF"),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: const TextStyle(fontSize: 15)),
                  Image.asset(
                    imagePath,
                    width: 35,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(measurement.toString(),
                      style:
                          const TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                  const SizedBox(width: 5),
                  Text(unit, style: const TextStyle(fontSize: 15)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/gauge.png",
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  Text("${percentage.toString()} %",
                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  const Spacer(),
                  const FaIcon(FontAwesomeIcons.chevronRight, size: 15,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<Widget> carouselElements = [
    const CarouselElement(),
    const CarouselElement(),
    const CarouselElement(),
    const CarouselElement(),
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
            // enlargeStrategy: CenterPageEnlargeStrategy.,
            onPageChanged: (index, reason) {
              setState(() {
                _pageIndex = index;
              });
            },
          ),
          items: carouselElements,
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselIndicator(
              count: carouselElements.length,
              index: _pageIndex,
              height: 4,
              width: 15,
              cornerRadius: 20,
              activeColor: Colors.black,
              space: 8.0,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}

class CarouselElement extends StatelessWidget {
  const CarouselElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(),
        color: const Color.fromRGBO(23, 20, 51, 1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          const SizedBox(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Train Your Body & Mind",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                Text(
                  "Read More",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            child: Center(
              child: Lottie.asset("assets/animations/runner2.json"),
            ),
          )
        ],
      ),
    );
  }
}

class CustomGauge extends StatelessWidget {
  const CustomGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Center(child: Lottie.asset("assets/animations/gradient3.json", width: 60)),
        SizedBox(
          height: MediaQuery.of(context).size.width*0.6,
          width: MediaQuery.of(context).size.width*0.4,
          child: SfRadialGauge(
            enableLoadingAnimation: true,
            axes: <RadialAxis>[
              RadialAxis(
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                radiusFactor: 0.95,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.05,
                  color: Colors.grey[300],
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: const <GaugePointer>[
                  RangePointer(
                    value: 65,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: Colors.yellow,
                    cornerStyle: CornerStyle.bothCurve,
                  ),
                ],
              ),
              RadialAxis(
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                radiusFactor: 0.85,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.06,
                  color: Colors.grey[300],
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: 60,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: HexColor("#fa95e3"),
                    cornerStyle: CornerStyle.bothCurve,
                  ),
                ],
              ),
              RadialAxis(
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                radiusFactor: 0.75,
                axisLineStyle: AxisLineStyle(
                  thickness: 0.07,
                  color: Colors.grey[300],
                  thicknessUnit: GaugeSizeUnit.factor,
                ),
                pointers: <GaugePointer>[
                  RangePointer(
                    value: 50,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: HexColor("#75e4eb"),
                    cornerStyle: CornerStyle.bothCurve,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
