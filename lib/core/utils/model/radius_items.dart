class RadiusModel {
  final double? radiusTopLeft;
  final double? radiusTopRight;
  final double? radiusBottomLeft;
  final double? radiusBottomRight;
  final double? radiusAll;
  const RadiusModel({
    this.radiusTopLeft,
    this.radiusTopRight,
    this.radiusBottomLeft,
    this.radiusBottomRight,
    this.radiusAll,
  });
}

class PaddingModel {
  final double? paddingAll;
  final double? paddingHorizontal;
  final double? paddingVerical;
  const PaddingModel({
    this.paddingAll,
    this.paddingHorizontal,
    this.paddingVerical,
  });
}
