import 'package:flutter/material.dart';

import '../../util/constants/palette.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/input_fields.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                const Text(
                  'Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/images/golf3.png'),
                InputField(
                  hint: 'username',
                  icon: const Icon(Icons.mail),
                ),
                InputField(
                  hint: 'email',
                  icon: const Icon(Icons.mail),
                ),
                const SizedBox(height: 8),
                InputField(
                  hint: 'password',
                  password: true,
                  icon: const Icon(Icons.lock),
                  prefixIcon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    const Text('Forgot password?'),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Palette.primaryGreen,
                        ))
                  ]),
                ),
                const SizedBox(height: 30),
                Center(
                    child: AuthButton(
                  text: 'Sign Up',
                )),
                // const SizedBox(height: 50),
                GestureDetector(
                  child: Center(
                    child: SizedBox(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account? '),
                            Text(
                              'Sign up',
                              style: TextStyle(color: Palette.primaryGreen),
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
