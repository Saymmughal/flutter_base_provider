import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_provider/data/repository/api_repo.dart';
import 'package:flutter_base_provider/helper/router_navigator.dart';
import 'package:flutter_base_provider/utils/env_configuration/env_config.dart';
import 'package:flutter_base_provider/view/widgets/loading_dialog.dart';

import '../data/db/shared-preferences.dart';
import '../data/model/auth_model/login_model.dart';
import '../helper/routes_helper.dart';
import '../view/widgets/custom_snackbar.dart';

// Login ChangeNotifier
class AuthProvider extends ChangeNotifier {
  final ApiRepo _apiRepo = ApiRepo();
  bool? isLoading;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  // Clear TextFields
  void clearSignInFields() {
    loginEmailController.clear();
    loginPasswordController.clear();
    notifyListeners();
  }

  // Clear Login Screen
  void clearLoginScreen() {
    clearSignInFields();
  }

  // Set Loading
  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
    if (value == true) {
      loaderDialog();
    } else {
      goBack();
    }
  }

  /*=================================================================================
  APIs calling
 ==================================================================================*/

  // LOGIN ===================================================

  // Login
  Future<void> login() async {
    setLoading(true);
    Future.delayed(Duration(seconds: 3), () async {

      debugPrint("isLoading: $isLoading");
      debugPrint("Login ==========================>>>");
      try {
        Response response = await _apiRepo.postRequest(
          url: EnvConfig.fullLoginUrl,
          data: {
            "email": loginEmailController.text,
            "password": loginPasswordController.text,
          },
        );

        final responseBody = response.data;
        debugPrint("Login body ===============>>> $responseBody");

        final loginModel = LoginModel.fromJson(responseBody);

        if (response.statusCode == 200 || response.statusCode == 201) {
          setLoading(false);
          await Future.wait([
            LocalDb.storeUserData(loginModel),
            LocalDb.storeBearerToken(loginModel.token!),
            LocalDb.storeUserId(loginModel.data!.id!),
            LocalDb.storeLogin(true),
          ]);
          clearSignInFields();
          goToNamed(RouterHelper.mainScreen);
        } else {
          setLoading(false);
          String errorMessage =
              loginModel.error ??
              "${response.statusCode} ${response.statusMessage}";
          notifyListeners();
          showToast(message: errorMessage);
        }
      } catch (e) {
        setLoading(false);
        notifyListeners();
        debugPrint("isLoading: $isLoading");
      }
    });
  }
}
