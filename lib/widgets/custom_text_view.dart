import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextView extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color? textColor;
  final double? paddingBottom;
  final double? paddingTop;
  final double? paddingRight;
  final double? paddingLeft;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? height;
  final double? containerWidth;
  final bool? isCenterAlign;
  final bool? isUnderline;
  final bool? isBorder;

  const CustomTextView({
    Key? key,
    required this.text,
    this.textSize,
    this.textColor,
    this.paddingBottom = 0,
    this.paddingTop = 0,
    this.paddingRight = 0,
    this.paddingLeft = 0,
    this.fontWeight,
    this.maxLines,
    this.height,
    this.letterSpacing,
    this.containerWidth,
    this.isCenterAlign = false,
    this.isUnderline = false,
    this.isBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          paddingLeft!, paddingTop!, paddingRight!, paddingBottom!),
      child: Text(
        text,
        maxLines: maxLines!,
        overflow: TextOverflow.ellipsis,
        textAlign: isCenterAlign == true ? TextAlign.center : TextAlign.left,
        style: GoogleFonts.lato(
            fontWeight: fontWeight,
            fontSize: textSize,
            color: textColor,
            letterSpacing: letterSpacing,
            height: height,
            decoration: isUnderline == true
                ? TextDecoration.underline
                : TextDecoration.none),
      ),
    );
  }
}
