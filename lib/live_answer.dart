class LiveAnswer {
  int questionId;
  String questionType;
  String answer;
  List<String> answerList;

  LiveAnswer(this.questionId, this.questionType, this.answer, this.answerList);

  set setQuestionId(int questionId) {
    this.questionId = questionId;
  }

  int getQuestionId() {
    return questionId;
  }

  set setQuestionType(String questionType) {
    this.questionType = questionType;
  }

  String getQuestionType() {
    return questionType;
  }

  set setAnswer(String answer) {
    this.answer = answer;
  }

  String getAnswer() {
    return answer;
  }

  set setAnswerList(List<String> answerList) {
    this.answerList = answerList;
  }

  List<String> getAnswerList() {
    return answerList;
  }

  Map toPost() {
    Map object = new Map();
    object.putIfAbsent('question', () => getQuestionId());

    switch (getQuestionType().toLowerCase()) {
      case 'text':
      case 'textarea':
        object.putIfAbsent('option_value', () => getAnswer());
        break;

      case 'radio':
      case 'yes or no':
        object.putIfAbsent('option', () => int.parse(getAnswer()));
        break;
      default:
        object.putIfAbsent('option_value', () => getAnswerList().toString());
        break;
    }
    return object;
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
