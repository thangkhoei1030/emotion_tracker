import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BasePageSearchWidget<T extends BasePageSearchController>
    extends BaseRefreshWidget<T> {
  const BasePageSearchWidget({Key? key}) : super(key: key);

  Widget buildPageSearchPinned({
    required String title,
    required Widget body,
  }) {
    return PageScaffold(
      showAppBar: true,
      showBackButton: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextBuild(
            title: title,
            isBoldText: true,
            fontSize: AppDimens.sizeTextDefault,
          )
        ],
      ),
      child: Column(
        children: [
          UtilWidget.sizedBoxPadding,
          _buildInputSearch(),
          UtilWidget.sizedBoxPadding,
          Expanded(
            child: body,
          )
        ],
      ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //       onPressed: () => Get.back(),
      //       icon: const Icon(
      //         Icons.arrow_back_ios,
      //       )),
      //   title:
      //   centerTitle: true,
      // ),
      // body: Column(
      //   children: [
      //     UtilWidget.sizedBoxPadding,
      //     _buildInputSearch(),
      //     UtilWidget.sizedBoxPadding,
      //     Expanded(
      //       child: body,
      //     )
      //   ],
      // ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
    );
  }

  Widget _buildInputSearch() {
    return CardBuilder(
      paddingModel:
          const PaddingModel(paddingVerical: AppDimens.defaultPadding),
      child: BuildInputText(InputTextModel(
        controller: controller.searchController,
        textSize: AppDimens.sizeTextDefault,
        labelText: AppStr.hintSearch,
        iconLeading: Icons.search,
      )),
    );
  }
}
