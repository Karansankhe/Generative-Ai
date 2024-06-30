import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthcare_app/data/soundscape_data.dart';
import 'package:healthcare_app/data/stories_data.dart';
import 'package:healthcare_app/models/soundscape_model.dart';
import 'package:healthcare_app/models/stories_model.dart';
import 'package:healthcare_app/pages/diary/myJournal.dart';
import 'package:healthcare_app/pages/searchDoctors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lottie/lottie.dart';

class MentalHealth extends StatelessWidget {
  const MentalHealth({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Welcome", style: TextStyle(fontSize: 15)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Find time\nfor yourself",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 30),
          Carousel(),
          const SizedBox(height: 40),
          const Journal(),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Explore by content",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.maxFinite,
            height: 220,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: HexColor("#211951"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Expanded(
                      child: Lottie.asset(
                          "assets/animations/Animation - 1719406109119.json",
                          repeat: true)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.32,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: HexColor("#211951"),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Expanded(
                            child: Lottie.asset(
                                "assets/animations/polar-bear.json",
                                repeat: true)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.32,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          color: HexColor("#211951"),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Expanded(
                            child: Lottie.asset(
                                "assets/animations/Animation - 1719407496679.json",
                                repeat: true)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Podcasts",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text("See All",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const VideoBanner(),
          const SizedBox(height: 10),
          const VideoBanner(),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Soundscapes",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text("See All",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 20),
                ...soundscapeList.map(
                    (soundScape) => SoundScapesWidget(soundScape: soundScape)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Stories",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text("See All",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 20),
                ...storiesList.map(
                  (story) => StoryWidget(story: story),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const TalkToTherapist(),
        ],
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  final List<Widget> carouselElements = [
    const CarouselElement(
      imagePath:
          'assets/images/free-photo-of-milky-way-in-the-night-sky.jpeg',
    ),
    const CarouselElement(
      imagePath:
      'assets/images/free-photo-of-milky-way-in-the-night-sky.jpeg',
    ),
    const CarouselElement(
      imagePath:
      'assets/images/free-photo-of-milky-way-in-the-night-sky.jpeg',
    ),
    const CarouselElement(
      imagePath:
      'assets/images/free-photo-of-milky-way-in-the-night-sky.jpeg',
    ),
  ];

  Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 350,
        aspectRatio: 16 / 9,
        viewportFraction: 0.7,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
        // enlargeStrategy: CenterPageEnlargeStrategy.,
      ),
      items: carouselElements,
    );
  }
}

class CarouselElement extends StatelessWidget {
  const CarouselElement({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(255, 255, 255, 0.5),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Feel the life",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Close eyes. Breathe. Imagine that you can be anywhere in the world where would you like to be?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Let's go",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TalkToTherapist extends StatelessWidget {
  const TalkToTherapist({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              HexColor("#F0F3FF"),
              HexColor("#F0F3FF"),
            ],
          )),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            width: 200,
            child: Image.asset(
              "assets/images/boy-and-girl-giving-high-five-to-each-other.png",
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Feeling upset?\nTalk to a\ntherapist.",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchDoctors(),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Start a Conversation",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class VideoBanner extends StatelessWidget {
  const VideoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: HexColor("#F0F3FF"),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: const Text(
                    "Declutter the noise in your mind",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: FaIcon(FontAwesomeIcons.play, size: 20),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: const Text(
                  "Declutter the noise in your mind ft Alexander",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: FaIcon(FontAwesomeIcons.heart),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              FaIcon(Icons.star, size: 12),
              SizedBox(width: 5),
              Text("4.8"),
              SizedBox(width: 15),
              Text("|"),
              SizedBox(width: 15),
              Text("16.7K views"),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class SoundScapesWidget extends StatelessWidget {
  const SoundScapesWidget({
    super.key,
    required this.soundScape,
  });

  final SoundScape soundScape;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(soundScape.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(soundScape.title,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    super.key,
    required this.story,
  });

  final Story story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(story.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(story.storyTitle,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          Text(story.author, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}

class Journal extends StatelessWidget {
  const Journal({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyJournal(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 241, 249, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FaIcon(FontAwesomeIcons.bookOpen),
            SizedBox(width: 20),
            Text("My Journal",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
