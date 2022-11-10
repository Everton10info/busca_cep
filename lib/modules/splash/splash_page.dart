import 'package:flutter/material.dart';

import '../search_cep/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String splash = '/';

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Navigator.of(context).pushReplacementNamed(HomePage.home),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Image.asset('assets/images/logo_cep.png'),
    );
  }
}
