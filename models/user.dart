import 'dart:convert';

class User{
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  User({
    required this.email,
    required this.id,
    required this.name,
    required this.token,
    required this.address,
    required this.password,
    required this.type,
});
   Map<String, dynamic> toMap() {
     return {
        '_id':id,
        'name': name,
        'password': password,
        'address': address,
        'token': token,
        'email': email,
        'type': type,

     };
   }
   factory User.fromMap(Map<String, dynamic> map) {
     return User(
       id: map['_id'] ?? '',
       name: map['name'] ?? '',
       password: map['password'] ?? '',
       address: map['address'] ?? '',
       type: map['type'] ?? '',
       token: map['token'] ?? '',
       email: map['email'] ?? '',
     );
   }
   String toJson() => json.encode(toMap());
   factory User.fromJson(String source) => User.fromMap(json.decode(source));
}