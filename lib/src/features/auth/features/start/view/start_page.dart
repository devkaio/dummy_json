import 'package:flutter/material.dart';

import '../../../../../shared/constants/constants.dart';
import '../../../../../shared/widgets/primary_button.dart';
import '../../../../../shared/widgets/secondary_button.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TODO: navigate
              PrimaryButton(
                onPressed: () {},
                buttonText: "Login",
              ),
              PrimaryButton(
                onPressed: () {
                  Navigator.pushNamed(context, NamedRoute.register);
                },
                buttonText: "Create Account",
              ),
              //TODO: navigate
              SecondaryButton(
                onPressed: () {},
                buttonText: "Forgot password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
