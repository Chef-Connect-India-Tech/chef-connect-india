class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? lastname;
  // String? city;
  String? phone;
  String? role;

  UserModel({this.uid, this.email, this.firstname,this.lastname, this.phone, this.role});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        firstname: map['firstname'],
        lastname: map['lastname'],
        // city: map['city'],
        phone: map['phone'],
        role: map['role']);
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'num': phone,
      // 'city': city,
      'role': role,
    };
  }
}