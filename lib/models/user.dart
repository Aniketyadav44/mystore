import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final List<dynamic> cart;
  final String token;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.cart,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'cart': cart,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      address: map['address'] as String,
      type: map['type'] as String,
      cart: List<Map<String, dynamic>>.from(
        (map['cart']?.map(
          (x) => Map<String, dynamic>.from(x),
        )),
      ),
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

/*
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzMmFjZTUzZmFlOGFiMWViNmMxOTQyNyIsImlhdCI6MTY2NDA5MDkxMn0.C-WFl5-Y3cOKRf8RM_D-ZGeFkjwzpbJW3h7vpB5_mDE",
  "_id": "632ace53fae8ab1eb6c19427",
  "name": "Aniket",
  "email": "ani@gmail.com",
  "password": "$2a$08$2Esn2aZ5E0nEAT6yVoPu/uEhLQc3zuzRmnVYXvIcE1OguF6NxSN7u",
  "address": "Rm 57, Laxmi Nagar, Link Road, Goregaon West, 400104, Mumbai",
  "type": "admin",
  "__v": 19,
  "cart": []
}
*/