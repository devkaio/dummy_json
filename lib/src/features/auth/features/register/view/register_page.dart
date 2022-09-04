import 'package:dummy_json/src/features/auth/features/register/state/register_state.dart';
import 'package:dummy_json/src/shared/validators/validators.dart';
import 'package:dummy_json/src/shared/widgets/primary_button.dart';
import 'package:dummy_json/src/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../../di/di.dart';
import '../../../../../shared/constants/constants.dart';
import '../viewmodel/register_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final registerViewModel = DI.getIt<RegisterViewModel>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: Validators.validateEmail,
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: Validators.validatePassword,
                  ),
                  const SizedBox(height: 16.0),
                  AnimatedBuilder(
                    animation: registerViewModel,
                    builder: (context, child) {
                      if (registerViewModel.state is RegisterStateEmpty) {
                        return PrimaryButton(
                          buttonText: "Register",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              registerViewModel.register(
                                emailController.text,
                                passwordController.text,
                              );
                            }
                          },
                        );
                      } else if (registerViewModel.state
                          is RegisterStateLoading) {
                        return const CircularProgressIndicator();
                      } else if (registerViewModel.state
                          is RegisterStateSuccess) {
                        WidgetsBinding.instance.addPostFrameCallback(
                          (timeStamp) {
                            Navigator.pushReplacementNamed(
                                context, NamedRoute.home);
                          },
                        );
                        return Container();
                      } else {
                        return BaseDialog(
                            title:
                                registerViewModel.errorMessage?.type ?? "Error",
                            subtitle: registerViewModel.errorMessage?.message ??
                                "Error",
                            leftButtonText: "Cancel",
                            leftButtonPressed: () {
                              registerViewModel.reset();
                              Navigator.pop(context);
                            },
                            rightButtonText: "Return to Start",
                            rightButtonPressed: () {
                              registerViewModel.reset();
                              Navigator.popUntil(context,
                                  ModalRoute.withName(NamedRoute.start));
                            });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
