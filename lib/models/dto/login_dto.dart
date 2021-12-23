class Login{
  late String email;
  late String password;

  Login({ required this.email, required this.password });

  Map<String, dynamic> toJson() => 
  {
    'email': email,
    'password': password,
  };
}