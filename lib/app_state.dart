import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _seatCount = prefs.getInt('ff_seatCount') ?? _seatCount;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _seatCount = 0;
  int get seatCount => _seatCount;
  set seatCount(int value) {
    _seatCount = value;
    prefs.setInt('ff_seatCount', value);
  }

  bool _ssearch = false;
  bool get ssearch => _ssearch;
  set ssearch(bool value) {
    _ssearch = value;
  }

  int _titalticket = 0;
  int get titalticket => _titalticket;
  set titalticket(int value) {
    _titalticket = value;
  }

  int _sum = 0;
  int get sum => _sum;
  set sum(int value) {
    _sum = value;
  }

  int _totalprice = 0;
  int get totalprice => _totalprice;
  set totalprice(int value) {
    _totalprice = value;
  }

  int _ticketprice = 0;
  int get ticketprice => _ticketprice;
  set ticketprice(int value) {
    _ticketprice = value;
  }

  int _sutostore = 0;
  int get sutostore => _sutostore;
  set sutostore(int value) {
    _sutostore = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
