class UserModel {
  String id;
  String name;
  String email;
  String role; // Citizen, Admin, etc.

  UserModel({required this.id, required this.name, required this.email, required this.role});

  // From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'role': role,
    };
  }
}
