import 'package:flutter/material.dart';
import 'package:mda9_2/constants.dart';

class DataBaseTools extends StatefulWidget {
  const DataBaseTools({Key? key}) : super(key: key);

  @override
  State<DataBaseTools> createState() => _DataBaseToolsState();
}

class _DataBaseToolsState extends State<DataBaseTools> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text("Database Tools")),
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
      ),
    );
  }
}
