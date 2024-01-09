import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class ProfileEditRepository extends BaseRepository {
  ProfileEditRepository(super.controller);

  Future<BaseResponse> changePassword(ChangePasswordRequest request) async {
    var response = await baseSendRequest(
      ApiUrl.changePassword,
      RequestMethod.POST,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }

  Future<BaseResponse> updateAvatar({XFile? xfile}) async {
    FormData? data;
    if (xfile != null) {
      String fileType = xfile.path.split('.').last;
      data = FormData.fromMap({
        "file": await MultipartFile.fromFile(xfile.path,
            filename: xfile.name,
            contentType: MediaType(
              "image",
              fileType,
            )),
      });
    }

    var response = await baseSendRequest(
      ApiUrl.updateAvatar,
      RequestMethod.POST,
      jsonMap: data,
      isImage: true,
    );
    return BaseResponse.fromJson(response);
  }
}
