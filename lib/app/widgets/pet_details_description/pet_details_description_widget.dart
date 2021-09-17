import 'package:flutter/material.dart';
import 'package:give_me_home/app/constants/app_text_styles.dart';

class PetDetailsDescription extends StatelessWidget {
  final String title;
  final String subtitle;

  const PetDetailsDescription(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: AppTextStyles.titleHeadingBold,
        children: [
          TextSpan(
            text: subtitle[0].toUpperCase() + subtitle.substring(1),
            style: AppTextStyles.titleHeadingRegular.merge(
              const TextStyle(height: 1.8),
            ),
          ),
        ],
      ),
    );
  }
}
