// {
// "id": 1,
// "name": "Leanne Graham",
// "username": "Bret",
// "email": "Sincere@april.biz",
// "address": {
// "street": "Kulas Light",
// "suite": "Apt. 556",
// "city": "Gwenborough",
// "zipcode": "92998-3874",
// "geo": {
// "lat": "-37.3159",
// "lng": "81.1496"
// }
// },
// "phone": "1-770-736-8031 x56442",
// "website": "hildegard.org",
// "company": {
// "name": "Romaguera-Crona",
// "catchPhrase": "Multi-layered client-server neural-net",
// "bs": "harness real-time e-markets"
// }
// },

import 'dart:convert';

import 'address_model.dart';

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Address address;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'website': website,
      'address': address.toJson(),
    };
  }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, username: $username, email: $email, phone: $phone, website: $website, address: $address}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserModel) return false;
    return id == other.id &&
        name == other.name &&
        username == other.username &&
        email == other.email &&
        phone == other.phone &&
        website == other.website &&
        address == other.address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        website.hashCode ^
        address.hashCode;
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? website,
    Address? address,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      address: address ?? this.address,
    );
  }

  static List<UserModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => UserModel.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> toJsonList(List<UserModel> userList) {
    return userList.map((user) => user.toJson()).toList();
  }

  static UserModel fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return UserModel.fromJson(json);
  }

  static String toJsonString(UserModel user) {
    final Map<String, dynamic> json = user.toJson();
    return jsonEncode(json);
  }

  static List<UserModel> fromJsonStringList(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return UserModel.fromJsonList(jsonList);
  }
}
