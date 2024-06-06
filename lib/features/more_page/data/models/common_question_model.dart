class CommonQuestionModel {
  int? id;
  String? question;
  String? answer;

  CommonQuestionModel({this.id, this.question, this.answer});

  factory CommonQuestionModel.fromJson(Map<String, dynamic> json) {
    return CommonQuestionModel(
      id: json['id'] as int?,
      question: json['question'] as String?,
      answer: json['answer'] as String?,
    );
  }
}
