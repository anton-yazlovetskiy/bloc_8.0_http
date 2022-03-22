import 'package:bloc_8_http/bloc/bloc_user.dart';
import 'package:bloc_8_http/model/user_repository.dart';
import 'package:bloc_8_http/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<UserBloc>(
          create: (context) => UserBloc(userRepository: userRepository),
          child: const MyHomePage()),
    );
  }
}
