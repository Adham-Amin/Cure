class En {
  String? question;
  String? answer;

  En({this.question, this.answer});

  factory En.fromJson(Map<String, dynamic> json) => En(
    question: json['question'] as String?,
    answer: json['answer'] as String?,
  );

  Map<String, dynamic> toJson() => {'question': question, 'answer': answer};
}
