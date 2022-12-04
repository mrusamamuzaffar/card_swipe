import 'package:flutter/foundation.dart';
import 'constants.dart';

class TransformData extends ChangeNotifier {
  bool _leftDrag = false;
  double _tDelta = 0;
  double spreadRadians = defaultSpread;

  TransformData({required this.spreadRadians});

  get isLeftDrag => _leftDrag;

  get transformDelta => _tDelta;

  setTransformDelta(double newDelta) {
    _tDelta = newDelta;
    notifyListeners();
  }

  setLeftDrag(bool isLeftDrag) {
    _leftDrag = isLeftDrag;
  }
}