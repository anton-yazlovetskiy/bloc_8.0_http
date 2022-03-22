import 'package:bloc_8_http/http_services/user_api_provider.dart';
import 'package:bloc_8_http/model/user_model.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}
