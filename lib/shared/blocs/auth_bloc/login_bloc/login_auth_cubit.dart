import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pharma_store_administration_web/shared/network/local/cache_helper.dart';
import 'package:pharma_store_administration_web/shared/network/remote/end_points/end_points.dart';

part 'login_auth_state.dart';

class LoginAuthCubit extends Cubit<LoginAuthState> {
  LoginAuthCubit() : super(LoginAuthInitialState());

  void userLogin({required String username, required String password}) async {
    emit(LoginAuthLoadingState());
    try {
      Response response =
          await http.post(Uri.parse(baseUrl + loginRoute), body: {
        "userName": username,
        "password": password,
        "userType": "admin",
      });
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        debugPrint('User login success and his data is : $data');
        CacheHelper.insertToCache(key: 'token', value: data['accessToken']);
        emit(LoginAuthSuccessState());
      }
      if (response.statusCode == 401) {
        var data = jsonDecode(response.body);
        debugPrint('User login failed and back data is : ${data['message']}');
        emit(LoginAuthErrorState(message: data['message']));
      }
    } catch (e) {
      emit(LoginAuthErrorState(message: e.toString()));
    }
  }
}
