class User {
  int id;
  String name;
  String? email;
  String? phone;

  User({
    required this.id,
    required this.name,
    this.email,
    this.phone,
  });

  // метод который принимает объект типа Map (json) и
  // возвращает объект типа User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
