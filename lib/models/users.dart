class User {
  String? id;
  late String name;
  String? email;
  late String phone;
  String? address;
  String? role;
  String? avatar;
  bool? activated;
  String? password;
  bool? gender;
  int? code;

  User( {this.id,
    String? login,
    required this.name,
    this.email,
    required this.phone,
    this.address,
    this.role,
    this.avatar,
    this.password,
    this.code,
    bool? activated});

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    if (json['code'] != null) code = json["code"];
    email = json['email'];
    phone = json['phone'];
    // avatar = json['avatar'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) {
      data['_id'] = id;
    }
    if (avatar != null) {
      data['avatar'] = avatar;
    }
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['activated'] = activated;
    if (address != null) {
      data['address'] = address;
    }
    // data['activated'] = this.activated;
    if (password != null) {
      data['password'] = password;
    }
    data['role'] = role;
    return data;
  }
}