import 'package:emotion_tracker/core/src_core.dart';

class ProductCtrTags implements TagsManager {
  ProductCtrTags._();

  factory ProductCtrTags() => ProductCtrTags._();

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
  // TODO: implement tags
  String get tags => "productCtrId $numberInstanceCreate";
}
