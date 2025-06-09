class Opportunity {
  final String id;
  final String title;
  final String description;
  final String organization;

  Opportunity({required this.id, required this.title, required this.description, required this.organization});

  factory Opportunity.fromJson(Map<String, dynamic> json) => Opportunity(
    id: json['id'].toString(),
    title: json['title'],
    description: json['description'],
    organization: json['organization'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'organization': organization,
  };
}
