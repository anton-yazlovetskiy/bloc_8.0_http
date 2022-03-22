import 'package:bloc_8_http/model/user_model.dart';
import 'package:bloc_8_http/model/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_8_http/bloc/bloc_events.dart';
import 'package:bloc_8_http/bloc/bloc_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final List<User> _loadedUserList = await userRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: _loadedUserList));
      } catch (_) {
        emit(UserErrorState());
      }
    });
    on<UserClearEvent>((event, emit) async {
      emit(UserEmptyState());
    });
  }
}
