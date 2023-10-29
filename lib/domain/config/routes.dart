enum Routes {
  otp,
  verify,
}

extension StaticRoutes on Routes {
  static const _url = {
    Routes.otp: "auth/generate-otp",
    Routes.verify: "auth/verify",
  };

  String get url => _url[this] ?? "";
}
