class GetToken {
  late String name;
  late String email;
  late String accessToken;

  GetToken({required this.name, required this.email, required this.accessToken});

  factory GetToken.fromJson(Map<String, dynamic> userMap) {
    return GetToken(
        name: userMap['name'],
        email: userMap['email'],
        accessToken: userMap['access_token'],
    );
  }

  Map<String, dynamic> toJson() => 
  {
    'name': name,
    'email': email,
    'accessToken': accessToken
  };
}