import 'package:my_login_app/domain/api/base_api.dart';
import 'package:my_login_app/domain/config/routes.dart';
import 'package:my_login_app/domain/models/response_model.dart';

class CallApis extends BaseAPI {
  Future<ResponseModel> generateOtp(String email) async {
    var body = {
      "email": email,
    };
    var result =
        await post<Map<String, dynamic>>(route: Routes.otp, body: body);
    return ResponseModel.fromJson(result);
  }

  Future<ResponseModel> verifyOtp(String email, String otp) async {
    var body = {"email": email, "OTP": otp};
    var result =
        await post<Map<String, dynamic>>(route: Routes.verify, body: body);
    return ResponseModel.fromJson(result);
  }
}
