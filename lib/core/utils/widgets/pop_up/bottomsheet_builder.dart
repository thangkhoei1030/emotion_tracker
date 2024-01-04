import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class BottomSheetBuilder extends StatelessWidget {
  const BottomSheetBuilder({
    super.key,
    required this.title,
    required this.child,
    this.iconLeading,
    this.leadingFuntion,
    this.actions = const [],
    this.centerTitle = true,
  });
  final String title;
  final IconData? iconLeading;
  final VoidCallback? leadingFuntion;
  final List<Widget> actions;
  final bool centerTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CardBuilder(
      boxConstrainsModel: BoxConstrainsModel(maxHeight: Get.height / 3),
      radiusModel: const RadiusModel(
        radiusAll: AppDimens.radius20,
      ),
      child: Column(
        children: [
          _buildAppBar(),
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SizedBox(
      height: kToolbarHeight,
      child: Row(
        children: [
          Visibility(
            visible: iconLeading != null,
            child: IconButton(
              onPressed: leadingFuntion,
              icon: Icon(iconLeading),
            ),
          ),
          Expanded(
            child: Align(
              alignment: centerTitle ? Alignment.center : Alignment.centerLeft,
              child: AutoSizeText(
                title,
                style: Get.textTheme.titleLarge,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: actions,
          ),
        ],
      ),
    );
  }
}
