import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Auth/App_Strings/network_strings.dart';

class AuthProvider with ChangeNotifier {
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

    var response = await dio.post(NetworkStrings().register, data: data);

    if (response.statusCode == 200 || response.statusCode == 201) {
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong please try again"),
        ),
      );
    }
  }
}
