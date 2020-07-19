class Question {
  String id;
  bool enabled;
  String title;
  List<String> answears;

  Question({this.id, this.enabled, this.title, this.answears});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enabled = json['enabled'];
    title = json['title'];
    answears = json['answears'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enabled'] = this.enabled;
    data['title'] = this.title;
    data['answears'] = this.answears;
    return data;
  }
}
