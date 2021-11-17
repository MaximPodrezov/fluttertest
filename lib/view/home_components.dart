import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/bloc/user_bloc.dart';
import 'package:fluttertest/bloc/user_event.dart';
import 'package:fluttertest/bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    userBloc.add(UserLoadEvent());
    
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if(state is UserLoadingState) {
        return Center(child: CircularProgressIndicator(),);
      } else if(state is UserLoadedState) {
        return ListView.builder(
      itemCount: state.loadedUser.length,
      itemBuilder: (context, index) => Container(
        child: ListTile(
          leading: Text('ID: ${state.loadedUser[index].id})', style: TextStyle(fontWeight: FontWeight.bold),),
          title: Column(children: [
            Text('${state.loadedUser[index].name}', style: TextStyle(fontWeight: FontWeight.bold)),
            Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
              Text('${state.loadedUser[index].phone}'),
              Text('${state.loadedUser[index].email}')
            ],)
          ],)
        )
      ),
    );
     } else if(state is UserErrorState) {
       return Text("Error! BadData!", style: TextStyle(color: Colors.red),);
     } else {
       throw Exception("eee");
     }
    });
  }
}