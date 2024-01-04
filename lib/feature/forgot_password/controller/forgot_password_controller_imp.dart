import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:emotion_tracker/pages/pages.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordControllerImp extends ForgotPasswordController {
  @override
  void onInit() {
    repository = ForgotPasswordRepository(this);
    super.onInit();
  }
}
