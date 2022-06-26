import 'package:flutter/foundation.dart';

class Product {
  final int id;
  final String name;
  final String detail;
  final String url;

  Product({
    required this.id,
    required this.name,
    required this.detail,
    required this.url,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      detail: json['detail'] as String,
      url: json['url'] as String,
    );
  }
}
