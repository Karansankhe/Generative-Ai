import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/story_data.dart';
import '../models/story_model.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final StoryModel story = storyData[0];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 20, 51, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 20, 51, 1),
        actions: const [
          SizedBox(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(FontAwesomeIcons.bookmark),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(story.title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),),
                Text(story.author, style: const TextStyle(color: Colors.white, fontSize: 15),),
                const SizedBox(height: 15),
                Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(image: AssetImage("assets/images/oldManAndTheSea.jpg"), fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 15),
                const Text("Summary", style: TextStyle(color: Colors.white, fontSize: 15),),
                const SizedBox(height: 15),
                Text(story.text, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 15),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
