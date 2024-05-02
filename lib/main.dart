import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nakama_laundry/firebase_options.dart';
import 'package:nakama_laundry/utils/color_pallete.dart';
import 'package:nakama_laundry/view/pages/home.dart';
import 'package:nakama_laundry/view/pages/login.dart';
import 'package:nakama_laundry/view/widget/main_navigator.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          appBarTheme: AppBarTheme(backgroundColor: ColorPallete.colorprimary)),
      home: Login(),
    );
  }
}
