enum ScreenDefine {
  home,
  weatherDetail,
  settings,
}

extension ScreenDefineExt on ScreenDefine {
  String get path {
    switch (this) {
      case ScreenDefine.home:
        return '/';

      default:
        return name;
    }
  }
}

enum ScreenArgs {
  latitude,
  longitude,
}
