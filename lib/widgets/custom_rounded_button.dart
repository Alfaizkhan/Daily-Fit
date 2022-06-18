import 'package:flutter/material.dart';

import '../const/app_colors.dart';
import 'custom_text_view.dart';

class CustomRoundedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final double? radius;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? buttonColor;
  final Color? textColor;
  final bool? isBorder;
  final Color? borderColor;
  final VoidCallback? onButtonClick;
  final EdgeInsetsGeometry? margin;

  const CustomRoundedButton({
    Key? key,
    this.height,
    this.width,
    required this.text,
    this.radius,
    this.textSize,
    this.fontWeight,
    this.buttonColor,
    this.onButtonClick,
    this.margin,
    this.textColor,
    this.isBorder = false,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onButtonClick,
        child: Container(
          height: height,
          width: width,
          margin: margin,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: buttonColor ?? AppColors.kPrimaryColor,
              border: isBorder == true ? Border.all(
                width: 1,
                color: borderColor ?? AppColors.kPrimaryColor,//                   <--- border width here
              ) : Border.all(
                width: 0,
                color: Colors.transparent,//                   <--- border width here
              ),
              borderRadius: BorderRadius.circular(radius!),
          ),
          child: Center(
            child: CustomTextView(
              text: text,
              textSize: textSize,
              textColor: textColor ?? Colors.white,
              fontWeight: fontWeight,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
