import 'package:cff_ap/models/product.dart';

class User {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String userType;

  bool isActive;
  bool isAdmin;

  DateTime createdAt;
  DateTime updatedAt;



  User(this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.userType,
      this.isActive,
      this.isAdmin,
      this.createdAt,
      this.updatedAt);



  @override
  String toString() {
    return "User: ${this.firstName} ${this.lastName} ${this.email}";
  }
}
