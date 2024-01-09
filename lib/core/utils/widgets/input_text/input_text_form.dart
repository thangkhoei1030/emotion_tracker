import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class BuildInputText extends StatefulWidget {
  final InputTextModel inputTextFormModel;

  const BuildInputText(this.inputTextFormModel, {Key? key}) : super(key: key);

  @override
  BuildInputTextState createState() => BuildInputTextState();
}

class BuildInputTextState extends State<BuildInputText> {
  final RxBool _isShowButtonClear = false.obs;
  final RxBool _showPassword = false.obs;

  @override
  void initState() {
    widget.inputTextFormModel.controller.addListener(() {
      if (widget.inputTextFormModel.controller.text.isNotEmpty) {
        _isShowButtonClear.value = true;
      }
    });
    _showPassword.value = widget.inputTextFormModel.obscureText;
    super.initState();
  }

  // List<TextInputFormatter> getFormatters() {
  //   switch (widget.inputTextFormModel.inputFormatters) {
  //     case InputFormatterEnum.digitsOnly:
  //       return [
  //         FilteringTextInputFormatter.digitsOnly,
  //         LengthLimitingTextInputFormatter(
  //             widget.inputTextFormModel.maxLengthInputForm),
  //       ];
  //     case InputFormatterEnum.taxCode:
  //       return [
  //         FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
  //         MaskedInputFormatter('##########-###')
  //       ];
  //     case InputFormatterEnum.textOnly:
  //       return [
  //         FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-_\.]')),
  //       ];
  //     case InputFormatterEnum.currency:
  //       return [
  //         NumericTextFormatter(),
  //       ];

  //     case InputFormatterEnum.negativeNumber:
  //       return [
  //         FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
  //       ];

  //     case InputFormatterEnum.decimalNumber:
  //       return [
  //         FilteringTextInputFormatter.allow(RegExp(
  //             '[0-9${getDefaultFormatCurrency(isDot: !AppConst.isDot)}]')),
  //       ];

  //     case InputFormatterEnum.identity:
  //       return [
  //         FilteringTextInputFormatter.allow(RegExp(r'[0-9-]')),
  //         MaskedInputFormatter('############')
  //       ];
  //     case InputFormatterEnum.phoneNumber:
  //       return [
  //         FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
  //         MaskedInputFormatter('##############')
  //       ];
  //     case InputFormatterEnum.password:
  //       return [PasswordFormatter()];
  //     default:
  //       return [
  //         LengthLimitingTextFieldFormatterFixed(
  //             widget.inputTextFormModel.maxLengthInputForm)
  //       ];
  //   }
  // }

  Widget? _suffixIcon() {
    if (widget.inputTextFormModel.suffixIcon != null) {
      return widget.inputTextFormModel.suffixIcon;
    }
    if (!_isShowButtonClear.value || widget.inputTextFormModel.isReadOnly) {
      return null;
    }
    return widget.inputTextFormModel.obscureText
        ? GestureDetector(
            onTap: () {
              _showPassword.toggle();
            },
            child: Icon(
                _showPassword.value
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye_outlined,
                color: widget.inputTextFormModel.suffixColor
                // ??
                // AppColors.iconColorInput,
                ),
          )
        : Visibility(
            visible: _isShowButtonClear.value &&
                !widget.inputTextFormModel.isReadOnly,
            child: GestureDetector(
              onTap: () {
                widget.inputTextFormModel.controller.clear();
                widget.inputTextFormModel.onChanged?.call('');
                _isShowButtonClear.value = false;
              },
              child:
                  Icon(Icons.clear, color: widget.inputTextFormModel.suffixColor
                      //  ??
                      //     AppColors.iconColorInput,
                      ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        maxLines: widget.inputTextFormModel.maxLines,
        // inputFormatters: getFormatters(),
        validator: widget.inputTextFormModel.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (v) {
          if (!_isShowButtonClear.value || v.isEmpty) {
            _isShowButtonClear.value = v.isNotEmpty;
          }
          widget.inputTextFormModel.onChanged?.call(v);
        },
        // cursorColor: AppColors.cursorColorInput,
        textInputAction: widget.inputTextFormModel.iconNextTextInputAction,
        style: widget.inputTextFormModel.style ??
            Get.textTheme.bodyText1?.copyWith(
                fontSize:
                    widget.inputTextFormModel.textSize ?? AppDimens.fontSmall(),
                color: widget.inputTextFormModel.textColor
                // ??
                //     AppColors.textColorInput,
                ),
        controller: widget.inputTextFormModel.controller,
        obscureText: _showPassword.value,
        onTap: widget.inputTextFormModel.onTap,
        enabled: widget.inputTextFormModel.enable,
        autofocus: widget.inputTextFormModel.autoFocus,
        focusNode: widget.inputTextFormModel.currentNode,
        scrollPadding: const EdgeInsets.only(
          bottom: AppDimens.sizeAppBarBig + AppDimens.sizeAppBarSmall,
        ),

        keyboardType: widget.inputTextFormModel.textInputType,
        readOnly: widget.inputTextFormModel.isReadOnly,
        maxLength: widget.inputTextFormModel.maxLengthInputForm,
        textAlign: widget.inputTextFormModel.textAlign ?? TextAlign.start,
        onFieldSubmitted: (v) {
          if (widget.inputTextFormModel.iconNextTextInputAction.toString() ==
              TextInputAction.next.toString()) {
            FocusScope.of(context)
                .requestFocus(widget.inputTextFormModel.nextNode);

            widget.inputTextFormModel.onNext?.call(v);
          } else {
            widget.inputTextFormModel.submitFunc?.call(v);
          }
        },
        showCursor: widget.inputTextFormModel.showCursor,
        decoration: InputDecoration(
          counterText: widget.inputTextFormModel.isShowCounterText ? null : '',
          filled: widget.inputTextFormModel.filled,
          fillColor: widget.inputTextFormModel.fillColor,
          // ??AppColors.colorBackGroundInput,
          hintStyle: TextStyle(
            fontSize: widget.inputTextFormModel.hintTextSize ??
                AppDimens.fontMedium(),
            color:
                widget.inputTextFormModel.hintTextColor ?? context.primaryColor,
          ),
          hintText: widget.inputTextFormModel.hintText,
          // labelText: widget.inputTextFormModel.labelText,
          // labelStyle: Get.textTheme.bodyMedium!.copyWith(
          //   color: AppColors.textLabelInput,
          // ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          errorStyle: const TextStyle(color: Colors.red),
          prefixIcon: widget.inputTextFormModel.prefixIcon ??
              (widget.inputTextFormModel.iconLeading != null
                  ? Icon(widget.inputTextFormModel.iconLeading,
                      color: widget.inputTextFormModel.prefixIconColor
                      // ??
                      // AppColors.iconColorInput,
                      // size: AppDimens.sizeIcon,
                      )
                  : null),
          prefixStyle: const TextStyle(
            color: Colors.red,
          ),
          border: widget.inputTextFormModel.border,
          // ?? OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(AppDimens.radius8),
          //         borderSide: BorderSide(color: AppColors.colorBorderInput)
          //         // borderSide: BorderSide(color: Colors.grey.shade400),
          //         ),
          // floatingLabelStyle: Get.textTheme.titleLarge,
          label: widget.inputTextFormModel.labelText.isStringEmpty ||
                  widget.inputTextFormModel.labelText == null
              ? null
              : Text(
                  widget.inputTextFormModel.labelText ?? "",
                  style: Get.textTheme.bodySmall!.copyWith(
                    fontSize: AppDimens.sizeTextLarge,
                    // color: AppColors.textLabelInput,
                  ),
                ),
          enabledBorder: widget.inputTextFormModel.border
          // ??
          //     OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(AppDimens.radius8),
          //       // borderSide: BorderSide(color: Colors.grey.shade400),
          //       borderSide: BorderSide(color: AppColors.colorBorderInput),
          //     ),
          ,
          focusedBorder: widget.inputTextFormModel.border
          // ??
          //     OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(AppDimens.radius8),
          //       // borderSide: BorderSide(color: AppColors.appColor),
          //       borderSide: BorderSide(color: AppColors.colorBorderInput),
          //     )
          ,
          contentPadding: widget.inputTextFormModel.contentPadding ??
              const EdgeInsets.all(AppDimens.defaultPadding),
          suffixIcon:
              widget.inputTextFormModel.showIconClear ? _suffixIcon() : null,
          helperText: widget.inputTextFormModel.helperText,
          helperStyle: widget.inputTextFormModel.helperStyle,
          helperMaxLines: widget.inputTextFormModel.helperMaxLines,
        ),
      ),
    );
  }
}
