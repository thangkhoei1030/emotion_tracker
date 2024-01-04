import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';

class CardBuilder extends StatelessWidget {
  const CardBuilder(
      {super.key,
      required this.child,
      this.radiusModel = const RadiusModel(),
      this.boxShadow,
      this.backgroundColor,
      this.height,
      this.width,
      this.isBorder = false,
      this.boxConstrainsModel,
      this.borderColor,
      this.alignment = Alignment.center,
      this.onTap,
      this.paddingModel,
      this.linearGradient,
      this.elevation});

  final double? height;
  final double? width;
  final Widget child;
  final RadiusModel radiusModel;
  final List<BoxShadow>? boxShadow;
  final Color? backgroundColor;
  final PaddingModel? paddingModel;
  final bool isBorder;
  final BoxConstrainsModel? boxConstrainsModel;
  final Color? borderColor;
  final Alignment alignment;
  final Function()? onTap;
  final LinearGradient? linearGradient;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0,
      color: backgroundColor,
      type: MaterialType.card,
      borderOnForeground: false,
      borderRadius: radiusModel.radiusAll != null
          ? BorderRadius.circular(radiusModel.radiusAll!)
          : BorderRadius.only(
              bottomRight: Radius.circular(radiusModel.radiusBottomRight ?? 0),
              bottomLeft: Radius.circular(radiusModel.radiusBottomLeft ?? 0),
              topLeft: Radius.circular(radiusModel.radiusTopLeft ?? 0),
              topRight: Radius.circular(radiusModel.radiusTopRight ?? 0),
            ),
      child: SimpleButton(
          onPressed: onTap,
          child: Container(
            padding: paddingModel != null
                ? paddingModel!.paddingAll != null
                    ? EdgeInsets.all(paddingModel!.paddingAll!)
                    : EdgeInsets.symmetric(
                        vertical: paddingModel!.paddingVerical ?? 0,
                        horizontal: paddingModel!.paddingHorizontal ?? 0,
                      )
                : EdgeInsets.zero,
            height: height,
            width: width,
            alignment: alignment,
            constraints: boxConstrainsModel != null
                ? BoxConstraints(
                    maxHeight: boxConstrainsModel!.maxHeight,
                    minHeight: boxConstrainsModel!.minHeight,
                    maxWidth: boxConstrainsModel!.maxWidth,
                    minWidth: boxConstrainsModel!.minWidth,
                  )
                : null,
            decoration: BoxDecoration(
              gradient: linearGradient,
              border: isBorder
                  ? Border.all(
                      color: borderColor ?? context.primaryColor, width: 1)
                  : null,
              color: backgroundColor ?? context.backGroundCardColor,
              borderRadius: radiusModel.radiusAll != null
                  ? BorderRadius.circular(radiusModel.radiusAll!)
                  : BorderRadius.only(
                      bottomRight:
                          Radius.circular(radiusModel.radiusBottomRight ?? 0),
                      bottomLeft:
                          Radius.circular(radiusModel.radiusBottomLeft ?? 0),
                      topLeft: Radius.circular(radiusModel.radiusTopLeft ?? 0),
                      topRight:
                          Radius.circular(radiusModel.radiusTopRight ?? 0),
                    ),
              //Here goes the same radius, u can put into a var or function
            ),
            child: child,
            // child: _childBody(),
          )),
    );
  }

  Widget _childBody() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
            radiusModel.radiusAll ?? radiusModel.radiusTopLeft ?? 0),
        topRight: Radius.circular(
            radiusModel.radiusAll ?? radiusModel.radiusTopRight ?? 0),
      ),
      child: Padding(
        padding: paddingModel != null
            ? paddingModel!.paddingAll != null
                ? EdgeInsets.all(paddingModel!.paddingAll!)
                : EdgeInsets.symmetric(
                    vertical: paddingModel!.paddingVerical ?? 0,
                    horizontal: paddingModel!.paddingHorizontal ?? 0,
                  )
            : EdgeInsets.zero,
        child: child,
        // child: isSurfaces
        //     ? Material(borderOnForeground: false, elevation: 8, child: child)
        //     : child,
      ),
    );
  }
}
