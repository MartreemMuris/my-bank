class User {
  String id, name, email;
  double currentBalance;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.currentBalance,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "currentBalance": currentBalance,
    };
  }

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      id: jsonData["id"],
      name: jsonData["name"],
      email: jsonData["email"],
      currentBalance: jsonData["currentBalance"],
    );
  }
}
