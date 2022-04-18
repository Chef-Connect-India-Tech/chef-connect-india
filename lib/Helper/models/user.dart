// ignore_for_file: unused_local_variable
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? username;
  String? email;
  String? firstname;
  String? lastname;
  String? mobile1;
  String? mobile2;
  DateTime? dob;
  String? city;
  String? country;
  String? pincode;
  String? hiremode;
  // String? preferences;
  String? selectedLocation;
  String? role;
  String? profilepic;

  UserModel(
      {this.uid,
      this.username,
      this.email,
      this.firstname,
      this.lastname,
      this.mobile1,
      this.mobile2,
      this.dob,
      this.city,
      this.country,
      this.pincode,
      this.hiremode,
      // this.preferences,
      this.selectedLocation,
      this.profilepic,
      this.role});

  // Receiving Data to Firestore
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        username: map['username'],
        email: map['email'],
        firstname: map['firstname'],
        lastname: map['lastname'],
        mobile1: map['mobile1'],
        mobile2: map['mobile2'],
        dob: map['dob'],
        city: map['city'],
        country: map['country'],
        pincode: map['pincode'],
        hiremode: map['hiremode'],
        profilepic: map['profilepic'],
        // preferences: map['preferences'],
        selectedLocation: map['selectedLocation'],
        role: map['role']);
  }

  // Send Data to Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username':
          '${firstname.toString().substring(0, 2)}${lastname.toString().substring(lastname!.length - 1)}${uid.toString().substring(uid!.length - 3)}',
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'mobile1': mobile1,
      'mobile2': mobile2,
      'dob': dob,
      'city': city,
      'country': country,
      'pincode': pincode,
      'hiremode': hiremode,
      'profilepic': profilepic,
      // 'preferences': preferences,
      'selectedLocation': selectedLocation,
      'role': role,
    };
  }
}

class Firebasehelper {
  static void updatemsg(appointid, status) async {
    CollectionReference appointmentdatbase =
        FirebaseFirestore.instance.collection("chefs");
    var result =
        await appointmentdatbase.doc(appointid).update({"firstname": status});
  }

  static void updatepic(appointid, status) async {
    CollectionReference appointmentdatbase =
        FirebaseFirestore.instance.collection("chefs");
    var result =
        await appointmentdatbase.doc(appointid).update({"profilepic": status});
  }
}

class FirebaseUserhelper {
  static void updatemsg(appointid, status) async {
    CollectionReference appointmentdatbase =
        FirebaseFirestore.instance.collection("chefs");
    var result =
        await appointmentdatbase.doc(appointid).update({"firstname": status});
  }

  static void updatepic(appointid, status) async {
    CollectionReference appointmentdatbase =
        FirebaseFirestore.instance.collection("users");
    var result =
        await appointmentdatbase.doc(appointid).update({"profilepic": status});
  }
}
