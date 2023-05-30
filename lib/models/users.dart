class User {
  int? id;
  late String firstName;
  late String lastName;
  late String email;
  late String phone;
  String? address;
  String? role;
  String? avatar;
  bool? activated;
  String? password;
  bool? gender;

  User( {int? id,
    String? login,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    String? address,
    String? role,
    String? avatar,
    String? password,
    bool? activated})
    {
      this.id = id;
      this.firstName = firstName;
      this.phone = phone;
      this.address = address;
      this.role = role;
      this.activated = activated;
      this.avatar = avatar;
      this.lastName = lastName;
      this.email = email;
      this.password = password;
    }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    activated = json['activated'];
    address = json['address'];
    phone = json['phone'];
    avatar = json['avatar'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) {
      data['id'] = this.id;
    }
    if (avatar != null) {
      data['avatar'] = this.avatar;
    }

    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['activated'] = this.activated;
    if (address != null) {
      data['address'] = this.address;
    }
    data['activated'] = this.activated;
    if (password != null) {
      data['password'] = this.password;
    }
    data['role'] = this.role;
    return data;
  }
}