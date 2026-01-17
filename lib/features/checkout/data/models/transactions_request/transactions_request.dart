import 'amount.dart';
import 'item_list.dart';

class TransactionsRequest {
  final Amount amount;
  final String description;
  final ItemList itemList;

  TransactionsRequest({
    required this.amount,
    required this.description,
    required this.itemList,
  });

  Map<String, dynamic> toJson() => {
    'amount': amount.toJson(),
    'description': description,
    'item_list': itemList.toJson(),
  };
}
