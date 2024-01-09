import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:emotion_tracker/core/src_core.dart';

typedef WidgetProcessCallBack = Widget Function(
    BuildContext, String, DownloadProgress);
typedef WidgetErrorCallBack = Widget Function(BuildContext, String, dynamic);
typedef WidgetImageBuilder = Widget Function(
    BuildContext, ImageProvider<Object>);

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    super.key,
    required this.urlImage,
    this.layout,
    this.fit,
    this.errorWidget,
    this.widgetProcessCallBack,
    this.widgetErrorCallBack,
    this.widgetImageBuilder,
    this.isSlider = false,
    this.radiusImage = const RadiusModel(),
    this.heightImage,
    this.widthImage,
    this.onPressed,
    this.backgroundColor,
  });
  final ConfigLayout? layout;
  final String urlImage;
  final Widget? errorWidget;
  final WidgetProcessCallBack? widgetProcessCallBack;
  final WidgetErrorCallBack? widgetErrorCallBack;
  final WidgetImageBuilder? widgetImageBuilder;
  final BoxFit? fit;
  final bool isSlider;
  final RadiusModel radiusImage;
  final double? heightImage;
  final double? widthImage;
  final Function()? onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      onPressed: onPressed,
      child: urlImage.isNotEmpty
          ? CachedNetworkImage(
              memCacheHeight: heightImage?.ceil(),
              memCacheWidth: widthImage?.ceil(),
              color: HexColor.fromHex(layout?.colorItem),
              progressIndicatorBuilder: widgetProcessCallBack ??
                  (context, url, progress) {
                    return Container(
                      color: Colors.transparent,
                      height: heightImage,
                      width: widthImage,
                      child: Center(
                          child: LoadingAnimationWidget.bouncingBall(
                        color: Colors.red,
                        size: 20,
                      )),
                    );
                  },
              useOldImageOnUrlChange: false,
              imageBuilder: widgetImageBuilder ??
                  (context, imageProvider) {
                    return CardBuilder(
                      backgroundColor: backgroundColor ?? Colors.transparent,
                      height: heightImage,
                      width: widthImage,
                      child: ClipRRect(
                        borderRadius: radiusImage.radiusAll != null
                            ? BorderRadius.circular(radiusImage.radiusAll!)
                            : BorderRadius.only(
                                bottomRight: Radius.circular(
                                    radiusImage.radiusBottomRight ?? 0),
                                bottomLeft: Radius.circular(
                                    radiusImage.radiusBottomLeft ?? 0),
                                topLeft: Radius.circular(
                                    radiusImage.radiusTopLeft ?? 0),
                                topRight: Radius.circular(
                                    radiusImage.radiusTopRight ?? 0),
                              ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: fit,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
              errorWidget: widgetErrorCallBack ??
                  (context, _, error) {
                    return CardBuilder(
                      backgroundColor: Colors.transparent,
                      radiusModel: radiusImage,
                      child: BuildImageLoadError(
                        heightImage: heightImage,
                        widthImage: widthImage,
                        layout: layout,
                        isSlider: isSlider,
                        radiusModel: radiusImage,
                      ),
                    );
                  },
              imageUrl: urlImage,
            )
          : CardBuilder(
              backgroundColor: Colors.transparent,
              radiusModel: radiusImage,
              child: BuildImageLoadError(
                heightImage: heightImage,
                widthImage: widthImage,
                layout: layout,
                isSlider: isSlider,
                radiusModel: radiusImage,
              ),
            ),
    );
  }
}
