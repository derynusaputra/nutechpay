import 'dart:convert';

import 'package:get/get.dart';

class UserProvider extends GetConnect {
  // Get request
  // Future<Response> getUser(int id) => get('http://youapi/users/$id');
  String? registerUrl = 'https://tht-api.nutech-integrasi.app/registration';
  String? signinUrl = 'https://tht-api.nutech-integrasi.app/login';
  String? updateUrl = 'https://tht-api.nutech-integrasi.app/updateProfile';
  String? profileUrl = 'https://tht-api.nutech-integrasi.app/getProfile';
  String? toupUrl = 'https://tht-api.nutech-integrasi.app/topup';
  String transferUrl = 'https://tht-api.nutech-integrasi.app/transfer';
  String historiUrl = 'https://tht-api.nutech-integrasi.app/transactionHistory';

  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiaG9kZ2xmQ1AydU92aGRXMEdDSWRMN3ppWnBmQVFUMTJ5Q05pd2VHRTBqMTNPSGZzM1lLbTNFSEVZZENxTmhTVVJZbS02RmtKSzJNX3R6VVJid29CMDBDRE1oSkxKMURxUnFHdy05Vlhma1ctMU5KblB6SU5tbFRFc1U1ZzNmbG5oTXRKeGk3UkJjNVNmdndjbDMxYWdnPT0iLCJpYXQiOjE2NTg3NTk2NDQsImV4cCI6MjU1NjExODc5OH0.x9v1iH2fqz1ChpuPeyfU152dP9bdPXwmwEz8p0tOOcc';

  // Post request
  Future<Response> postUser(
      String firstname, String lastname, String email, String pass) {
    final body = json.encode({
      "email": email,
      "password": pass,
      "first_name": firstname,
      "last_name": lastname
    });
    return post(registerUrl, body);
  }

  Future<Response> postLogin(String email, String pass) {
    final body = json.encode({"email": email, "password": pass});
    return post(signinUrl, body);
  }

  Future<Response> updateProfile(String firstn, String lastn, String token) {
    final body = json.encode({"first_name": firstn, "last_name": lastn});
    return post(updateUrl, body, headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
  }

  Future<Response> getProfile(String token) {
    // final body = json.decode({"first_name": firstn, "last_name": lastn});
    return get(profileUrl!, headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
  }

  Future<Response> topUp(int amount, String token) {
    final body = json.encode({
      "amount": amount,
    });
    return post(toupUrl, body, headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
  }

  Future<Response> transfer(int amount, String token) {
    final body = json.encode({
      "amount": amount,
    });
    return post(transferUrl, body, headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
  }

  Future<Response> getHistory(String token) {
    // final body = json.decode({"first_name": firstn, "last_name": lastn});
    return get(historiUrl, headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    });
  }
}
