class User {
  final int userId;
  final String name;
  final String email;
  
  // 사전 안에 포함된 사전. 디코딩을 했기 때문에 문자열이 아니라 사전(map)이 되어야 한다.
  // 이때 사전의 값으로는 여러 가지가 올 수 있기 때문에 dynamic 키워드가 온다.
  // 엣갈리면 앞에 나온 사용자 데이터에서 company 항목을 찾아서 확인해 볼 것.
  
  User({required this.userId, required this.name, required this.email});
  
  // fromJson 생성자. 이 함수를 호출하면 User 객체를 만들 수 있기 때문에 생성자라고 부른다.
  // factory는 클래스 함수로 생성자를 만들 때 사용하는 키워드.
  // 전역 함수처럼 동작하기 때문에 this 키워드를 사용할 수 없다.
  factory User.fromJson(Map<String, dynamic> userMap) {
    return User(
        userId: userMap['id'],
        name: userMap['name'],
        email: userMap['email'],
    );
  }
}