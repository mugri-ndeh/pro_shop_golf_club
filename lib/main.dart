import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_shop_golf_club/auth/auth_provider.dart';
import 'package:pro_shop_golf_club/auth/onboarding/splash.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'util/constants/palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Provider.debugCheckInvalidValueType = null;
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Palette.scaffoldBg,
      statusBarIconBrightness: Brightness.dark));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authentication())
      ],
      child: MaterialApp(
        title: 'GolfHub',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: Palette.scaffoldBg,
            textTheme: GoogleFonts.montserratTextTheme()),
        home: Splash(),
      ),
    ),
  );
}
