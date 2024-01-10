import 'dart:io';
import 'package:device_preview/device_preview.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/src_pages.dart';

String applicationPath = "";
void main() async {
  await GetStorage.init();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  _errorWidgetBuilder();
  if (Platform.isIOS) {
    showBarNotificationIOS();
  }

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());

  // runApp(
  //   MediaQuery(
  //     data: const MediaQueryData(),
  //     child: Builder(
  //       builder: (context) => DevicePreview(
  //         enabled: kDebugMode,
  //         builder: (context) {
  //           return const MyApp();
  //         }, // Wrap your app
  //       ),
  //     ),
  //   ),
  // );

  applicationPath =
      (await path_provider.getApplicationDocumentsDirectory()).path;
  // await DefaultFirebaseOptions.initializeFirebase();

  // final Trace myTrace = FirebasePerformance.instance.newTrace("test");

  // await myTrace.start();

  // await myTrace.stop();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  // await FirebaseAnalyticsSetup.writeLogErrorResponse(error: "ERRORRRRR");
  // /TODO: Chỉ sử dụng khi muốn test nhiều màn hình

  //TODO:Logging Sentry
  // runZonedGuarded(
  //   () async {
  //     WidgetsFlutterBinding.ensureInitialized();

  //     applicationPath =
  //         (await path_provider.getApplicationDocumentsDirectory()).path;

  //     await DefaultFirebaseOptions.initializeFirebase();

  //     // await FirebaseAnalyticsSetup.writeLogErrorResponse(error: "ERRORRRRR");
  //     await SentryInitial().appInitial(const MyApp());
  //   },
  //   (error, stackTrace) {
  //     log(error.toString());
  //     FirebaseAnalyticsSetup.writeLogException(error, stackTrace);
  //     Sentry.captureException(error, stackTrace: stackTrace);
  //   },
  // );
}

void _errorWidgetBuilder() {
  ErrorWidget.builder = (details) {
    return CardBuilder(
      height: 200,
      radiusModel: const RadiusModel(radiusAll: AppDimens.radius8),
      backgroundColor: Colors.red.withOpacity(0.01),
      paddingModel: const PaddingModel(
        paddingHorizontal: AppDimens.defaultPadding,
        paddingVerical: AppDimens.paddingSmall,
      ),
      child: TextBuild(
        title: details.exception.toString(),
      ),
    );
  };
}

void showBarNotificationIOS() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(393, 803),
        builder: (context, child) => GetMaterialApp(
          locale: DevicePreview.locale(context),
          // locale: const Locale('vi', 'VN'),
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashPage,
          getPages: PageRoutes.pageRoutes,
          // builder: DevicePreview.appBuilder,
          useInheritedMediaQuery: false,
          builder: (context, child) => ScrollConfiguration(
            behavior: MyBehavior(),
            child: MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: child ?? Container()),
            ),
          ),
          title: AppStr.appName,
          theme: AppTheme().getThemeByAppTheme(),
          navigatorObservers: [
            NavigatorObservers(),
          ],
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class NavigatorObservers extends GetObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    // dateTime = DateTime.now();
  }
}
