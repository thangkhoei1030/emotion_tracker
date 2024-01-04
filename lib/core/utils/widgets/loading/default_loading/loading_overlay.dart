import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:emotion_tracker/core/src_core.dart';

class LoadingOverlayWidget extends StatelessWidget {
  const LoadingOverlayWidget({
    super.key,
    required this.child,
    this.aspectRatio = 1,
    this.isLoadingPage = true,
  });

  final Widget child;

  final double aspectRatio;

  final bool isLoadingPage;

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayOpacity: 0.1,
      overlayWidget: !isLoadingPage
          ? AspectRatio(
              aspectRatio: aspectRatio,
              child: _buildLoading(),
            )
          : _buildLoading(),
      useDefaultLoading: false,
      child: child,
    );
  }

  Widget _buildLoading() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radius8),
        color: Colors.black.withOpacity(0.4),
      ),
      child: const AnimationDialog(
        animationDialogType: AnimationDialogType.loading,
        height: 50,
        width: 50,
      ),
    );
  }
}
