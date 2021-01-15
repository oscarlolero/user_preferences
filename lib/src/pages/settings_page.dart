import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preferences_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor = false;
  int _genhre = 1;
  String _name = 'Pedro';

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    loadPreferences();
    _textController = new TextEditingController(text: _name);
  }

  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _genhre = prefs.getInt('genhre');
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
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
              value: _secondaryColor,
              title: Text('Color secundario'),
              onChanged: (value) {
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

                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _setSelectedRadio(int value) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('genhre', value);

    _genhre = value;
    setState(() {

    });
  }
}
