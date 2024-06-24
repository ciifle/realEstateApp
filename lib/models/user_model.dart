import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String name;
  final String profile;
  final String email;
  final String password;
  final bool isAdmin;
  final List<dynamic>? ratings;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.password,
    required this.profile,
    this.ratings,
    // this.ratings,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': name,
      'email': email,
      'isAdmin': isAdmin,
      'password': password,
      'profileImage':profile,
      'ratings': ratings,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['username'] ?? '',
      email: map['email'] ?? '',
      isAdmin: map['isAdmin'] ?? false,
      profile: map['profileImage'] ?? '',
      password: map['password'] ?? '',
      ratings: List<Map<String, dynamic>>.from(
          (map['ratings']?.map((x) => Map<String, dynamic>.from(x)))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? profile,
    bool? isAdmin,
    List<dynamic>? ratings,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isAdmin: isAdmin ?? this.isAdmin,
      ratings: ratings ?? this.ratings, 
      profile: profile ?? this.profile,
    );
  }
}
