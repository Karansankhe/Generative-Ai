import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class ProfileSetup extends StatelessWidget {
  const ProfileSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: LinearProgressIndicator(
                value: 1 / 10,
                minHeight: 10,
                backgroundColor: Colors.grey.shade300,
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Gender",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Help us to create your\npersonalized plan",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const SelectGender(),
            const SelectAge(),
            HeightSelector(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.arrow_back_ios, size: 15),
                        Text("Prev"),
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Next"),
                        Icon(Icons.arrow_forward_ios, size: 15),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectGender extends StatelessWidget {
  const SelectGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Male",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Female",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SelectAge extends StatelessWidget {
  const SelectAge({super.key});

  @override
  Widget build(BuildContext context) {
    return const WheelPickerExample();
  }
}

class WheelPickerExample extends StatefulWidget {
  const WheelPickerExample({super.key});

  @override
  State<WheelPickerExample> createState() => _WheelPickerExampleState();
}

class _WheelPickerExampleState extends State<WheelPickerExample> {
  int selectedItem = 32;

  @override
  Widget build(BuildContext context) {
    final wheelController = WheelPickerController(
      itemCount: 9,
      initialIndex: 4,
    );

    const textStyle = TextStyle(fontSize: 32.0, height: 1.5);
    final wheelStyle = WheelPickerStyle(
      size: 500,
      itemExtent: textStyle.fontSize! * textStyle.height!,
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );

    return WheelPicker(
      builder: (context, index) {
        final itemValue = index + 28;
        return Text(
          itemValue.toString(),
          style: TextStyle(
            fontSize: 32,
            color: itemValue == selectedItem ? Colors.cyan : Colors.grey,
            fontWeight:
                itemValue == selectedItem ? FontWeight.bold : FontWeight.normal,
          ),
        );
      },
      controller: wheelController,
      selectedIndexColor: Colors.blue,
      onIndexChanged: (index) {
        setState(() {
          selectedItem = index + 28;
        });
      },
      style: wheelStyle,
    );
  }
}

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  int selectedFeet = 5;
  int selectedInches = 7;

  @override
  Widget build(BuildContext context) {
    final feetController = WheelPickerController(
      itemCount: 8,  // from 0 to 7 feet
      initialIndex: selectedFeet,
    );

    final inchesController = WheelPickerController(
      itemCount: 12,  // from 0 to 11 inches
      initialIndex: selectedInches,
    );

    const textStyle = TextStyle(fontSize: 24.0, height: 1.5);
    final wheelStyle = WheelPickerStyle(
      size: 300,
      itemExtent: textStyle.fontSize! * textStyle.height!,
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Feet', style: textStyle),
            WheelPicker(
              builder: (context, index) {
                return Text(
                  index.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: index == selectedFeet ? Colors.cyan : Colors.grey,
                    fontWeight: index == selectedFeet ? FontWeight.bold : FontWeight.normal,
                  ),
                );
              },
              controller: feetController,
              selectedIndexColor: Colors.blue,
              onIndexChanged: (index) {
                setState(() {
                  selectedFeet = index;
                });
              },
              style: wheelStyle,
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Inches', style: textStyle),
            WheelPicker(
              builder: (context, index) {
                return Text(
                  index.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: index == selectedInches ? Colors.cyan : Colors.grey,
                    fontWeight: index == selectedInches ? FontWeight.bold : FontWeight.normal,
                  ),
                );
              },
              controller: inchesController,
              selectedIndexColor: Colors.blue,
              onIndexChanged: (index) {
                setState(() {
                  selectedInches = index;
                });
              },
              style: wheelStyle,
            ),
          ],
        ),
      ],
    );
  }
}
