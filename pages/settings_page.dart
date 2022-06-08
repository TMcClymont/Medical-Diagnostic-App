import 'package:flutter/material.dart';
import 'package:mda9_2/constants.dart';
import 'package:settings_ui/settings_ui.dart';
import 'languages_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool lockInBackground = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
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
        child: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('Common'),
              tiles: [
                SettingsTile(
                  title: const Text('Language'),
                  //subtitle: const Text('English'),
                  leading: const Icon(Icons.language),
                  onPressed: ((BuildContext context) => const LanguagesPage()),
                ),
                SettingsTile(
                    title: const Text('Environment'),
                    //subtitle: const Text('Production'),
                    leading: const Icon(Icons.cloud_queue)),
              ],
            ),
            SettingsSection(
              title: const Text('Account'),
              tiles: [
                SettingsTile(
                    title: const Text('Phone number'),
                    leading: const Icon(Icons.phone)),
                SettingsTile(
                    title: const Text('Email'),
                    leading: const Icon(Icons.email)),
                SettingsTile(
                    title: const Text('Sign out'),
                    leading: const Icon(Icons.exit_to_app)),
              ],
            ),
            SettingsSection(
              title: const Text('Security'),
              tiles: [
                SettingsTile.switchTile(
                  title: const Text('Lock app in background'),
                  leading: const Icon(Icons.phonelink_lock),
                  // switchValue: lockInBackground,
                  onToggle: (bool value) {},
                  initialValue: null,
                  //   setState(() {
                  //     lockInBackground = value;
                  //  }
                ),
                // },

                SettingsTile.switchTile(
                  title: const Text('Use fingerprint'),
                  leading: const Icon(Icons.fingerprint),
                  onToggle: (bool value) {},
                  initialValue: null,
                  // switchValue: false,
                ),
                SettingsTile.switchTile(
                  title: const Text('Change password'),
                  leading: const Icon(Icons.lock),
                  // switchValue: true,
                  onToggle: (bool value) {},
                  initialValue: null,
                ),
              ],
            ),
            SettingsSection(
              title: const Text('Misc'),
              tiles: [
                SettingsTile(
                    title: const Text('Terms of Service'),
                    leading: const Icon(Icons.description)),
                SettingsTile(
                    title: const Text('Open source licenses'),
                    leading: const Icon(Icons.collections_bookmark)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
