import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:give_me_home/app/constants/app_colors.dart';
import 'package:give_me_home/app/constants/app_assets.dart';
import 'package:give_me_home/app/constants/app_text_styles.dart';
import 'package:give_me_home/app/widgets/login_button/login_button_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void handleOnTap() => {};

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                AssetsPath.footprintSvg,
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
                title: 'Connect with Google',
                handleOnTap: handleOnTap,
              )
            ],
          ),
        ),
      ),
    );
  }
}
