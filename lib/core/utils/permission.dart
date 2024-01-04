import 'dart:io';
import 'dart:typed_data';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:emotion_tracker/core/src_core.dart';


DateTime? _currentBackPressTime;
Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (_currentBackPressTime == null ||
      now.difference(_currentBackPressTime ?? DateTime.now()) >
          const Duration(seconds: 2)) {
    _currentBackPressTime = now;
    Fluttertoast.showToast(msg: AppStr.exitApp);
    return Future.value(false);
  }
  return Future.value(true);
}

bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

Future<PermissionStatus> checkPermission(
    List<Permission> listPermission) async {
  PermissionStatus status = PermissionStatus.granted;
  Map<Permission, PermissionStatus> statuses = await listPermission.request();
  for (var value in statuses.values) {
    if (value == PermissionStatus.permanentlyDenied) {
      status = PermissionStatus.permanentlyDenied;
      break;
    }
    if (value == PermissionStatus.denied) {
      status = PermissionStatus.denied;
      break;
    }
  }
  return status;
}

Future<String> getPath(String fileName) async {
  String path =
      await getApplicationDocumentsDirectory().then((value) => value.path);

  return '$path${Platform.pathSeparator}$fileName';
}

Future<String> saveFile(String fileName, Uint8List bytes) async {
  File file = File(await getPath(fileName));
  file.writeAsBytes(bytes);

  return file.path;
}
