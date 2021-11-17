import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/bloc/user_bloc.dart';
import 'package:fluttertest/data/users_repository.dart';
import 'package:fluttertest/view/home_components.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);

  final usersRepository = UserRepository();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(create: (context) => UserBloc(usersRepository), child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.black, title: Text("Users Info")),
      body: Column(children: [Expanded(child: UserList())]),
    ),
      );
  }
}