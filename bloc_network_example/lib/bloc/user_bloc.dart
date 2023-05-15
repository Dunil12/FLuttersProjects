import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(UserEmptyState()) {
    on<LoadUserEvent>(
      (event, emit) async {
        emit(UserLoadingState());

        try {
          final List<User> loadedUserList = await userRepository.getAllUsers();
          emit(UserLoadedState(loadedUser: loadedUserList));
        } catch (_) {
          emit(UserErrorState());
        }
      },
    );
    on<ClearUserEvent>(
      (event, emit) async {
        emit(UserEmptyState());
      },
    );
  }
}


// class UserBLoc extends Bloc<UserEvent, UserState> {
//   // изначально состояние - пустой список
//   final UserRepository userRepository;
//   UserBLoc({required this.userRepository}) : super(UserEmptyState()) {
//     // первое событие
//     on<LoadUserEvent>((event, emit) async {
//       emit(UserLoadingState());

//       try {
//         final List<User> loadedUserList = await userRepository.getAllUsers();
//         emit(UserLoadedState(loadedUser: loadedUserList));
//       } catch (_) {
//         emit(UserErrorState());
//       }
//     });

//     // второе событие
//     on<ClearUserEvent>((event, emit) async {
//       emit(UserEmptyState());
//     });
//   }
// }
