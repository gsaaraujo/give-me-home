import 'package:flutter/material.dart';
import 'package:give_me_home/app/constants/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.primaryNormal,
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0.0, 1.0),
            colors: AppColors.primaryGradient,
          ),
        ),
        child: SpinKitChasingDots(
          itemBuilder: (BuildContext context, int index) {
            return const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            );
          },
        ),
      ),
    );
  }
}
