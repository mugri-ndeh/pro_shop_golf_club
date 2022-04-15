import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:pro_shop_golf_club/auth/forgot_password/change_password.dart';
import 'package:pro_shop_golf_club/auth/widgets/custom_auth_button.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';

class VeerifyPin extends StatefulWidget {
  VeerifyPin({Key? key}) : super(key: key);

  @override
  State<VeerifyPin> createState() => _VeerifyPinState();
}

class _VeerifyPinState extends State<VeerifyPin> {
  final _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? verificationCode;
  final pinDecoration = BoxDecoration(
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: GoogleFonts.poppins(fontSize: 22, color: Palette.primaryGreen),
      decoration: BoxDecoration(),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Palette.primaryGreen,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: Palette.borderGreen,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
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
                      'Please Enter your code sent to your email ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(child: Image.asset('assets/images/forgot2.png')),
                const SizedBox(height: 24),
                Pinput(
                  validator: ((value) {
                    if (value!.length != 6) {
                      return 'Please input all digits';
                    } else if (value.isEmpty) {
                      return 'Fill the code';
                    }
                  }),
                  length: 6,
                  pinAnimationType: PinAnimationType.slide,
                  defaultPinTheme: defaultPinTheme,
                  showCursor: true,
                  cursor: cursor,
                  preFilledWidget: preFilledWidget,
                  focusNode: _focusNode,
                  controller: _pinController,
                  keyboardAppearance: Brightness.light,
                  onChanged: (pin) {
                    verificationCode = pin;
                  },
                  onSubmitted: (pin) async {
                    // print(pin);
                    // authProvider
                    //     .loginWithCred(widget.vID, pin)
                    //     .then((value) {});
                  },
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Didn\'t get code?'),
                        Text(
                          ' Resend',
                          style: TextStyle(color: Palette.primaryGreen),
                        ),
                      ]),
                ),
                const SizedBox(height: 30),
                Center(
                    child: AuthButton(
                  onTap: () {
                    push(context, ChangePassWord());
                  },
                  text: 'Verify',
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
