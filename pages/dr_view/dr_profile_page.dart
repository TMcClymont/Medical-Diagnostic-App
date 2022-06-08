import 'package:mda9_2/constants.dart';
import 'package:mda9_2/pages/settings_page.dart';
import 'package:flutter/material.dart';

class DrProfilePage extends StatefulWidget {
  const DrProfilePage({Key? key}) : super(key: key);

  @override
  _DrProfilePageState createState() => _DrProfilePageState();
}

class _DrProfilePageState extends State<DrProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent, title: const Text("Profile")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Clinician Information:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ), //Pt Info Title//
              ElevatedButton(
                child: const Text('Physician Profile'), //Reference PT ID//
                onPressed: () async {
                  var message = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DrProfile()),
                  );
                  //print(message); //Navigate to second route when tapped
                },
              ), //Pt ID and Link to Profile//
              // ElevatedButton(
              //   child: const Text('Photo Gallery'),
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const GalleryPage()),
              //     ); //Navigate to second route when tapped
              //   },
              // ), //Photo Gallery//
              ElevatedButton(
                child: const Text('Settings'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  ); //Navigate to second route when tapped
                },
              ), //Settings Option
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////Pt Profile Section///////////////////////////////
class DrProfile extends StatelessWidget {
  const DrProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Patient Profile'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/Coffee.jpg'),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150.0,
                  height: 20.0,
                  child: Divider(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context); //Navigate Back to first route when tapped
                  },
                  child: const Text('Home'),
                ),
              ),
            ], // Used to have multiple Children under
          ),
        ),
      ),
    );
  }
}
