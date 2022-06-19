import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../const/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLines;
  final String? errorText;
  final String? labelText;
  final TextEditingController? controller;
  final bool? isObscure;
  final TextInputType? keyboardType;
  final FontWeight? textFontWeight;
  final bool? enable;
  final ValueChanged<String>? onChanged;
  final int? charLength;
  final double? textSize;
  final GestureTapCallback? onTap;

  const CustomTextField({
    Key? key,
    this.errorText,
    this.labelText,
    this.controller,
    this.isObscure,
    this.keyboardType,
    this.textFontWeight,
    this.enable,
    this.onChanged,
    this.charLength,
    this.onTap,
    this.textSize,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                constraints: const BoxConstraints.expand(height: 52),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.kGreyColor,
                      offset: Offset(0, 12),
                      blurRadius: 20,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            SizedBox(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                child: TextField(
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(charLength),
                  ],
                  autocorrect: false,
                  enableSuggestions: false,
                  autofocus: false,
                  onChanged: onChanged,
                  minLines: 1,
                  maxLines: maxLines ?? 1,
                  enabled: enable ?? true,
                  style: TextStyle(
                      fontFamily: 'Gibson',
                      fontSize: textSize ?? 18.0,
                      color: AppColors.kFontColor,
                      fontWeight: textFontWeight),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(
                        fontFamily: 'Gibson',
                        fontSize: 17.0,
                        color: AppColors.kGreyColor,
                        fontWeight: textFontWeight,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          16.0,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      hintText: labelText),
                  controller: controller,
                  obscureText: isObscure!,
                  obscuringCharacter: "*",
                  keyboardType: keyboardType,
                  onTap: onTap,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
