import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/controller/banner_controller.dart';
import 'package:chahele_project/controller/course_provider.dart';
import 'package:chahele_project/controller/image_provider.dart';
import 'package:chahele_project/controller/user_provider.dart';
import 'package:chahele_project/firebase_options.dart';
import 'package:chahele_project/view/splash_screen/spalsh_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ImagePickProvider()),
        ChangeNotifierProvider(create: (context) => BannerController()),
      ],
      child: MaterialApp(
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        localizationsDelegates: const [
          CountryLocalizations.delegate,
        ],
        // ignore: deprecated_member_use
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
