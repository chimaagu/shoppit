import 'package:new_app/SharedPreferences/shared_prefs_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefsStrings sharedPrefsStrings = SharedPrefsStrings();
  saveId({String? id}) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    print(id);
    return sf.setString(sharedPrefsStrings.id, id!);
  }

  getId() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(sharedPrefsStrings.id);
  }

  saveToken({String? token}) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    print(token);
    return sf.setString(sharedPrefsStrings.id, token!);
  }
}
