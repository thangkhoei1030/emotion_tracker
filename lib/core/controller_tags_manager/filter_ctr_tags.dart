import 'package:emotion_tracker/core/src_core.dart';

class FilterControllerTag implements TagsManager {
  FilterControllerTag._();

  factory FilterControllerTag() => FilterControllerTag._();

  static int numberInstanceCreate = 0;

  @override
  void createInstance() {
    numberInstanceCreate++;
  }

  @override
  void disposeInstance() {
    numberInstanceCreate--;
  }

  @override
  String get tags => "FilterController $numberInstanceCreate";
}
