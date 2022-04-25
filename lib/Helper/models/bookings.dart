class BookingModel {
  String? bookingDate;
  String? bookingTime;
  String? bookingId;
  String? bookingStatus;
  String? bookingType;
  String? customerId;
  String? customerPhone;
  String? chefId;
  String? cid;
  String? chefContact;
  String? location;
  List? selectedMenu;
  String? requirementDate;
  String? requirementTime;
  String? bookingSlot;
  String? numberOfPlates;
  String? address;
  bool? withMaterial;
  String? preferedChefGender;
  String? chefCategory;
  String? preferedBudget;
  List? preferedCuisine;
  String? restaurantName;
  String? chefCount;

  BookingModel({
    this.bookingDate,
    this.bookingTime,
    this.bookingId,
    this.bookingStatus,
    this.bookingType,
    this.customerId,
    this.customerPhone,
    this.chefId,
    this.cid,
    this.chefContact,
    this.location,
    this.selectedMenu,
    this.requirementDate,
    this.requirementTime,
    this.bookingSlot,
    this.numberOfPlates,
    this.address,
    this.withMaterial,
    this.preferedChefGender,
    this.chefCategory,
    this.preferedBudget,
    this.preferedCuisine,
    this.restaurantName,
    this.chefCount,
  });

  factory BookingModel.fromMap(map) {
    return BookingModel(
      bookingDate: map['bookingDate'],
      bookingTime: map['bookingTime'],
      bookingId: map['bookingId'],
      bookingStatus: map['bookingStatus'],
      bookingType: map['bookingType'],
      customerId: map['customerId'],
      customerPhone: map['customerPhone'],
      chefId: map['chefId'],
      cid: map['cid'],
      chefContact: map['chefContact'],
      location: map['location'],
      selectedMenu: map['selectedMenu'],
      requirementDate: map['requirementDate'],
      requirementTime: map['requirementTime'],
      bookingSlot: map['bookingSlot'],
      numberOfPlates: map['numberOfPlates'],
      address: map['address'],
      withMaterial: map['withMaterial'],
      preferedChefGender: map['preferedChefGender'],
      chefCategory: map['chefCategory'],
      preferedBudget: map['preferedBudget'],
      preferedCuisine: map['preferedCuisine'],
      restaurantName: map['restaurantName'],
      chefCount: map['chefCount'],
    );
  }

  // Send Data to Firestore
  Map<String, dynamic> toMap() {
    return {
      "bookingDate": bookingDate,
      "bookingTime": bookingTime,
      "bookingId": bookingId,
      "bookingStatus": bookingStatus,
      "bookingType": bookingType,
      "customerId": customerId,
      "customerPhone": customerPhone,
      "chefId": chefId,
      "cid": cid,
      "chefContact": chefContact,
      "location": location,
      "selectedMenu": selectedMenu,
      "requirementDate": requirementDate,
      "requirementTime": requirementTime,
      "bookingSlot": bookingSlot,
      "numberOfPlates": numberOfPlates,
      "address": address,
      "withMaterial": withMaterial,
      "preferedChefGender": preferedChefGender,
      "chefCategory": chefCategory,
      "preferedBudget": preferedBudget,
      "preferedCuisine": preferedCuisine,
      "restaurantName": restaurantName,
      "chefCount": chefCount
    };
  }
}
