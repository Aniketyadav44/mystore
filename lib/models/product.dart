import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String id;
  final String name;
  final String description;
  final List<String> images;
  final int quantity;
  final double price;
  final String category;
  final List? ratings;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.quantity,
    required this.price,
    required this.category,
    this.ratings,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'images': images,
      'quantity': quantity,
      'price': price,
      'category': category,
      'ratings': ratings,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['_id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      images: List<String>.from((map['images'])),
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      category: map['category'] as String,
      ratings: map['ratings'] != null
          ? List<Map<String, dynamic>>.from(
              (map['ratings']?.map(
                (x) => x as Map<String, dynamic>,
              )),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

/*
{
  "_id": "632aaa9f6ca9efdc872a17f7",
  "name": "Fitness program",
  "description": "Fitness program description",
  "images": [
    "https://res.cloudinary.com/dnqri4n2g/image/upload/v1663740575/Fitness%20program/lmqmmnv0pkbdaqjlmqn9.jpg"
  ],
  "quantity": 40,
  "price": 999.99,
  "category": "Essentials",
  "__v": 14,
  "ratings": [
    {
      "userId": "632757bf7523563609dbc95f",
      "rating": 3.5,
      "_id": "632abb4da85b014dc242bb68"
    },
    {
      "userId": "632ace53fae8ab1eb6c19427",
      "rating": 5,
      "_id": "632d2210b6d24dff5294532d"
    },
    {
      "userId": "632c81a8ac33888f0f047650",
      "rating": 5,
      "_id": "632e74fd19a73e24e9984ec0"
    },
    {
      "userId": "632e9de5266a139d046aac24",
      "rating": 5,
      "_id": "632ea29b266a139d046aac60"
    }
  ]
}
*/