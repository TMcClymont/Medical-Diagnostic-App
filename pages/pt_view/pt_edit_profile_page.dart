import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mda9_2/constants.dart';
import 'package:mda9_2/models/dr_user.dart';
import 'package:mda9_2/widget/profile_widget.dart';
import 'package:mda9_2/widget/textfield_widget.dart';
import 'package:mda9_2/pages/dr_view/dr_user_preferences.dart';

class PtEditProfilePage extends StatefulWidget {
  @override
  _PtEditProfilePageState createState() => _PtEditProfilePageState();
}

class _PtEditProfilePageState extends State<PtEditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Edit Profile Page"),
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
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 32),
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Full Name',
                text: user.name,
                onChanged: (name) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'Email',
                text: user.email,
                onChanged: (email) {},
              ),
              const SizedBox(height: 24),
              TextFieldWidget(
                label: 'About',
                text: user.about,
                maxLines: 5,
                onChanged: (about) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
