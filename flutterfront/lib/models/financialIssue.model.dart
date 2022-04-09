class AdminIssueModel {
  late String? id;
  late String? monthlyIncome;
  late String? title;

  AdminIssueModel();
  AdminIssueModel.create(this.id, this.monthlyIncome, this.title);

  factory AdminIssueModel.fromJson(Map<String, dynamic> json) {
    return AdminIssueModel.create(
        json['_id'], json['monthlyIncome'], json['title']);
  }

  Map<String, dynamic> toJson() =>
      {'_id': id, 'monthlyIncome': monthlyIncome, 'title': title};

  @override
  toString() {
    return title.toString();
  }
}
