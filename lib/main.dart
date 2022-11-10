import 'package:flutter/material.dart';

import 'modules/search_cep/models/cep_model.dart';
import 'modules/search_cep/pages/home_page.dart';
import 'modules/search_cep/pages/result_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: primaryColor,
        ),
        initialRoute: SplashScreen.splash,
        routes: {
          SplashScreen.splash: (context) => const SplashScreen(),
          HomePage.home: (context) => const HomePage(),
          ResultPage.result: (context) => ResultPage(
              data: ModalRoute.of(context)?.settings.arguments as CepModel),
        });
  }
}
