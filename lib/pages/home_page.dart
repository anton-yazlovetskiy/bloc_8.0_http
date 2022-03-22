import 'package:bloc_8_http/bloc/bloc_events.dart';
import 'package:bloc_8_http/bloc/bloc_user.dart';
import 'package:bloc_8_http/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  //final UserProvider _users = UserProvider();

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User list'),
        actions: [
          IconButton(
            onPressed: () {
              userBloc.add(UserClearEvent());
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: const Center(
        child: UserList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userBloc.add(UserLoadEvent());
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
