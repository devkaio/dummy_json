import 'package:dummy_json/src/features/home/view/home_page.dart';
import 'package:flutter/material.dart';

import 'features/auth/features/register/view/register_page.dart';
import 'features/auth/features/start/view/start_page.dart';
import 'shared/constants/constants.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dummy JSON",
      color: Colors.teal,
      initialRoute: NamedRoute.start,
      routes: {
        NamedRoute.start: (context) => const StartPage(),
        //TODO: login
        NamedRoute.register: (context) => const RegisterPage(),
        NamedRoute.home: (context) => const HomePage(),
      },
    );
  }
}
