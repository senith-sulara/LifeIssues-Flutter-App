class HealthIssueModel {
  late String? id;
  late String? title;
  late String? imageUrl;
  late String? gender;
  late String? ageRange;
  late String? waterIntakeRange;
  late String? workoutRange;

  HealthIssueModel();
  HealthIssueModel.create(this.id, this.title, this.imageUrl, this.gender,
      this.ageRange, this.waterIntakeRange, this.workoutRange);

  factory HealthIssueModel.fromJson(Map<String, dynamic> json) {
    return HealthIssueModel.create(json['_id'], json['title'], json['imageUrl'],
        json['gender'], json['ageRange'], json['waterIntakeRange'],json['workoutRange']);
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'imageUrl': imageUrl,
        'gender': gender,
        'ageRange': ageRange,
        'waterIntakeRange' :waterIntakeRange,
        'workoutRange' : workoutRange,
      };

  @override
  toString() {
    return title.toString();
  }
}
