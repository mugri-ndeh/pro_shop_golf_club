import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/auth_provider.dart';
import 'package:pro_shop_golf_club/auth/complete_profile/complete_profile.dart';
import 'package:pro_shop_golf_club/auth/login/login.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';
import 'package:provider/provider.dart';

import '../../util/constants/palette.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/input_fields.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  late Authentication auth;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = Provider.of<Authentication>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  const Text(
                    'Create account',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Image.asset('assets/images/golf3.png'),
                  InputField(
                    controller: _userNameController,
                    hint: 'username',
                    icon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 8),

                  InputField(
                    controller: _emailController,
                    hint: 'email',
                    icon: const Icon(Icons.mail),
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    controller: _passwordController,
                    hint: 'password',
                    password: true,
                    validator: validatePassword,
                    icon: const Icon(Icons.lock),
                    prefixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    controller: _confirmPasswordController,
                    hint: 'confirm password',
                    password: true,
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
                      // push(context, Completeprofile());

                      if (validateName(_userNameController.text) != null) {
                        showSnackBar(
                            context, validateName(_userNameController.text)!);
                        print('uname');
                      }
                      //
                      else if (validateEmail(_emailController.text) != null) {
                        showSnackBar(
                            context, validateEmail(_emailController.text)!);
                        print('email');
                      }

                      //
                      else if (validatePassword(_passwordController.text) !=
                          null) {
                        showSnackBar(context,
                            validatePassword(_passwordController.text)!);
                        print('pword');
                      }

                      //
                      else if (validateConfirmPassword(_passwordController.text,
                              _confirmPasswordController.text) !=
                          null) {
                        showSnackBar(
                            context,
                            validateConfirmPassword(_passwordController.text,
                                _confirmPasswordController.text)!);
                        print('confirmpword');
                      } else {
                        showProgress(context, 'Creating account', true);
                        auth
                            .register(
                                _emailController.text,
                                _userNameController.text,
                                _passwordController.text)
                            .then((value) => hideProgress());
                      }
                      // if (_formKey.currentState!.validate()) {

                      // }
                    },
                    text: 'Sign Up',
                  )),
                  // const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      auth.setAuthState(AuthState.login);
                    },
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account? '),
                              Text(
                                'Login',
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
      ),
    );
  }
}
