class User {
  final int userId;
  final String name;
  final String email;
  final String password;
  
  User({required this.userId, required this.name, required this.email, required this.password});
  
  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        userId: map['id'],
        name: map['name'],
        email: map['email'],
        password: map['password'],
    );
  }
}