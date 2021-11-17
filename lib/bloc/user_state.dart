import 'package:fluttertest/model/user.dart';

abstract class UserState {}

class UserErrorState extends UserState{}

class UserLoadingState extends UserState{}

class UserLoadedState extends UserState{
  List<dynamic> loadedUser;
  UserLoadedState({required this.loadedUser});
}