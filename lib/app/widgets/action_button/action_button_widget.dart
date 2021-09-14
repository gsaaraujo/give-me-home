import 'package:flutter/material.dart';
import 'package:give_me_home/app/constants/app_colors.dart';
import 'package:give_me_home/app/constants/app_text_styles.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback handleOnTap;

  const ActionButton({Key? key, required this.title, required this.handleOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => handleOnTap(),
        child: Container(
          width: 100,
          height: 48,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.0, 1.0),
              colors: AppColors.primaryGradient,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.titleButton,
            ),
          ),
        ),
      ),
    );
  }
}
