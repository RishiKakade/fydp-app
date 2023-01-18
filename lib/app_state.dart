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

  String _sceneImage = '';
  String get sceneImage => _sceneImage;
  set sceneImage(String _value) {
    _sceneImage = _value;
  }

  String _blueSpeakerPath = '';
  String get blueSpeakerPath => _blueSpeakerPath;
  set blueSpeakerPath(String _value) {
    _blueSpeakerPath = _value;
  }

  String _redSpeakerPath = '';
  String get redSpeakerPath => _redSpeakerPath;
  set redSpeakerPath(String _value) {
    _redSpeakerPath = _value;
  }

  String _orangeSpeakerPath = '';
  String get orangeSpeakerPath => _orangeSpeakerPath;
  set orangeSpeakerPath(String _value) {
    _orangeSpeakerPath = _value;
  }

  String _greenSpeakerPath = '';
  String get greenSpeakerPath => _greenSpeakerPath;
  set greenSpeakerPath(String _value) {
    _greenSpeakerPath = _value;
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
