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
  final List ratings;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.quantity,
    required this.price,
    required this.category,
    required this.ratings,
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
      images: List<String>.from((map['images'] as List<String>)),
      quantity: map['quantity'] as int,
      price: map['price'] as double,
      category: map['category'] as String,
      ratings: List.from((map['ratings'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}

/*
{
    "_id": "6329da62612334a2fb7f3f45",
    "name": "Beach products",
    "description": "Beach products description",
    "images": [
      "https://res.cloudinary.com/dnqri4n2g/image/upload/v1663687265/Beach%20products/lkfphehvjw5llc7qlwhf.jpg"
    ],
    "quantity": 8,
    "price": 12.3,
    "category": "Fashion",
    "__v": 1,
    "ratings": []
  },
*/