class User {
  final int id;
  final String name;
  final String? phone;
  final String? email;

  User({
    required this.id,
    required this.name,
    this.phone,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['username'] as String,
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
