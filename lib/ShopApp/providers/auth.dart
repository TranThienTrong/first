import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier {
  String apiKey = 'AIzaSyDi1rzlLlHDW2MhyITXGtljGPr30KoXpZA';
  static String? token;
  DateTime? _expiredTime;
  static String? userId;
  bool _isLogined = false;
  Timer? _logoutTimer;



  bool get isLogined {
    if (token != null) {
      if (_expiredTime!.isAfter(DateTime.now())) {
        return true;
      }
      return false;
    }
    return false;
  }

  Future<void> signUp(String email, String password) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=${apiKey}');
    http.Response response = await http.post(url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));

    print(json.decode(response.body));
  }

  Future<void> signIn(String email, String password) async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${apiKey}');

    http.Response response = await http.post(url,
        body: json.encode(
            {'email': email, 'password': password, 'returnSecureToken': true}));
    Map responseMessage = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      token = responseMessage['idToken'];
      userId = responseMessage['localId'];
      _expiredTime = DateTime.now()
          .add(Duration(seconds: int.parse(responseMessage['expiresIn'])));
      autoLogout();
      notifyListeners();
      String userData = json.encode(
          {'idToken': token, 'userId': userId, 'expiresIn': _expiredTime!.toIso8601String()});

      pref.setString('userData', userData);
    }
    if (response.statusCode >= 400) {
      throw HttpException('Something happened!');
    }
  }

  Future<bool> autoLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(!pref.containsKey('userData')) {
        return false;
    }
    Map userData = json.decode(pref.getString('userData')!);
    _expiredTime = DateTime.parse(userData['expiresIn']);
    if(_expiredTime!.isBefore(DateTime.now())){
      logout;
      return false;
    }


    token = userData['idToken'];
    userId = userData['userId'];
    _isLogined = true;
    notifyListeners();
    autoLogout();
    return true;
  }

  Future<void> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = null;
    userId = null;
    _isLogined = false;
    if (_logoutTimer != null) {
      _logoutTimer!.cancel();
      _logoutTimer = null;
    }
    pref.clear();
    notifyListeners();
  }

  void autoLogout() {
    if (_logoutTimer != null) {
      _logoutTimer!.cancel();
    } else {
      final secondsLeft = _expiredTime!.difference(DateTime.now()).inSeconds;
      if (secondsLeft <= 0) {
        logout;
        return;
      } else {
        _logoutTimer = Timer(Duration(seconds: secondsLeft), logout);
      }
    }
  }
}
