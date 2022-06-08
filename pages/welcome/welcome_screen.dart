import 'package:firebase_auth/firebase_auth.dart';
import 'package:mda9_2/constants.dart';
import 'package:flutter/material.dart';
import 'package:mda9_2/pages/dr_view/clinician_portal.dart';
import 'package:mda9_2/pages/pt_view/pt_portal.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'homepage';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
          child: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                    children: [
                      const Spacer(),
                      const Center(
                        child: Text(
                          "Are you a parent or clinician?",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      const Spacer(),
                      //As you can see we need more padding on our btn
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 250.0,
                            child: FloatingActionButton.extended(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PtPortal())),
                              icon: const Icon(
                                Icons.baby_changing_station,
                                size: 40,
                              ),
                              label: const Text("Patient"),
                              backgroundColor: Colors.purpleAccent,
                            ),
                          ),
                          Container(
                            height: 250.0,
                            child: FloatingActionButton.extended(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DrPortal())),
                              icon: const Icon(
                                Icons.medical_services,
                                size: 30,
                              ),
                              label: const Text("Clinician"),
                              backgroundColor: Colors.lightBlueAccent,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: ElevatedButton(
                      //     onPressed: () => Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => SignUpScreen(),
                      //       ),
                      //     ),
                      //     style: TextButton.styleFrom(
                      //       backgroundColor: const Color(0xFF6CD8D1),
                      //     ),
                      //     child: const Text("Sign Up"),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //     vertical: defaultPadding),
                      //   child: SizedBox(
                      //     width: double.infinity,
                      //     child: ElevatedButton(
                      //       onPressed: () => Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //             builder: (context) => SignInScreen(),
                      //           )),
                      //       style: TextButton.styleFrom(
                      //         // backgroundColor: Color(0xFF6CD8D1),
                      //         elevation: 0,
                      //         backgroundColor: Colors.purple,
                      //         shape: const RoundedRectangleBorder(
                      //           side: BorderSide(
                      //               color: Colors.purpleAccent), //(0xFF6CD8D1)
                      //         ),
                      //       ),
                      //       child: const Text("Sign In"),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
