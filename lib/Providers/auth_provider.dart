import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:new_app/Auth/App_Strings/network_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SharedPreferences/sharedprefs.dart';

class AuthProvider with ChangeNotifier {
  SharedPrefs sf = SharedPrefs();
  NetworkStrings networkStrings = NetworkStrings();
  Dio dio = Dio();
  Future register({
    BuildContext? context,
    String? email,
    username,
    password,
    lastname,
    firstname,
    phone,
    city,
    street,
    houseNumber,
  }) async {
    // SharedPreferences sf = await SharedPreferences.getInstance();
    Map data = {
      "email": email,
      "name": {
        "firstname": firstname,
        "lastname": lastname,
      },
      "address": {
        "city": city,
        "street": street,
        "number": houseNumber,
        "zipcode": '12926-3874',
        "geolocation": {
          "lat": '-37.3159',
          "long": '81.1496',
        }
      },
      "phone": phone,
    };

    var response = await dio.post(networkStrings.register, data: data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      sf.saveId(id: response.data["id"].toString());
      Flushbar(
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        message: "Success",
      );
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong please try again"),
        ),
      );
    }
  }

  Future login(
      {String? username, String? password, BuildContext? context}) async {
    Map data = {
      "password": password,
      "username": username,
    };

    var response = await dio.post(networkStrings.login, data: data);
    // print(response.data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text("logged in successfully"),
          backgroundColor: Colors.green,
          margin: EdgeInsets.only(
            bottom: 15,
            left: 10,
            right: 10,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong"),
          backgroundColor: Colors.red,
          margin: EdgeInsets.only(
            bottom: 15,
            left: 10,
            right: 10,
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
