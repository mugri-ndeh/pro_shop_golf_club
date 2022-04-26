import 'package:flutter/material.dart';
import 'package:pro_shop_golf_club/auth/complete_profile/complete_profile.dart';
import 'package:pro_shop_golf_club/auth/login/login.dart';
import 'package:pro_shop_golf_club/auth/sign_up/signup.dart';
import 'package:pro_shop_golf_club/home/ui/base.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class AuthRoot extends StatelessWidget {
  const AuthRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Authentication>(builder: (_, auth, __) {
      // ignore: avoid_print
      print('Auth state is');
      // ignore: avoid_print
      print(auth.loginState);
      switch (auth.loginState) {
        case AuthState.loggedIn:
          return BaseScreen();
        case AuthState.loggedOut:
          return const LoginScreen();
        case AuthState.incomplete:
          return Completeprofile();
        case AuthState.signup:
          return SignUp();
        case AuthState.login:
          return const LoginScreen();
        case AuthState.loading:
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        default:
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
      }
      //return user != null ? HomeScreen() : Register();
    });
  }
}
