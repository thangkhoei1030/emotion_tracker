import 'package:flutter/widgets.dart';
import 'package:emotion_tracker/core/src_core.dart';

class SimpleListView<T> extends StatelessWidget {
  const SimpleListView({
    super.key,
    required this.data,
    this.separatorWidget,
    required this.itemBuilder,
    this.scrollController,
    this.scrollPhysics,
    this.scrollDirection = Axis.vertical,
    this.height,
    this.padding,
    this.showEmptyWidget = true,
  });
  final List<T> data;
  final Widget? separatorWidget;
  final NullableIndexedWidgetBuilder itemBuilder;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final Axis scrollDirection;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool showEmptyWidget;
  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? showEmptyWidget
            ? const Align(
                alignment: Alignment.center,
                child: EmptyWidget(),
              )
            : const SizedBox.shrink()
        : SizedBox(
            height: scrollDirection == Axis.horizontal ? height : null,
            child: ListView.separated(
              padding: padding,
              controller: scrollController,
              physics: scrollPhysics,
              itemBuilder: itemBuilder,
              scrollDirection: scrollDirection,
              separatorBuilder: (context, index) {
                return separatorWidget ?? const SizedBox.shrink();
              },
              itemCount: data.length,
            ),
          );
  }
}
