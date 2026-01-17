import 'item.dart';

class ItemList {
  final List<Item>? items;

  ItemList({required this.items});

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
