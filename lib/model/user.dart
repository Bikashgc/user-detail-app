import 'dart:developer';

import 'package:fetch_userdetails/model/address.dart';

class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final Address address;
  final String phoneNumber;
  final String website;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return User(
      id: json["id"],
      name: json["name"],
      userName: json["username"],
      email: json["email"],
      address: Address.fromJson(json["address"]),
      phoneNumber: json["phone"],
      website: json["website"],
    );
  }
}
