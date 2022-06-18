import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/auth_provider.dart';
import 'package:pro_shop_golf_club/auth/forgot_password/index.dart';
import 'package:pro_shop_golf_club/auth/sign_up/signup.dart';
import 'package:pro_shop_golf_club/auth/widgets/custom_auth_button.dart';
import 'package:pro_shop_golf_club/auth/widgets/input_fields.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';
import 'package:pro_shop_golf_club/util/helper/helper.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Authentication auth;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                    'Login',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Image.asset('assets/images/golf1.png'),
                  InputField(
                    controller: _emailController,
                    validator: (val) {
                      var err = validateEmail(val);
                      if (err != null) {
                        showSnackBar(context, 'Enter valid email');
                      }
                    },
                    hint: 'email',
                    icon: const Icon(Icons.mail),
                  ),
                  const SizedBox(height: 8),
                  InputField(
                    controller: _passwordController,
                    hint: 'password',
                    password: true,
                    validator: (val) {
                      if (val!.length < 6) {
                        showSnackBar(context, 'Password must be 6 characters');
                      }
                    },
                    icon: const Icon(Icons.lock),
                    prefixIcon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      push(context, Forgotindex());
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                  ),
                  const SizedBox(height: 30),
                  Center(
                      child: AuthButton(
                    onTap: () {
                      // push(context, SignUp());
                      if (_formKey.currentState!.validate()) {
                        print(_emailController.text);
                        print(_passwordController.text);
                        showProgress(context, 'Logging in wait', true);
                        auth
                            .login(_emailController.text.trim(),
                                _passwordController.text.trim())
                            .then((value) {
                          hideProgress();
                          setState(() {});
                        });
                      }
                    },
                    text: 'Login',
                  )),
                  // const SizedBox(height: 50),
                  GestureDetector(
                    onTap: (() {
                      print(auth.loginState);

                      setState(() {
                        auth.setAuthState(AuthState.signup);
                      });

                      print(auth.loginState);
                    }),
                    child: Center(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account? '),
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
      ),
    );
  }
}
