import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:give_me_home/app/constants/app_colors.dart';
import 'package:give_me_home/app/constants/app_assets.dart';
import 'package:give_me_home/app/constants/app_text_styles.dart';
import 'package:give_me_home/app/controllers/login_controller.dart';
import 'package:give_me_home/app/widgets/login_button/login_button_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();

    final controller = context.read<LoginController>();

    controller.addListener(() {
      if (controller.isAuthFailed) {
        const snackBar = SnackBar(content: Text('Authentication has failed.'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = context.watch<LoginController>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.0, 1.0),
            colors: AppColors.primaryGradient,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              SvgPicture.asset(
                AppAssets.footprintSvg,
                color: Colors.white,
                height: 150,
                width: 140,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 57),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyles.titleLoginHeading,
                    text: 'Connect to ',
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'meet',
                          style: TextStyle(color: AppColors.heading0)),
                      TextSpan(text: ' your '),
                      TextSpan(
                          text: 'best friends',
                          style: TextStyle(color: AppColors.heading0)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.23),
              LoginButtonWidget(
                handleOnTap: () {
                  controller.isLoading ? null : controller.signInWithGoogle();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
