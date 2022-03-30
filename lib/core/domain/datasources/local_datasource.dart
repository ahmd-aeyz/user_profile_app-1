abstract class LocalDataSource {
  Future<bool> saveToken(String token);
  String? getToken();
  void deleteToken();
}
