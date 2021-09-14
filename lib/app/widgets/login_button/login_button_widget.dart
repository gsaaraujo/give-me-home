import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:give_me_home/app/constants/app_colors.dart';
import 'package:give_me_home/app/constants/app_assets.dart';
import 'package:give_me_home/app/constants/app_text_styles.dart';

class LoginButtonWidget extends StatelessWidget {
  final VoidCallback handleOnTap;

  const LoginButtonWidget({Key? key, required this.handleOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.8,
      height: 56,
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: InkWell(
          onTap: handleOnTap,
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: AppColors.primaryNormal),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
                child: SvgPicture.asset(AppAssets.googleSvg),
              ),
              Expanded(
                  child: Text(
                'Connect with Google',
                textAlign: TextAlign.center,
                style: AppTextStyles.titleHeadingBold,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
