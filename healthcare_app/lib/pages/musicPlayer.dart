import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

const Color primary = Color.fromRGBO(23, 20, 51, 1);
const Color secondary1 = Color.fromRGBO(113, 104, 211, 1);
const Color secondary2 = Color.fromRGBO(126, 228, 240, 1);
const Color neutral = Color.fromRGBO(242, 241, 249, 1);

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        actions: [
          GestureDetector(
            onTap: () {},
            child: const SizedBox(
              width: 40,
              child: Center(
                child: FaIcon(FontAwesomeIcons.ellipsisVertical),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text(
            "Title",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: neutral),
          ),
          const SizedBox(height: 20),
          Carousel(),
          const SizedBox(height: 30),
          const Text(
            "Song Name",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: neutral),
          ),
          const Text(
            "Title",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: neutral),
          ),
          const MusicSlider(),
          const SizedBox(height: 50),
          const ControlButtons(),
        ],
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  Carousel({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 400,
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
          ),
          items: carouselElements,
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
      decoration: BoxDecoration(
        color: secondary1,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.replay, color: Colors.white),
          onPressed: () {
            // Handle repeat button press
          },
        ),
        IconButton(
          icon: const Icon(Icons.skip_previous, color: Colors.white),
          onPressed: () {
            // Handle previous button press
          },
        ),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.pause, color: Colors.white),
            onPressed: () {
              // Handle play/pause button press
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.skip_next, color: Colors.white),
          onPressed: () {
            // Handle next button press
          },
        ),
        IconButton(
          icon: const Icon(Icons.download, color: Colors.white),
          onPressed: () {
            // Handle download button press
          },
        ),
      ],
    );
  }
}

class MusicSlider extends StatefulWidget {
  const MusicSlider({super.key});

  @override
  MusicSliderState createState() => MusicSliderState();
}

class MusicSliderState extends State<MusicSlider> {
  double _currentSliderValue = 75.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SfSlider(
            min: 0.0,
            max: 192.0,
            value: _currentSliderValue,
            interval: 48,
            showTicks: false,
            showLabels: false,
            enableTooltip: false,
            onChanged: (dynamic value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
            activeColor: secondary1,
            inactiveColor: secondary2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatDuration(Duration(seconds: _currentSliderValue.round())),
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                formatDuration(const Duration(seconds: 192)),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inMinutes)}:$twoDigitSeconds";
  }
}