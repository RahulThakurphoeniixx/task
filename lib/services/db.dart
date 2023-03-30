// import 'package:alobhatechnologies/models/user_model.dart';
// import 'package:lotus/model/auth/auth_model.dart';
// import 'package:lotus/services/web_constant.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class BasePrefs {
//   static Future<void> saveData(UserData value) async {
//   }

//   static Future<UserData> readData() async {
//     final prefs = await SharedPreferences.getInstance();
//     UserData obj = UserData(
//         userId: prefs.getString("user_id") ?? "",
//         apiToken: prefs.getString("api_token") ?? "",
//         mobile: prefs.getString(cashmobile) ?? "",
//         email: prefs.getString(cashemail) ?? "",
//         gender: prefs.getString(cashgender) ?? "",
//         profession: prefs.getString(cashprofession) ?? "",
//         dateOfBirth: DateTime.parse(prefs.getString(cashdateOfBirth) ?? ""),
//         state: prefs.getString(cashstate) ?? "",
//         city: prefs.getString(cashcity) ?? "",
//         salon: prefs.getString(cashsalon) ?? "",
//         deviceKey: prefs.getString(cashdeviceKey) ?? "",
//         token: prefs.getString(cashtoken) ?? "");
//     return obj;
//   }

//   static Future<dynamic> readToken(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     String? obj = prefs.getString(cashtoken);
//     return obj;
//   }

//   static Future<void> deleteData(String key) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove(key);
//   }

//   static Future<bool> clearPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     return await prefs.clear();
//   }
// }
