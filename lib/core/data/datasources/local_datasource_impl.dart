import 'package:final_project/core/domain/datasources/local_datasource.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  SharedPreferences sharedPreferences;
  LocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<bool> saveToken(String token) async {
    return sharedPreferences.setString('token', token);
  }

  @override
  String? getToken() {
    return sharedPreferences.getString('token');
  }
}
