import 'dart:math';
import 'package:flutter/material.dart';
import 'action_buttons.dart';
import 'back_view.dart';
import 'front_view.dart';
import 'search_and_menu.dart';

class MyJournal extends StatefulWidget {
  const MyJournal({super.key});

  @override
  State<MyJournal> createState() => _MyJournalState();
}

class _MyJournalState extends State<MyJournal> with TickerProviderStateMixin {
  bool isFrontView = true;

  late AnimationController controller;

  switchView() {
    setState(() {
      if (isFrontView) {
        controller.forward();
      } else {
        controller.reverse();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {

    int month = DateTime.now().month;


    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // search and menu
            const SearchAndMenu(),
            const SizedBox(height: 30.0),

            // year selector
            DropdownButton(
              value: '2024',
              items: const [
                DropdownMenuItem(value: '2023', child: Text('2023')),
                DropdownMenuItem(value: '2024', child: Text('2024')),
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 30.0),

            // month cards
            Container(
              padding: const EdgeInsets.symmetric(vertical: 22.0),
              height: MediaQuery.of(context).size.height*0.55,
              child: PageView.builder(
                controller: PageController(
                  initialPage: month,
                  viewportFraction: 0.78,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: 12, // for 12 months
                itemBuilder: (_, i) => AnimatedBuilder(
                    animation: controller,
                    builder: (_, child) {
                      if (controller.value >= 0.5) {
                        isFrontView = false;
                      } else {
                        isFrontView = true;
                      }

                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(controller.value * pi),
                        alignment: Alignment.center,
                        child: isFrontView
                            ? FrontView(monthIndex: i + 1)
                            : Transform(
                                transform: Matrix4.rotationY(pi),
                                alignment: Alignment.center,
                                child: BackView(
                                  monthIndex: i + 1,
                                ),
                              ),
                      );
                    }),
              ),
            ),

            const Spacer(),
            // action buttons
            ActionButtons(change: switchView),
            const SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}
