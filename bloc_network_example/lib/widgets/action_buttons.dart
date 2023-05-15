import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:flutter/material.dart'; 
import 'package:flutter_bloc/flutter_bloc.dart';

// здесь две кнопки (load and clear)

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: () {
              _userBloc.add(LoadUserEvent());
            },
            child: Text("Load"),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            )),
        const SizedBox(
          width: 8.0,
        ),
        ElevatedButton(
            onPressed: () {
              _userBloc.add(ClearUserEvent());
            },
            child: Text("Clear"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ))
      ],
    );
  }
}
