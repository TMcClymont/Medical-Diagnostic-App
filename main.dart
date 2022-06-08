import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:mda9_2/flutter_camera_overlay/flutter_camera_overlay.dart';
import 'package:mda9_2/flutter_camera_overlay/model.dart';
import 'package:mda9_2/pages/welcome/welcome_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  //Needed before being able to authenticate user and retrieve stored data from Firebase
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cranial Mobile Diagnostic Application',
      //Mobile Diagnostic Application (MDA)
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(bodyColor: Colors.white),
        disabledColor: Colors.white,
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: WelcomeScreen(), //HomePage(title: 'Diagnostic Home Page')
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class MDACameraOverlay extends StatefulWidget {
  const MDACameraOverlay({Key? key}) : super(key: key);

  @override
  _MDACameraOverlayState createState() => _MDACameraOverlayState();
}

class _MDACameraOverlayState extends State<MDACameraOverlay> {
  OverlayFormat format = OverlayFormat.cardID1;
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: tab,
          //   onTap: (value) {
          //     setState(() {
          //       tab = value;
          //     });
          //     switch (value) {
          //       case (0):
          //         setState(() {
          //           format = OverlayFormat.cardID1;
          //         });
          //         break;
          //       case (1):
          //         setState(() {
          //           format = OverlayFormat.cardID3;
          //         });
          //         break;
          //       case (2):
          //         setState(() {
          //           format = OverlayFormat.simID000;
          //         });
          //         break;
          //     }
          //   },
          // items: const [
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.workspaces_filled),
          //     label: 'Settings',
          //   ),
          //   BottomNavigationBarItem(
          //       icon: Icon(Icons.camera_alt_sharp), label: 'Camera'),
          //   BottomNavigationBarItem(
          //       icon: Icon(Icons.chat_bubble), label: 'Messages'),
          // ],
          // ),
          backgroundColor: Colors.white,
          body: FutureBuilder<List<CameraDescription>?>(
            future: availableCameras(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data == null) {
                  return const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'No camera found',
                        style: TextStyle(color: Colors.black),
                      ));
                }
                return CameraOverlay(
                  snapshot.data!.first,
                  CardOverlay.byFormat(format),
                  (XFile file) => showDialog(
                    context: context,
                    barrierColor: Colors.black,
                    builder: (context) {
                      CardOverlay overlay = CardOverlay.byFormat(format);
                      return AlertDialog(
                          actionsAlignment: MainAxisAlignment.center,
                          backgroundColor: Colors.black,
                          title: const Text('Capture',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center),
                          actions: [
                            OutlinedButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Icon(Icons.close))
                          ],
                          content: SizedBox(
                              width: double.infinity,
                              child: AspectRatio(
                                aspectRatio: overlay.ratio!,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    alignment: FractionalOffset.center,
                                    image: FileImage(
                                      File(file.path),
                                    ),
                                  )),
                                ),
                              )));
                    },
                  ),
                  info:
                      'Position the head of the child within the circle and ensure the image is as clear as possible.',
                  label: 'Center Head in Circle',
                );
              } else {
                return const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Fetching cameras',
                      style: TextStyle(color: Colors.white),
                    ));
              }
            },
          ),
        ));
  }
}
