import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _recordState = false;
  bool get recordState => _recordState;
  set recordState(bool _value) {
    _recordState = _value;
  }

  Color _recordButtonColor = Color(4279475858);
  Color get recordButtonColor => _recordButtonColor;
  set recordButtonColor(Color _value) {
    _recordButtonColor = _value;
  }

  String _recordButtonText = 'Record';
  String get recordButtonText => _recordButtonText;
  set recordButtonText(String _value) {
    _recordButtonText = _value;
  }

  String _scenePath = 'http://192.168.2.12:8080/scene';
  String get scenePath => _scenePath;
  set scenePath(String _value) {
    _scenePath = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
