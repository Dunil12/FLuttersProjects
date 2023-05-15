import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:bloc_network_example/widgets/action_buttons.dart';
import 'package:bloc_network_example/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// здесь все соединяем в главную страницу

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserBloc(userRepository: userRepository)
          ..add(
              LoadUserEvent()), // чтобы при запуске приложения сразу скачивались данные
        child: Scaffold(
          appBar: AppBar(
            title: const Text("User List"),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              ActionButtons(),
              Expanded(child: UserList()),
            ],
          ),
        ));
  }
}
