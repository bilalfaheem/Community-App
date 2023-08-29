// import 'package:beam_tv_1/Model/login_data_model/datum.dart';
// import 'package:flutter/material.dart';
// import 'package:beam_tv_1/Model/login_data_model/login_data_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class UserViewModel with ChangeNotifier{

//   Future<bool> saveUser(Datum user)async{

//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.setString('token', user.token.toString());
//     notifyListeners();
//     return true ;
//   }

//   Future<UserModel> getUser()async{

//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     final String? token = sp.getString('token');

//     return UserModel(
//       token: token.toString()
//     );
//   }

//   Future<bool> remove()async{

//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.remove('token');
//     return true;

//   }
// }
