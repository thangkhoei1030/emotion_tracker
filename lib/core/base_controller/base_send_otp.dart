// import 'dart:async';

// import 'package:emotion_tracker/core/src_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// abstract class BaseSendOtpController extends BaseGetxController {
//   FocusNode focusNode = FocusNode();

//   TextEditingController pinputController = TextEditingController();

//   RxInt currentTimeResendOTP = 0.obs;

//   Timer? countdownTimerResendOTP;

//   late final PinputRepository pinputRepository;

//   late final GetVerifyCodeRequest getVerifyCodeRequest;

//   @mustCallSuper
//   @override
//   void onInit() async {
//     initialData();
//     super.onInit();
//   }

//   void runtimer() {
//     if (!(countdownTimerResendOTP?.isActive ?? false)) {
//       currentTimeResendOTP.value = PinputConst.timeOTPResend;
//       countdownTimerResendOTP =
//           Timer.periodic(const Duration(seconds: 1), (timer) {
//         currentTimeResendOTP.value = PinputConst.timeOTPResend - timer.tick;
//         if (currentTimeResendOTP.value == 0) {
//           cancelTimer();
//         }
//       });
//     }
//   }

//   ///Khởi tạo repository và verifyCodeRequest
//   ///Ở đây sẽ không khởi tạo thêm biến request resend OTP do mỗi một màn sẽ có một request khác nhau
//   @mustCallSuper
//   void initialData() {
//     pinputRepository = PinputRepository(this);
//     setVerifyCodeRequest();
//   }

//   ///Khởi tạo một obj request OTP
//   void setVerifyCodeRequest();

//   void cancelTimer() {
//     countdownTimerResendOTP?.cancel();
//   }

//   Future<void> confirmOTP();

//   Future<void> resendOTP();
// }


                                           