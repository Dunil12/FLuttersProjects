// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  bool _loading = false;
  double _progressValue = 0.0;
  
  // необходимо для производительности (инициализация один раз)
  // void initState(){
  //   _loading = false;
  //   _progressValue = 0.0;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // типа контейнер
      backgroundColor: Colors.indigo,

      // menu
      appBar: AppBar(
        title: Text(
          "My first app",
        ),
        centerTitle: true,
      ),

      // body
      body: Center(
        child: Container(
            padding: EdgeInsets.all(16),
            child: _loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        LinearProgressIndicator(value: _progressValue / 100),
                        Text(
                          "${_progressValue.round()}%",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ])
                : Text(
                    "Press button to download",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
      ),

      // плавающая кнопка
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _loading = !_loading;
            _updateProgress();
          });
        },
        child: Icon(
          Icons.cloud_download,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    ));
  }


  // функция обновления загрузки
  void _updateProgress(){
    final oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      setState(() {
        _progressValue += 20.0;

        if (_progressValue == 100.0){
          _loading = false;
          timer.cancel();
          _progressValue = 0.0;
          return;
        }

      });
     });
  }
}
