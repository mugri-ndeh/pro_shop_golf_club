import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/widgets/input_fields.dart';

import '../../util/constants/palette.dart';
import '../widgets/custom_auth_button.dart';

class ChangePassWord extends StatefulWidget {
  ChangePassWord({Key? key}) : super(key: key);

  @override
  State<ChangePassWord> createState() => _ChangePassWordState();
}

class _ChangePassWordState extends State<ChangePassWord> {
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
                  'Verify',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Enter your registered email below to receive password reset instruction ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(child: Image.asset('assets/images/forgot3.png')),
                const SizedBox(height: 24),
                InputField(
                  password: true,
                  hint: 'new password',
                  icon: const Icon(Icons.lock),
                  prefixIcon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                    child: AuthButton(
                  onTap: () {
                    // push(context, SignUp());
                  },
                  text: 'Change',
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
