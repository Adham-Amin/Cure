class Ar {
  String? question;
  String? answer;

  Ar({this.question, this.answer});

  factory Ar.fromJson(Map<String, dynamic> json) => Ar(
    question: json['question'] as String?,
    answer: json['answer'] as String?,
  );

  Map<String, dynamic> toJson() => {'question': question, 'answer': answer};
}
