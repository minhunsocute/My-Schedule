import 'package:flutter/material.dart';

@immutable
class Item {
  const Item({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
  });
  final String id;
  final String name;
  final String type;
  final String image;
  String get getID => id;
}
