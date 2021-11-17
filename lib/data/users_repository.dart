import 'package:fluttertest/data/users_api_provider.dart';
import 'package:fluttertest/model/user.dart';

class UserRepository {
  final _usersDataProvider = UsersApiProvider();
  Future<List<User>>getUsersList() => _usersDataProvider.getUser();
}