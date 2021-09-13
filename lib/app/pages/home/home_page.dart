import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:give_me_home/app/constants/app_assets.dart';
import 'package:give_me_home/app/constants/app_colors.dart';
import 'package:give_me_home/app/constants/app_text_styles.dart';
import 'package:give_me_home/app/models/user_model.dart';
import 'package:give_me_home/app/widgets/pet_list_item/pet_list_item.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final user = Provider.of<UserModel?>(context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            child: SizedBox(
              height: (size.height * 0.20) + padding.top,
              child: Stack(
                children: [
                  Container(
                    height: (size.height * 0.16) + padding.top,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment(0.0, 1.0),
                        colors: AppColors.primaryGradient,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AppAssets.footprintSvg),
                        Row(
                          children: [
                            Text(
                              "Hello, ${user!.name}",
                              style: AppTextStyles.titleHeadingGreatingsBold,
                            ),
                            const SizedBox(width: 20),
                            CircleAvatar(
                              maxRadius: 24,
                              minRadius: 24,
                              backgroundImage: NetworkImage(
                                user.photoURL ?? AppAssets.defaultPhotoJpg,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      height: 80,
                      decoration: const BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: TextField(
                        maxLength: 30,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(AppAssets.searchSvg),
                          ),
                          labelText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width - 40,
            height: size.height * 0.65,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.72,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 2,
                itemBuilder: (context, index) => const PetListItem()),
          )
        ],
      ),
    );
  }
}
