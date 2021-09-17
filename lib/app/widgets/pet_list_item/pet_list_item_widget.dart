import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:give_me_home/app/constants/app_assets.dart';
import 'package:give_me_home/app/constants/app_colors.dart';
import 'package:give_me_home/app/constants/app_text_styles.dart';
import 'package:give_me_home/app/models/pet_model.dart';

class PetListItem extends StatelessWidget {
  final PetModel? petModel;

  const PetListItem({Key? key, @required this.petModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Hero(
      tag: petModel!.name,
      child: Container(
        height: 247,
        width: size.width * 0.4,
        decoration: const BoxDecoration(
          color: AppColors.background,
        ),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/petDetails', arguments: petModel);
            },
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.network(
                      petModel!.photos[0],
                      height: 180,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border,
                          color: AppColors.primaryNormal),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 12,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              petModel!.name[0].toUpperCase() +
                                  petModel!.name.substring(1),
                              style: AppTextStyles.titleHeadingBold,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              petModel!.size[0].toUpperCase() +
                                  petModel!.size.substring(1),
                              style: AppTextStyles.titleHeadingRegular,
                            ),
                          ],
                        ),
                        petModel!.gender == 'male'
                            ? SvgPicture.asset(AppAssets.maleSquareSvg)
                            : SvgPicture.asset(AppAssets.femaleSquareSvg),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
