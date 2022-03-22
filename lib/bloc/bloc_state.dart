import 'package:bloc_8_http/model/user_model.dart';

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<User> loadedUser;
  UserLoadedState({required this.loadedUser});
}

class UserErrorState extends UserState {}
