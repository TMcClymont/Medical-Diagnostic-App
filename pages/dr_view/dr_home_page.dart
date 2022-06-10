import 'package:flutter/material.dart';
import 'package:mda9_2/pages/chats/chat_page.dart';
import 'package:mda9_2/pages/dr_view/database_tools.dart';
import 'package:mda9_2/pages/dr_view/dr_profile_page.dart';

class DrHomePage extends StatefulWidget {
  const DrHomePage({Key? key, title = 'Diagnostic Home Page'})
      : super(key: key);

  @override
  _DrHomePageState createState() => _DrHomePageState();
}

class _DrHomePageState extends State<DrHomePage> {
  final PageController _pageController = PageController();
  final List<Widget> _screens = [
    //const SettingsPage(),
    const DrProfilePage(),
    const ChatPage(),
    const DataBaseTools(),
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
      extendBodyBehindAppBar: true,
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
        unselectedLabelStyle: TextStyle(color: Colors.white70),
        selectedLabelStyle: TextStyle(color: Colors.blueGrey),
        onTap: _onItemTapped,
        items: [
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.workspaces_filled,
          //     color: _selectedIndex == 0 ? Colors.blueGrey : Colors.white70,
          //   ),
          //   label: 'Settings',
          // ), //Settings
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 0 ? Colors.blueGrey : Colors.white70,
            ),
            label: 'Profile',
          ), //Profile
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: _selectedIndex == 1 ? Colors.blueGrey : Colors.white70,
            ),
            label: 'Messages',
          ), //Camera
          BottomNavigationBarItem(
            icon: Icon(
              Icons.handyman,
              color: _selectedIndex == 2 ? Colors.blueGrey : Colors.white70,
            ),
            label: 'Database Tools',
          ), //Gallery
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.medical_information,
          //     color: _selectedIndex == 4 ? Colors.blueGrey : Colors.white70,
          //   ),
          //   label: 'Consults',
          // ), //Messages
        ],
      ),
    );
  }
}
