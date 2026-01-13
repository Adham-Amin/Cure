import 'amount.dart';
import 'item_list.dart';

class TransactionsRequest {
  Amount? amount;
  String? description;
  ItemList? itemList;

  TransactionsRequest({this.amount, this.description, this.itemList});

  factory TransactionsRequest.fromJson(Map<String, dynamic> json) {
    return TransactionsRequest(
      amount: json['amount'] == null
          ? null
          : Amount.fromJson(json['amount'] as Map<String, dynamic>),
      description: json['description'] as String?,
      itemList: json['item_list'] == null
          ? null
          : ItemList.fromJson(json['item_list'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };
}
