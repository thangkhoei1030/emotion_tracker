// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:http_parser/http_parser.dart';

// class BaseGetBlockRepository extends BaseRepository {
//   BaseGetBlockRepository(super.controller);

//   Future<BaseResponseList<ConfigModel>> getListBlock(
//     BaseRequestPage baseRequestPage,
//   ) async {
//     var response = await baseSendRequest(
//       ApiUrl.urlApiTemplateSetting,
//       RequestMethod.POST,
//       jsonMap: baseRequestPage.toJson(
//         (x) => x.toJson(),
//       ),
//     );
//     // baseRequestPage.toJson((p0) => {});
//     log(jsonEncode(baseRequestPage.toJson((p0) => {})));
//     return BaseResponseList.fromJson(
//       response,
//       (x) => ConfigModel.fromJson(x),
//     );
//   }

//   Future<BaseResponseList<String>> uploadImage(List<File> file) async {
//     List<MultipartFile> request = List.empty(growable: true);
//     for (int i = 0; i < file.length; i++) {
//       String fileName = file[i].path.split("/").last;
//       String typeOfFile = file[i].path.split('.').last;
//       request.add(
//         await MultipartFile.fromFile(
//           file[i].path,
//           filename: fileName,
//           contentType: MediaType("image", typeOfFile),
//         ),
//       );
//     }

//     var requestBody = FormData.fromMap({"file[]": request.first});
//     var response = await baseSendRequest(
//       ApiUrl.urlUploadImages,
//       RequestMethod.POST,
//       jsonMap: requestBody,
//       isImage: true,
//     );
//     return BaseResponseList.fromJson(response, (x) => x);
//   }
// }
