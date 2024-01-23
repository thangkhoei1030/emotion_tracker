// import 'package:emotion_tracker/core/src_core.dart';
// import 'package:flutter/material.dart';
// import 'package:emotion_tracker/core/src_core.dart';

// abstract class BaseSearchAppBarWidget<T extends BaseSearchAppbarController>
//     extends BaseGetWidget<T> {
//   const BaseSearchAppBarWidget({Key? key}) : super(key: key);

// Widget buildPage({
//   required String title,
//   required Widget buildBody,
//   String? titleEmpty,
//   String? titleBotton,
//   String? hintSearch,
//   Function()? actionButtonOnpress,
//   bool backButton = true,
//   Widget actionExtra = const SizedBox(),
//   bool showAppBar = true,
//   Widget? buildWidgetEmpty,
//   bool showWidgetEmpty = true,
//   bool isActionFilter = false,
//   RxBool? isFilter,
//   var actionFilterButtonOnpress,
//   bool showOffline = true,
// }) {
//   return Obx(
//     () => Scaffold(
//       backgroundColor: AppColors.stickyHead(),
//       appBar: showAppBar
//           ? UtilWidget.buildBaseBackgroundAppBar(
//               title: UtilWidget.buildSearch(
//                 textEditingController: controller.textSearchController,
//                 hintSearch: hintSearch ?? AppStr.hintSearch,
//                 function: () async {
//                   controller.isSearch.value =
//                       controller.textSearchController.text.isNotEmpty;
//                   await controller.functionSearch();
//                 },
//                 isClear: controller.isClear,
//                 autofocus: false,
//               ),
//               backButton: backButton,
//               actions: [
//                 actionExtra,
//               ],
//             )
//           : null,
//       body: baseShimmerLoading(
//         () => controller.rxList.isNotEmpty
//             ? buildBody
//             : _buildViewEmpty(
//                 buildWidgetEmpty,
//                 titleEmpty,
//                 actionButtonOnpress,
//               ),
//       ),
//       // floatingActionButton:
//       //     controller.showBackToTopButton.value ? _buildToTop() : null,
//     ),
//   );
// }

// Widget _buildViewEmpty(
//     Widget? buildWidgetEmpty, String? titleEmpty, Function()? function) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       SingleChildScrollView(
//         child: (buildWidgetEmpty ??
//             Column(
//               children: [
//                 UtilWidget.buildListEmpty(titleEmpty ?? AppStr.emptyList)
//                     .paddingOnly(
//                   top: Get.height / 3,
//                 ),
//                 BaseButton(
//                   titleButton: AppStr.reload,
//                   function: function ?? () {},
//                   width: Get.width / 2,
//                 ).paddingOnly(
//                   top: AppDimens.paddingMedium,
//                 ),
//               ],
//             )),
//       ),
//     ],
//   );
// }
// }
