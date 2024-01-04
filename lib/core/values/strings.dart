import 'dart:io';

class AppStr {
  static const String appName = "Web 4s";
  static const String notification = 'Thông báo';
  static const String exitApp = 'Vuốt lần nữa để thoát';
  static const String dataEmpty = "Không có dữ liệu";
  static const String hintSearch = "Tìm kiếm";
  static const String close = "Đóng";
  static const String cancel = 'Hủy';
  static const String permissionHelper =
      '$appName không có quyền truy cập trên thiết bị của bạn. Vui lòng cấp thêm quyền cho ứng dụng để tiếp tục thao tác';
  static const String openSettings = 'Mở cài đặt';
  static const String confirm = "Xác nhận";
  static const String emptyList = "Danh sách trống!";
  static const String reload = "Tải lại";
  static const String reloadPage = "Kéo để tải lại trang";
  static const String imageNotAvalable = "Không có hình ảnh";
  static const String phoneSupport = "0383705838";
  static const String zaloSupportUrl = "zalo.me/pc";
  static const String facebookSupportUrl = "www.facebook.com/";
  static const String guaranteeSupportUrl =
      "https://chien01.web4s.com.vn/chinh-sach-bao-hanh";
  static const String securitySupportUrl =
      "https://chien01.web4s.com.vn/chinh-sach-bao-mat";
  static const String introduceUrl =
      "https://chien01.web4s.com.vn/gioi-thieu-dago";
  static const String titleBanned = "find the best choice for you";
  static const String noData = "Không có dữ liệu";

  static const String delete = "Xoá";
  static const String android = "android";
  static const String ios = "ios";
  static const String defaultDateInValid = "--/--/----";

  static String get currentPlatform => Platform.isAndroid ? android : ios;
}
