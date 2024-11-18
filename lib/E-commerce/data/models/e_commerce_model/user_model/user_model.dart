class UserModel {
  String? name;
  String? phone;
  String? email;

  UserModel({this.name, this.phone, this.email});

  UserModel.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    phone = data['phone'];
    email = data['email'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
    };
  }
}
