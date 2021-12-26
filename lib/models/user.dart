class User {
  final int userId;
  final String name;
  final String email;
  
  User({required this.userId, required this.name, required this.email});
  
  factory User.fromJson(Map<String, dynamic> userMap) {
    return User(
        userId: userMap['id'],
        name: userMap['name'],
        email: userMap['email'],
    );
  }
}