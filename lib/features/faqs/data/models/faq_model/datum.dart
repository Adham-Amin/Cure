import 'package:cure/features/faqs/domain/entities/faq_entity.dart';

import 'translations.dart';

class Datum {
  int? id;
  String? question;
  String? answer;
  Translations? translations;
  String? locale;
  bool? isActive;
  int? displayOrder;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.question,
    this.answer,
    this.translations,
    this.locale,
    this.isActive,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'] as int?,
    question: json['question'] as String?,
    answer: json['answer'] as String?,
    translations: json['translations'] == null
        ? null
        : Translations.fromJson(json['translations'] as Map<String, dynamic>),
    locale: json['locale'] as String?,
    isActive: json['is_active'] as bool?,
    displayOrder: json['display_order'] as int?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'question': question,
    'answer': answer,
    'translations': translations?.toJson(),
    'locale': locale,
    'is_active': isActive,
    'display_order': displayOrder,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  FaqEntity toEntity() => FaqEntity(
    question: question ?? 'What is your question?',
    answer: answer ?? 'Answer to your question',
  );
}
