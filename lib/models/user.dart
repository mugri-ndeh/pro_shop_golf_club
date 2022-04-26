class UserModel {
  bool completedProfile;
  String uid;
  String username;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String dob;
  List? paymentMethods;
  List purchases;
  UserModel({
    this.uid = '',
    this.username = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.dob = '',
    this.phoneNumber = '',
    this.paymentMethods,
    this.purchases = const [],
    this.completedProfile = false,
  });
  createUser() {}
  updateInfo() {}
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      username: json['username'],
      phoneNumber: json['phoneNumber'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dob: json['dob'],
      paymentMethods: json['paymentMethods'],
      purchases: json['purchases'],
      completedProfile: json['completedProfile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'phoneNumber': phoneNumber,
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob,
      'paymentMethods': paymentMethods,
      'purchases': purchases,
      'completedProfile': completedProfile
    };
  }
}
