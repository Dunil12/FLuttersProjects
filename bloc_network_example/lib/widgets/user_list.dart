import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// здесь выводим список пользователей

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      // если не нажали кнопку load
      if (state is UserEmptyState) {
        return const Center(
          child: Text(
            "Please click button 'Load'",
            style: TextStyle(fontSize: 20),
          ),
        );
      }

      // если нажали load
      if (state is UserLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }

      // если скачались данные с api
      if (state is UserLoadedState) {
        return ListView.builder(
          itemCount: state.loadedUser.length,
          itemBuilder: (context, index) => Container(
            color: index % 2 == 0 ? Colors.white : Colors.blue[50],
            child: ListTile(
              leading: Text(
                "Id: ${state.loadedUser[index].id}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              title: Column(
                children: [
                  Text(
                    "${state.loadedUser[index].name}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text(
                        "${state.loadedUser[index].email}",
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "${state.loadedUser[index].phone}",
                        style: const TextStyle(fontStyle: FontStyle.italic),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }

      // если ошибка
      if (state is UserErrorState) {
        return const Center(
          child: Text(
            "Error to load users",
            style: TextStyle(fontSize: 20),
          ),
        );
      }

      return const SizedBox.shrink();
    });

    // // return const SizedBox.shrink();
  }
}
