class IssueModel {
  String issue;
  String status; // Pending, Resolved, In Progress
  String dateReported;

  IssueModel({required this.issue, required this.status, required this.dateReported});

  // From JSON
  factory IssueModel.fromJson(Map<String, dynamic> json) {
    return IssueModel(
      issue: json['issue'],
      status: json['status'],
      dateReported: json['dateReported'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'issue': issue,
      'status': status,
      'dateReported': dateReported,
    };
  }
}
