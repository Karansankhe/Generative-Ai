import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthcare_app/pages/activity_tracking.dart';
import 'package:healthcare_app/pages/home.dart';
import 'package:healthcare_app/pages/leaderboard.dart';
import 'package:healthcare_app/pages/mental_health.dart';
import 'package:healthcare_app/pages/workout.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const ActivityTrackingPage(),
    const Leaderboard(),
    const MentalHealth(),
    const WorkoutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color themeColour = const Color.fromARGB(255, 34, 50, 99);

    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions[_selectedIndex],
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(242, 241, 249, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(23, 20, 51, 1),
              ),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/profile.png'), fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Alex Costa",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.diceD20),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Dashboard
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(FontAwesomeIcons.children),
              title: const Text('My Family'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Settings
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.notesMedical),
              title: const Text('Health Records'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Settings
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.capsules),
              title: const Text('Medication Remonders'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Settings
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.stethoscope),
              title: const Text('My Appointments'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(FontAwesomeIcons.shieldHalved),
              title: const Text('Privacy Policy'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Settings
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.hospital),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
                // Sign out logic
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: themeColour,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              _selectedIndex == 0
                  ? FontAwesomeIcons.diceD20
                  : FontAwesomeIcons.diceD20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              _selectedIndex == 1
                  ? FontAwesomeIcons.personRunning
                  : FontAwesomeIcons.personRunning,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              _selectedIndex == 2
                  ? FontAwesomeIcons.trophy
                  : FontAwesomeIcons.trophy,
            ),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              _selectedIndex == 3
                  ? FontAwesomeIcons.heart
                  : FontAwesomeIcons.heart,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              _selectedIndex == 4
                  ? FontAwesomeIcons.dumbbell
                  : FontAwesomeIcons.dumbbell,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
