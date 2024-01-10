import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileEditController extends BaseGetxController {
  final HomeController homeController = Get.find();

  late final ProfileEditRepository profileEditRepository;

  late final Rx<UserInfoResponse> userInfoResponse =
      homeController.userInfoResponse;

  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickImage(ImageSource source);

  Future<void> logOut();
}
