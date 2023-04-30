import 'package:elera/extensions/extensions.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.textFieldType = TextInputType.text,
    this.focus,
    this.validator,
    this.isPassword = false,
    this.textCapitalization,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onChanged,
    this.nextFocus,
    this.textStyle,
    this.textAlign,
    this.maxLines,
    this.minLines,
    this.enabled,
    this.autoFocus,
    this.readOnly,
    this.enableSuggestions,
    this.maxLength,
    this.cursorColor,
    this.prefix,
    this.keyboardType,
    this.autoFillHints,
    this.scrollPadding,
    this.cursorWidth,
    this.cursorHeight,
    this.onTap,
    this.buildCounter,
    this.inputFormatters,
    this.textAlignVertical,
    this.expands,
    this.showCursor,
    this.selectionControls,
    this.strutStyle,
    this.obscuringCharacter,
    this.keyboardAppearance,
    this.hintText,
  });

  final TextEditingController? controller;
  final TextInputType textFieldType;
  final FocusNode? focus;
  final String? Function(String?)? validator;
  final bool isPassword;
  final String? hintText;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final FocusNode? nextFocus;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final bool? autoFocus;
  final bool? readOnly;
  final bool? enableSuggestions;
  final int? maxLength;
  final Color? cursorColor;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final Iterable<String>? autoFillHints;
  final EdgeInsets? scrollPadding;
  final double? cursorWidth;
  final double? cursorHeight;
  final Function()? onTap;
  final InputCounterWidgetBuilder? buildCounter;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlignVertical? textAlignVertical;
  final bool? expands;
  final bool? showCursor;
  final TextSelectionControls? selectionControls;
  final StrutStyle? strutStyle;
  final String? obscuringCharacter;
  final Brightness? keyboardAppearance;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && !isPasswordVisible,
      validator: widget.validator,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: (s) {
        if (widget.nextFocus != null)
          FocusScope.of(context).requestFocus(widget.nextFocus);

        if (widget.onFieldSubmitted != null) widget.onFieldSubmitted!.call(s);
      },
      keyboardType: widget.textFieldType,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        hintStyle: AppTextStyle.bodyMedium(null, AppColors.greyScaleColor[500]),
        fillColor: widget.focus?.hasFocus != null
            ? AppColors.primaryColor
            : widget.controller != null && widget.controller!.text.isNotEmpty
                ? AppColors.lightColor
                : AppColors.greyScaleColor[50]!,
        suffixIcon: widget.isPassword
            ? GestureDetector(
                child: Icon(
                  isPasswordVisible ? MyIcons.solidEye : MyIcons.solidEyeSlash,
                ),
                onTap: () {
                  isPasswordVisible = !isPasswordVisible;

                  setState(() {});
                },
              )
            : null,
        prefixIcon: widget.prefix,
      ),
      focusNode: widget.focus,
      style: widget.textStyle ?? AppTextStyle.bodyMedium(FontWeight.w600),
      textAlign: widget.textAlign ?? TextAlign.start,
      maxLines: widget.textFieldType == TextInputType.streetAddress
          ? null
          : widget.maxLines ?? 1,
      minLines: widget.minLines ?? 1,
      autofocus: widget.autoFocus ?? false,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      cursorColor: widget.cursorColor ?? AppColors.primaryColor,
      readOnly: widget.readOnly ?? false,
      maxLength: widget.maxLength,
      enableSuggestions: widget.enableSuggestions ?? true,
      autofillHints: widget.autoFillHints,
      scrollPadding: widget.scrollPadding ?? EdgeInsets.all(20),
      cursorWidth: widget.cursorWidth ?? 2.0,
      cursorHeight: widget.cursorHeight,
      cursorRadius: Radius.circular(4),
      onTap: widget.onTap,
      buildCounter: widget.buildCounter,
      scrollPhysics: BouncingScrollPhysics(),
      enableInteractiveSelection: true,
      inputFormatters: widget.inputFormatters,
      textAlignVertical: widget.textAlignVertical,
      expands: widget.expands ?? false,
      showCursor: widget.showCursor,
      selectionControls: widget.selectionControls,
      strutStyle: widget.strutStyle,
      obscuringCharacter: widget.obscuringCharacter ?? '•',
      keyboardAppearance: widget.keyboardAppearance,
    );
  }
}

// extension AppTextField on TextFormField {
//   static TextFormField primary({
//     VoidCallback? onTap,
//     required TextInputType textFieldType,
//     TextEditingController? controller,
//     FocusNode? focus,
//     bool? isPassword,
//     String? Function(String?)? validator,
//     TextInputAction? textInputAction,
//     Widget? prefixIcon,
//     bool? readOnly,
//     bool? enabled,
//     List<TextInputFormatter>? inputFormatters,
//     String? hintText,
//   }) {
//     return TextFormField(
//       focusNode: focus,
//       keyboardType: textFieldType,
//       onTap: onTap,
//       controller: controller,
//       validator: validator,
//       readOnly: readOnly ?? false,
//       inputFormatters: inputFormatters,
//       enabled: enabled,
//       textInputAction: textInputAction,
//       obscureText: ,
//       decoration: InputDecoration(
//         prefixIcon: prefixIcon,
//         filled: true,
//         fillColor: focus?.hasFocus != null
//             ? AppColors.primaryColor
//             : controller != null && controller.text.isNotEmpty
//                 ? AppColors.lightColor
//                 : AppColors.greyScaleColor[50]!,
//         hintText: hintText,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: radiusCircular(12),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: radiusCircular(12),
//           borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: radiusCircular(12),
//         ),
//       ),
//     );
//   }
// }
