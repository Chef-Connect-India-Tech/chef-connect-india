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
class chefModel {
  String? cid;
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
  String? dutystatus;
  String? currentsalary;
  String? expectedsalary;
  String? cheffees;
  String? experience;
  String? cuisineexpert;
  String? specialities;
  String? menuimages;
  String? rating;
  String? education;
  String? languages;
  String? level;
  String? professionallevel;
  String? address;
  String? poi; //proof of identity
  String? aadhar;
  String? pan;
  String? verified;

  chefModel({this.cid, this.email, this.firstname,this.lastname, this.dob, this.city,
              this.role, this.profilepic, this.country,this.pincode, this.mobile1, this.mobile2,
              this.workpreference, this.dutystatus, this.currentsalary,this.expectedsalary, this.cheffees, this.experience,
              this.cuisineexpert, this. specialities, this.menuimages,this. rating, this.education, this.languages,
              this.level, this. professionallevel,this.address, this. poi,this.aadhar, this. pan});

  // receiving data from server
  factory chefModel.fromMap(map) {
    return chefModel(
        cid: map['uid'],
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
        
        );
        
  }
  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': cid,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'dob': dob,
      'city': city,
      'role': role,
      'profilepic':profilepic,
      'mobile1': mobile1,
      'mobile2': mobile2,
      'dutystatus': dutystatus,
      'workpreference':workpreference,
      'currentsalary': currentsalary,
      'expectedsalary': expectedsalary,      
      'cheffees': cheffees,
      'experience': experience,
      'cuisineexpert': cuisineexpert,
      'specialities': specialities,
      'menuimages':menuimages,
      'rating':rating,
      'educatione': education,
      'languages': languages,
      'level':level,
      'professionallevel':  professionallevel,
      'address': address,
      'aadhar': aadhar,
      'poi': poi,
      'pan': pan,
    };
  }
}