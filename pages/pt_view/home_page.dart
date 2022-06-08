import 'package:flutter/material.dart';
import 'package:mda9_2/main.dart';
import 'package:mda9_2/pages/pt_view/pt_consult_page.dart';
import 'package:mda9_2/pages/gallery_page.dart';
import 'package:mda9_2/pages/pt_view/pt_profile_page.dart';
import 'package:mda9_2/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, title = 'Diagnostic Home Page'}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final List<Widget> _screens = [
    const SettingsPage(),
    ProfilePage(),
    const MDACameraOverlay(),
    const GalleryPage(),
    const ConsultPage()
  ];

  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey[900],
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.blueGrey,
        unselectedLabelStyle: const TextStyle(color: Colors.white70),
        selectedLabelStyle: const TextStyle(color: Colors.blueGrey),
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.workspaces_filled,
              color: _selectedIndex == 0 ? Colors.blueGrey : Colors.white70,
            ),
            label: 'Settings',
          ), //Settings
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 1 ? Colors.blueGrey : Colors.white70,
            ),
            label: 'Profile',
          ), //Profile
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_sharp,
              color: _selectedIndex == 2 ? Colors.blueGrey : Colors.white70,
            ),
            label: 'Camera',
          ), //Camera
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallpaper_rounded,
              color: _selectedIndex == 3 ? Colors.blueGrey : Colors.white70,
            ),
            label: 'Gallery',
          ), //Gallery
          BottomNavigationBarItem(
            icon: Icon(
              Icons.medical_information,
              color: _selectedIndex == 4 ? Colors.blueGrey : Colors.white70,
            ),
            label: 'Consults',
          ), //Messages
        ],
      ),
    );
  }
}
