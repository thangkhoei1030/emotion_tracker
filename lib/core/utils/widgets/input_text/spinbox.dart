import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';

class BuildSpinbox extends StatefulWidget {
  const BuildSpinbox({
    super.key,
    required this.quantityOfProductItem,
    this.maxQuantityOfProductItem,
    required this.idOfProductItem,
  });

  final int idOfProductItem;

  final int quantityOfProductItem;

  final int? maxQuantityOfProductItem;

  @override
  State<BuildSpinbox> createState() => _BuildSpinboxState();
}

class _BuildSpinboxState extends State<BuildSpinbox> {
  int currentQuantity = 0;

  final TextEditingController quantityController = TextEditingController();

  final FocusNode focusNode = FocusNode();

  StreamController<int> streamController = StreamController();

  bool get canDecrement => currentQuantity > 1;

  bool get canIncrement =>
      widget.maxQuantityOfProductItem == null ||
      currentQuantity < widget.maxQuantityOfProductItem!;

  @override
  void initState() {
    super.initState();
    currentQuantity = widget.quantityOfProductItem;
    _setController();
    _quantityListener();
    _debounceStream();
  }

  void _quantityListener() {
    quantityController.addListener(() {
      streamController.sink.add(currentQuantity);
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        quantityController.selection = TextSelection(
            baseOffset: 0, extentOffset: quantityController.text.length);
      }
    });
  }

  void _debounceStream() {
    streamController.stream.debounceTime(const Duration(seconds: 2)).listen(
          (event) => _updateProductQuantity(),
        );
  }

  void _updateProductQuantity() {
    // Get.find<CartController>().updateQuantityProduct(
    //   UpdateQuantityRequest(
    //     productItemId: widget.idOfProductItem,
    //     quantity: currentQuantity,
    //   ),
    // );
  }

  @override
  void dispose() {
    streamController.close();
    quantityController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BuildSpinbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.quantityOfProductItem != widget.quantityOfProductItem) {
      currentQuantity = widget.quantityOfProductItem;
      _setController();
    }
  }

  void _setController() {
    quantityController.text = currentQuantity.toString();
  }

  void _decrement() {
    setState(() {
      currentQuantity--;
      _setController();
    });
  }

  void _increment() {
    setState(() {
      currentQuantity++;
      _setController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (canDecrement) {
              _decrement();
            }
          },
          child: CardBuilder(
            radiusModel: const RadiusModel(radiusAll: 3),
            backgroundColor: canDecrement
                ? context.primaryColor
                : Colors.grey.withOpacity(0.1),
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ).paddingAll(AppDimens.paddingSmallest),
        UtilWidget.sizedBoxWidth5,
        Expanded(
            child: TextField(
          controller: quantityController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: Get.textTheme.bodySmall,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppDimens.paddingVerySmall,
                vertical: 0,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none)),
          focusNode: focusNode,
          onChanged: (value) {
            currentQuantity = int.tryParse(value) ?? 0;
          },
        )),
        UtilWidget.sizedBoxWidth5,
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (canIncrement) {
              _increment();
            }
          },
          child: CardBuilder(
            radiusModel: const RadiusModel(radiusAll: 3),
            backgroundColor: canIncrement
                ? context.primaryColor
                : Colors.black12.withOpacity(0.1),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ).paddingAll(AppDimens.paddingSmallest),
      ],
    );
  }
}
