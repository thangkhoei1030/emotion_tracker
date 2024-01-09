import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class LoginRepository extends BaseRepository {
  LoginRepository(BaseGetxController controller) : super(controller);

  Future<BaseResponse> login(LoginRequest request) async {
    var response = await baseSendRequest(
      ApiUrl.urlLogin,
      RequestMethod.POST,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }
}
