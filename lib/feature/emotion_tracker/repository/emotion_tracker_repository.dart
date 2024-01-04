import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class EmotionTrackerRepository extends BaseRepository {
  EmotionTrackerRepository(super.controller);

  Future<BaseResponse<QuizResponse>> getQuiz() async {
    var response = await baseSendRequest(ApiUrl.urlGetQuiz, RequestMethod.POST);
    return BaseResponse.fromJson(
      response,
      func: (x) => QuizResponse.fromJson(x),
    );
  }

  Future<BaseResponse> sendAnswer(AnswerRequest answerRequest) async {
    var response = await baseSendRequest(
      ApiUrl.urlAnswerQuestion,
      RequestMethod.POST,
      jsonMap: answerRequest.toJson(),
    );
    return BaseResponse.fromJson(response);
  }
}
