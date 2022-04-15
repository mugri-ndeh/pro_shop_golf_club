import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/forgot_password/reset_pin.dart';
import 'package:pro_shop_golf_club/auth/login/login.dart';
import 'package:pro_shop_golf_club/auth/widgets/custom_auth_button.dart';
import 'package:pro_shop_golf_club/auth/widgets/input_fields.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

import '../../util/constants/palette.dart';

class Forgotindex extends StatefulWidget {
  Forgotindex({Key? key}) : super(key: key);

  @override
  State<Forgotindex> createState() => _ForgotindexState();
}

class _ForgotindexState extends State<Forgotindex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Forgot your password? ',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Enter your registered email below to receive password reset instruction',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Center(child: Image.asset('assets/images/forgot1.png')),
                InputField(
                  hint: 'email',
                  icon: const Icon(Icons.mail),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    pushReplacement(context, LoginScreen());
                  },
                  child: SizedBox(
                    height: 50,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Remeber password?'),
                          Text(
                            ' Login',
                            style: TextStyle(color: Palette.primaryGreen),
                          ),
                        ]),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                    child: AuthButton(
                  onTap: () {
                    push(context, VeerifyPin());
                  },
                  text: 'Send',
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
