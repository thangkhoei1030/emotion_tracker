import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class HomeRepository extends BaseRepository {
  HomeRepository(super.controller);

  Future<BaseResponse<UserInfoResponse>> getUserResponse() async {
    var response =
        await baseSendRequest(ApiUrl.urlUserInfo, RequestMethod.POST);
    return BaseResponse.fromJson(
      response,
      func: (x) => UserInfoResponse.fromJson(x),
    );
  }
}
