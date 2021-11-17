import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/bloc/user_event.dart';
import 'package:fluttertest/bloc/user_state.dart';
import 'package:fluttertest/data/users_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  final UserRepository usersDataRepository;

  UserBloc(this.usersDataRepository) : super(UserLoadingState()); 
  
  @override
  Stream<UserState> mapEventToState(UserEvent event) async*{
      if(event is UserLoadEvent) {
      try{
        final _loadedUserList = await usersDataRepository.getUsersList();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (_) {
        yield UserErrorState();
      }
      }
  }
}