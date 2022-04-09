class FamilyIssueModel {
  late String? id;
  late String? title;
  late String? imageUrl;
  late String? gender;
  late String? civilstatus;
  late String? age;

  FamilyIssueModel();
  FamilyIssueModel.create(this.id, this.title, this.imageUrl, this.gender,
      this.civilstatus, this.age);

  factory FamilyIssueModel.fromJson(Map<String, dynamic> json) {
    return FamilyIssueModel.create(json['_id'], json['title'], json['imageUrl'],
        json['gender'], json['civilstatus'], json['age']);
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'imageUrl': imageUrl,
        'gender': gender,
        'civilstatus': civilstatus,
        'age': age
      };

  @override
  toString() {
    return title.toString();
  }
}
