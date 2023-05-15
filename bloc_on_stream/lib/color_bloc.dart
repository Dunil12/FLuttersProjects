// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum ColorEvent { event_red, event_green }

class ColorBloc {
  Color _color = Colors.red;

  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(ColorEvent event) {
    if (event == ColorEvent.event_red) {
      _color = Colors.red;
    } else if (event == ColorEvent.event_green) {
      _color = Colors.green;
    } else {
      throw Exception("Wrong Event Type");
    }

    // добавим в выходной поток новое состояние
    // (в данном случае просто переменную с значением цвета)
    _outputStateController.sink.add(_color);
  }

  // подпишемся на прослушивание выходного потока для нового состояния
  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
