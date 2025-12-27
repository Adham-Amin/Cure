import 'package:cure/features/faqs/domain/entities/faq_entity.dart';

import 'datum.dart';
import 'links.dart';
import 'meta.dart';

class FaqModel {
  List<Datum>? data;
  Links? links;
  Meta? meta;

  FaqModel({this.data, this.links, this.meta});

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
        .toList(),
    links: json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>),
    meta: json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'data': data?.map((e) => e.toJson()).toList(),
    'links': links?.toJson(),
    'meta': meta?.toJson(),
  };

  List<FaqEntity> toEntity() => data?.map((e) => e.toEntity()).toList() ?? [];
}
