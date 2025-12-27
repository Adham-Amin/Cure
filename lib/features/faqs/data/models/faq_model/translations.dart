import 'ar.dart';
import 'en.dart';

class Translations {
  En? en;
  Ar? ar;

  Translations({this.en, this.ar});

  factory Translations.fromJson(Map<String, dynamic> json) => Translations(
    en: json['en'] == null
        ? null
        : En.fromJson(json['en'] as Map<String, dynamic>),
    ar: json['ar'] == null
        ? null
        : Ar.fromJson(json['ar'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'en': en?.toJson(), 'ar': ar?.toJson()};
}
