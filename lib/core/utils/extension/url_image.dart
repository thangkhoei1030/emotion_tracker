import 'package:emotion_tracker/core/src_core.dart';
//

extension UrlImage on String? {
  String toUrlCDN() {
    return "${APP_DATA.get(AppConst.keyUrlBaseImage)}$this";
  }
}

// extension UrlImageStr on String {
//   String formatUrl() {
//     return ImageBlockData(image: this, source: ImageSourceEnum.fromCDN)
//         .getUrlImage();
//   }
// }
