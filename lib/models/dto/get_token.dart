class GetToken {
  late String accessToken;

  GetToken({required this.accessToken});

  factory GetToken.fromJson(Map<String, dynamic> userMap) {
    return GetToken(
        accessToken: userMap['access_token'],
    );
  }

  Map<String, dynamic> toJson() => 
  {
    'accessToken': accessToken
  };
}