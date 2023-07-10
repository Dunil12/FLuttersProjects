// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(App(counterWidget: CounterWidget()));
}

class App extends StatelessWidget {
  final CounterWidget counterWidget;
  const App({Key? key, required this.counterWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Counter"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Tap "-" to decrement',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                counterWidget,
                Text(
                  'Tap "+" to increment',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterWidgetState();
  }
}

// виджет счетсчика
class _CounterWidgetState extends State<CounterWidget> {
  int _count = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _count -= 1;
                  });
                },
                icon: Icon(
                  Icons.remove,
                  color: Colors.white,
                )),
            Text(
              "${_count}",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    _count += 1;
                  });
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ));
  }
}
