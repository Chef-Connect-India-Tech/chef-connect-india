import 'dart:ffi';

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

  // receiving data from server
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

  // sending data to our server
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

class ChefModel {
  String? uid;
  String? chefid;
  String? email;
  String? firstname;
  String? lastname;
  String? dob;
  String? city;
  String? role;
  String? profilepic;
  String? country;
  String? pincode;
  String? mobile1;
  String? mobile2;
  String? workpreference;
  bool dutystatus;
  String? currentsalary;
  String? expectedsalary;
  String? cheffees;
  String? experience;
  List? cuisineexpert;
  String? specialities;
  String? menuimages;
  double rating;
  String? education;
  String? languages;
  String? level;
  String? professionallevel;
  String? address;
  String? poi; //proof of identity
  String? aadhar;
  String? pan;
  String? verified;

  ChefModel(
      {this.uid,
      this.chefid,
      this.email,
      this.firstname,
      this.lastname,
      this.dob,
      this.city,
      this.role,
      this.profilepic,
      this.country,
      this.pincode,
      this.mobile1,
      this.mobile2,
      this.workpreference,
      this.dutystatus = true,
      this.currentsalary,
      this.expectedsalary,
      this.cheffees,
      this.experience,
      this.cuisineexpert,
      this.specialities,
      this.menuimages,
      this.rating = 3.9,
      this.education,
      this.languages,
      this.level,
      this.professionallevel,
      this.address,
      this.poi,
      this.verified,
      this.aadhar,
      this.pan});

  // receiving data from server
  factory ChefModel.fromMap(map) {
    return ChefModel(
        uid: map['uid'],
        chefid: map['chefid'],
        email: map['email'],
        firstname: map['firstname'],
        lastname: map['lastname'],
        dob: map['dob'],
        city: map['city'],
        role: map['role'],
        profilepic: map['profilepic'],
        country: map['country'],
        pincode: map['pincode'],
        mobile1: map['mobile1'],
        mobile2: map['mobile2'],
        workpreference: map['workpreference'],
        dutystatus: map['dutystatus'],
        currentsalary: map['currentsalary'],
        expectedsalary: map['expectedsalary'],
        cheffees: map['cheffees'],
        experience: map['experience'],
        cuisineexpert: map['cuisineexpert'],
        specialities: map['specialities'],
        menuimages: map['menuimages'],
        rating: map['rating'],
        education: map['education'],
        languages: map['languages'],
        level: map['level'],
        professionallevel: map['professionallevel'],
        address: map['address'],
        poi: map['proof of identity'],
        aadhar: map['aadhar'],
        pan: map['professionallevel'],
        verified: map['verified']);
  }
  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'chefid':
          '${firstname.toString().substring(0, 2)}${lastname.toString().substring(lastname!.length - 1)}${uid.toString().substring(uid!.length - 3)}',
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'dob': dob,
      'city': city,
      'role': role,
      'profilepic': profilepic,
      'mobile1': mobile1,
      'mobile2': mobile2,
      'dutystatus': dutystatus,
      'workpreference': workpreference,
      'currentsalary': currentsalary,
      'expectedsalary': expectedsalary,
      'cheffees': cheffees,
      'experience': experience,
      'cuisineexpert': cuisineexpert,
      'specialities': specialities,
      'menuimages': menuimages,
      'rating': rating,
      'education': education,
      'languages': languages,
      'level': level,
      'professionallevel': professionallevel,
      'address': address,
      'aadhar': aadhar,
      'poi': poi,
      'pan': pan,
      'verified': verified,
      'country': country,
      'pincode': pincode
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
