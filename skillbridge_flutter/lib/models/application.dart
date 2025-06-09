class Application {
  final String id;
  final String opportunityId;
  final String userId;
  final String status;

  Application({required this.id, required this.opportunityId, required this.userId, required this.status});

  factory Application.fromJson(Map<String, dynamic> json) => Application(
    id: json['id'].toString(),
    opportunityId: json['opportunityId'].toString(),
    userId: json['userId'].toString(),
    status: json['status'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'opportunityId': opportunityId,
    'userId': userId,
    'status': status,
  };
}
