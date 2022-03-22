import 'package:bloc_8_http/bloc/bloc_state.dart';
import 'package:bloc_8_http/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return const Center(
          child: Text('Пользователи не загружены'),
        );
      }

      if (state is UserLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(state.loadedUser[index].name),
              subtitle: Text(
                  '${state.loadedUser[index].email} / ${state.loadedUser[index].phone}'),
            ),
          ),
        );
      }
      return const Center(
        child: Text('Error'),
      );
    });
  }
}
