import 'package:shared_preferences/shared_preferences.dart';

class SharePerferenceClass {
  Future<void> saveData(String saveString) async {
    final perfs = await SharedPreferences.getInstance();
    perfs.setString('save', saveString);
  }

  Future<void> getData() async {
    final perfs = await SharedPreferences.getInstance();
    perfs.getString('save');
  }
}
