import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 36),
          SafeArea(
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/logo.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          CustomTextField(
            //controller: emailController,
            labelText: 'Email',
            isObscure: false,
            errorText: '',
            textFontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
