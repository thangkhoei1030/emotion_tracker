import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class LoginControllerImp extends LoginController with AnimationLogin {
  @override
  void onInit() {
    super.onInit();
    _initController();
    initialAnimation();
    loadingAnimation();
  }

  @override
  void onClose() {
    closeAnimation();
    super.onClose();
  }

  void _initController() {
    loginRepository = LoginRepository(this);
    usernameController.text = APP_DATA.get(AppConst.keyUserName) ?? "";
  }

  @override
  Future<void> funcLogin() async {
    if (formKey.currentState?.validate() ?? false) {
      KeyBoard.hide();
      teddyController.coverEyes(false);
      try {
        showLoading();
        await _login();
        teddyController.submit(isSucess: true);
      } catch (e) {
        teddyController.submit(isSucess: false);
      } finally {
        hideLoading();
      }
    }
  }

  Future<void> _login() async {
    loginRequest = loginRequest.copyWith(
        userName: usernameController.text, password: passwordController.text);
    await CookiesSingleton()
        .createCookiesForUser(userName: usernameController.text);
    await loginRepository.login(loginRequest).then((value) async {
      await _saveAccountToLocal(value);
      _gotoHomePage();
    });
  }

  Future<void> _saveAccountToLocal(BaseResponse baseResponse) async {
    await APP_DATA.put(AppConst.keyUserName, usernameController.text);
    await APP_DATA.put(AppConst.keyUserpassword, passwordController.text);
    await APP_DATA.put(AppConst.keyUrlBaseImage, baseResponse.extend?.cdnUrl);
  }

  Future<void> _gotoHomePage() async {
    Get.offAndToNamed(AppRoutes.homePage);
  }

  // Future<SignInResponseNotActive?> _requestApi() async {
  //   signinRequest.username = usernameController.text;
  //   signinRequest.password = passwordController.text;
  //   var response = await loginRepository.loginUser(signinRequest);
  //   return response.data;
  // }

  // void _goToPageCodeAuthen(String email) {
  //   Get.toNamed(
  //     AppRoutes.verifyAccountPage,
  //     arguments: VerifyAccountParams(
  //       email: email,
  //       password: passwordController.text,
  //     ),
  //   );
  // }
}
