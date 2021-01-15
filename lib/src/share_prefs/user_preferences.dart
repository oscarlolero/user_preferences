import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  //esto es para que cada vez que se llame el new, siempre sera la misma instancia
  static final UserPreferences _instace = new UserPreferences._internal();
  factory UserPreferences() {
    return _instace;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();

  }

  //no se utilizan estas preferencias aqui
  // bool _secondaryColor;
  // int _genhre;
  // String _name;

  //GET y SET del genero
  get genhre {
    //si no existe, por defecto sera 1
    return _prefs.getInt('genhre') ?? 1;
  }

  set genhre(int value) {
    _prefs.setInt('genhre', value);
  }

  //GET y SET del color
  get secondaryColor {
    //si no existe, por defecto sera 1
    return _prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool value) {
    _prefs.setBool('secondaryColor', value);
  }

  //GET y SET del username
  get userName {
    //si no existe, por defecto sera 1
    return _prefs.getString('userName') ?? '';
  }

  set userName(String value) {
    _prefs.setString('userName', value);
  }

}