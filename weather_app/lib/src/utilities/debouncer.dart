import 'dart:async';

class Debouncer<T> {
  final Duration duration;
  void Function(T?) onValue;
  T? _value;
  Timer? _timer;
  T? get value => _value;
  set value(T? value) {
    _value = value;
    _timer?.cancel();
    _timer = Timer(duration, () => onValue(_value));
  }

  Debouncer({required this.onValue, Duration? duration})
      : duration = duration ?? const Duration(milliseconds: 200);
}
