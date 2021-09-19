import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:give_me_home/app/constants/app_assets.dart';
import 'package:give_me_home/app/constants/app_text_styles.dart';

class MessageModal extends StatelessWidget {
  final String title;

  const MessageModal({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.checkSquare),
        const SizedBox(width: 10),
        Expanded(
          child: Text(title, style: AppTextStyles.titleHeadingRegular),
        ),
      ],
    );
  }
}
