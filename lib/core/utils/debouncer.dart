import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

//Mặc định tìm kiếm delay sau 1s
final _debouncer = Debouncer(milliseconds: 500);

onTextChange(Function function, {bool isOnline = true}) {
  _debouncer.run(() => function());
}
