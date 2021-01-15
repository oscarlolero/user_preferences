import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences_app/src/share_prefs/user_preferences.dart';
import 'package:user_preferences_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor;
  int _genhre;
  String _name = 'test';

  TextEditingController _textController;

  final prefs = new UserPreferences();

  @override
  void initState() {
    super.initState();

    //el texteditingcontroller se usa en este caso para inicializar el texto
    _textController = new TextEditingController(text: prefs.userName);
    _genhre = prefs.genhre;
    _secondaryColor = prefs.secondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: prefs.secondaryColor ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Center(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Ajustes',
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: prefs.secondaryColor,
              title: Text('Color secundario'),
              onChanged: (value) {
                prefs.secondaryColor = value;
                setState(() {
                  _secondaryColor = value;
                });
              },
            ),
            RadioListTile(
              value: 1,
              groupValue: _genhre,
              onChanged: _setSelectedRadio,
              title: Text('Masculino'),
            ),
            RadioListTile(
              value: 2,
              groupValue: _genhre,
              onChanged: _setSelectedRadio,
              title: Text('Femenino'),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona'
                ),
                onChanged: (value) {
                  prefs.userName = value;
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _setSelectedRadio(int value) async {

    prefs.genhre = value;
    _genhre = value;
    setState(() {

    });
  }
}
