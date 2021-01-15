import 'package:flutter/material.dart';
import 'package:user_preferences_app/src/pages/settings_page.dart';
import 'package:user_preferences_app/src/share_prefs/user_preferences.dart';
import 'package:user_preferences_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  //ya se inicializo desde main.dart, es la misma instancia
  final prefs = new UserPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User preferences'),
        backgroundColor: prefs.secondaryColor ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color: ${prefs.secondaryColor}'),
          Divider(),
          Text('Genhre: ${prefs.genhre}'),
          Divider(),
          Text('Username: ${prefs.userName}'),
          Divider(),
        ],
      ),
    );
  }
}
