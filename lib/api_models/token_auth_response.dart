class TokenAuthResponse {
  final String token;

  TokenAuthResponse({required this.token});

  factory TokenAuthResponse.fromJson(Map<String, dynamic> json) {
    return TokenAuthResponse(token: json['token']);
  }
}
