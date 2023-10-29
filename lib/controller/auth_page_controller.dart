import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_login_app/constant/icons_url.dart';
import 'package:my_login_app/controller/enum.dart';
import 'package:my_login_app/domain/api/call_api.dart';

class AuthPageController extends GetxController {
  var emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  var deviceLanguage = Language.en.obs;
  var emailTextController = TextEditingController().obs;
  var otpFilled = false.obs;
  var otpCode = "".obs;
  var pageState = PageState.stable.obs;
  get getPageLoading => pageState.value == PageState.loading;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String get getCountryFlag => deviceLanguage.value == Language.en
      ? IconsUrl.iranFlag
      : IconsUrl.englandFlag;
  changeLanguage() {
    if (deviceLanguage.value == Language.en) {
      deviceLanguage.value = Language.fa;
      Get.updateLocale(const Locale('fa', 'IR'));
    } else {
      deviceLanguage.value = Language.en;
      Get.updateLocale(const Locale('en', 'US'));
    }
  }

  Future<bool> register(String email) async {
    pageState.value = PageState.loading;
    var result = await CallApis().generateOtp(email);
    if (result.status == 200) {
      pageState.value = PageState.stable;

      return true;
    } else {
      pageState.value = PageState.stable;

      Get.snackbar("Error", result.message.toString());
    }
    pageState.value = PageState.stable;

    return false;
  }

  Future<bool> verifyOtp(String email, String otp) async {
    pageState.value = PageState.loading;

    var result = await CallApis().verifyOtp(email, otp);
    if (result.status == 200) {
      pageState.value = PageState.stable;

      return true;
    } else {
      pageState.value = PageState.stable;

      Get.snackbar("Error", result.message.toString());
    }
    pageState.value = PageState.stable;

    return false;
  }

  bool validateAndSave() {
    FormState? form = formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
