class Token {
  final String accessToken;

  Token({
    required this.accessToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json['token'] as String,
      );
}
