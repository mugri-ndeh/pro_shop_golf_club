class UserModel {
  String uid;
  String username;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String dob;
  List? paymentMethods;
  UserModel(
      {this.uid = '',
      this.username = '',
      this.firstName = '',
      this.lastName = '',
      this.email = '',
      this.dob = '',
      this.phoneNumber = '',
      this.paymentMethods});
}
