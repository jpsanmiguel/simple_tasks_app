class Comment {
  String comment;
  DateTime date;

  Comment({this.comment, this.date});

  Comment.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'date': date,
    };
  }
}
