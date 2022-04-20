import 'package:flutter/widgets.dart';
import 'package:portfolio/core/enum/controller_state.dart';

abstract class BaseController with ChangeNotifier {
  ControllerState state;
  String? _message;

  BaseController({this.state = ControllerState.idle});
  String? get message => _message;

  void loading() {
    state = ControllerState.loading;
    notifyListeners();
  }

  void error(String msg) {
    state = ControllerState.error;
    _message = msg;
    notifyListeners();
  }

  void idle() {
    state = ControllerState.idle;
    notifyListeners();
  }
}
