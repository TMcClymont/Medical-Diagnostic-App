import 'package:firebase_auth/firebase_auth.dart';
import 'package:mda9_2/constants.dart';
import 'package:mda9_2/pages/pt_view/pt_edit_profile_page.dart';
import 'package:mda9_2/pages/pt_view/pt_user_preferences.dart';
import 'package:mda9_2/pages/pt_view/pt_user.dart';
import 'package:mda9_2/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:mda9_2/widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  late String _email;
  late String _password;

  bool isLoading = false;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        child: SafeArea(
          bottom: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Patient Information:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ), //Pt Info Title//
                ElevatedButton(
                  child: const Text('Patient Profile'), //Reference PT ID//
                  onPressed: () async {
                    var message = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PtProfile()),
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
      ),
    );
  }
}

/////////////////////////Pt Profile Section///////////////////////////////
class PtProfile extends StatelessWidget {
  const PtProfile({Key? key}) : super(key: key);
  final user = UserPreferences.myUser;

  @override
  Widget buildName(user) => Column(
        children: [
          Text(
            user.name,
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
          )
        ],
      );

  Widget buildAbout(user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About'),
            const SizedBox(height: 16),
            Text(user.about),
          ],
        ),
      );
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
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children: [
              // const Align(
              //   alignment: Alignment.topLeft,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //     child: CircleAvatar(
              //       radius: 50.0,
              //       backgroundImage: AssetImage('images/Coffee.jpg'),
              //     ),
              //   ),
              // ),
              ProfileWidget(
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => PtEditProfilePage()),
                  );
                },
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              buildAbout(user),
              const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150.0,
                  height: 20.0,
                  child: Divider(),
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
