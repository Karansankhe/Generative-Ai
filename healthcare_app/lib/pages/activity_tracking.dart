import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:hexcolor/hexcolor.dart';

class ActivityTrackingPage extends StatelessWidget {
  const ActivityTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Report",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      Text(
                        "Today, 25 August",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CalenderElement(day: "Mon", date: 20),
                  CalenderElement(day: "Tue", date: 21),
                  CalenderElement(day: "Thur", date: 22),
                  CalenderElement(day: "Fri", date: 23),
                  CalenderElement(day: "Sat", date: 24),
                  CalenderElement(day: "Sun", date: 25),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const PedoMeter(),
            const SizedBox(height: 20),
            const Text(
              "Health Metrics",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActivityMetric(
                  title: "Heart beat",
                  icon: FontAwesomeIcons.heartPulse,
                  status: "Normal",
                  value: 170,
                  unit: "bpm",
                  imagePath: "assets/icons/heart.png",
                ),
                SizedBox(width: 15),
                ActivityMetric(
                  title: "Weight",
                  icon: FontAwesomeIcons.weightScale,
                  status: "Ideal",
                  value: 74,
                  unit: "kg",
                  imagePath: "assets/icons/weight-scale.png",
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActivityMetric(
                  title: "Sleep",
                  icon: FontAwesomeIcons.cloudMoon,
                  status: "Normal",
                  value: 8,
                  unit: "hrs",
                  imagePath: "assets/icons/sleep.png",
                ),
                SizedBox(width: 15),
                ActivityMetric(
                  title: "Blood\nPressure",
                  icon: FontAwesomeIcons.droplet,
                  status: "Ideal",
                  value: 58,
                  unit: "mg/Hg",
                  imagePath: "assets/icons/blood-drop.png",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PedoMeter extends StatelessWidget {
  const PedoMeter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        // border: Border.all(color: Colors.grey),
        color: HexColor("#F0F3FF"),
      ),
      child: const Center(
        child: PedometerGauge(
          steps: 7000, // Example step count
          stepGoal: 10000, // Example step goal
        ),
      ),
    );
  }
}

class PedometerGauge extends StatelessWidget {
  final int steps;
  final int stepGoal;

  const PedometerGauge({
    super.key,
    required this.steps,
    required this.stepGoal,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (steps / stepGoal) * 100;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              child: SfRadialGauge(
                enableLoadingAnimation: false,
                axes: <RadialAxis>[
                  RadialAxis(
                    startAngle: 180,
                    endAngle: 0,
                    showTicks: false,
                    showLabels: false,
                    radiusFactor: 0.9,
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.2,
                      thicknessUnit: GaugeSizeUnit.factor,
                      color: Colors.grey.shade300,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: progress,
                        width: 0.2,
                        sizeUnit: GaugeSizeUnit.factor,
                        gradient: SweepGradient(
                          colors: [
                            HexColor("#836FFF"),
                            HexColor("15F5BA"),
                          ],
                          stops: const [0.0, 1.0],
                        ),
                        cornerStyle: CornerStyle.bothCurve,
                      ),
                      MarkerPointer(
                        value: progress,
                        markerType: MarkerType.circle,
                        color: Colors.greenAccent,
                        markerHeight: 20,
                        markerWidth: 20,
                      ),
                    ],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$steps',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: HexColor("#211951"),
                              ),
                            ),
                            Text(
                              'steps',
                              style: TextStyle(
                                fontSize: 20,
                                color: HexColor("#211951"),
                              ),
                            ),
                            // SizedBox(height: 10),
                            Text(
                              'Goal: $stepGoal steps',
                              style: TextStyle(
                                fontSize: 16,
                                color:HexColor("#211951"),
                              ),
                            ),
                          ],
                        ),
                        positionFactor: 0.4,
                        angle: 90,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            LinearProgressIndicator(
              value: steps / stepGoal,
              minHeight: 10,
              backgroundColor: Colors.grey.shade300,
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(30),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ActivityMetric extends StatelessWidget {
  const ActivityMetric(
      {super.key,
      required this.title,
      required this.icon,
      required this.status,
      required this.value,
      required this.unit,
      required this.imagePath});

  final String title;
  final IconData icon;
  final String status;
  final int value;
  final String unit;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 180,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: HexColor("#F0F3FF"),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w600)),
                Image.asset(
                  imagePath,
                  width: 35,
                ),
                // FaIcon(icon),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(value.toString(),
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.w700)),
                const SizedBox(width: 5),
                Text(unit, style: const TextStyle(fontSize: 15)),
              ],
            ),
            Container(
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(161, 234, 147, 1),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    status,
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalenderElement extends StatelessWidget {
  const CalenderElement({super.key, required this.day, required this.date});

  final String day;
  final int date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      decoration: BoxDecoration(
        // border: Border.all(),
        borderRadius: BorderRadius.circular(18),
        color: HexColor("#211951"),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(day,
              style:
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white)),
          Text(date.toString(),
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
        ],
      ),
    );
  }
}
