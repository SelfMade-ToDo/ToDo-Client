class GetToken {
  late String access_token;

  GetToken({required this.access_token});

  factory GetToken.fromJson(Map<String, dynamic> userMap) {
    return GetToken(
        access_token: userMap['access_token'],
    );
  }
}