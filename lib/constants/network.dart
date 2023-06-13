class Endpoints {
  Endpoints._();

  static const String apiUrl = "http://localhost:8800";

  static const String userLoginUrl = apiUrl + "/auth";
  static const String registerUrl = apiUrl + "/accounts";
  static const String adminUser = apiUrl + "/admin/users";
  static const String userInfo = apiUrl + "/auth";
  static const String userChangePasswordUrl = apiUrl + "/accounts/password";
  static const String userGetVerifyCodeUrl = apiUrl + "";
  static const String requestRegisterUrl = apiUrl + "";
  static const String confirmRegisterUrl = "";
  static const String getProductInfo = apiUrl + "/products";
  static const String storeInfo = apiUrl + "/stores";
  static const String order = apiUrl + "/orders";
  static const String getProductType = apiUrl + "/product-types";
  static const String getAllCameras = apiUrl + "/cameras";

}