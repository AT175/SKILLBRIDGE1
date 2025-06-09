class User {
  final String id;
  final String username;
  final String email;
  final String role;

  User({required this.id, required this.username, required this.email, required this.role});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'].toString(),
    username: json['username'],
    email: json['email'],
    role: json['role'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
    'role': role,
  };
}
