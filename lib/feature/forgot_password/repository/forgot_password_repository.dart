import 'package:emotion_tracker/core/src_core.dart';

class ForgotPasswordRepository extends BaseRepository {
  ForgotPasswordRepository(BaseGetxController controller) : super(controller);

  // Future<BaseResponse> forgotPassword(ForgotPassword forgotPassword) async {
  //   var response = await baseSendRequest(
  //       ApiUrl.forgotPassword, RequestMethod.POST,
  //       jsonMap: forgotPassword.toJson());
  //   return BaseResponse.fromJson(response);
  // }
}
