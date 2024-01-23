import 'package:emotion_tracker/core/src_core.dart';

class ProductDetailCtrTags implements TagsManager {
  ProductDetailCtrTags._();

  factory ProductDetailCtrTags() => ProductDetailCtrTags._();

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
  String get tags => "productDetailCtrId $numberInstanceCreate";
}
