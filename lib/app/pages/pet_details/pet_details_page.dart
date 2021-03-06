import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:give_me_home/app/constants/app_assets.dart';
import 'package:give_me_home/app/constants/app_colors.dart';
import 'package:give_me_home/app/constants/app_text_styles.dart';
import 'package:give_me_home/app/widgets/action_button/action_button_widget.dart';
import 'package:give_me_home/app/widgets/message_modal/message_modal_widget.dart';
import 'package:provider/provider.dart';
import 'package:give_me_home/app/controllers/pet_details_controller.dart';
import 'package:give_me_home/app/models/pet_model.dart';
import 'package:give_me_home/app/widgets/pet_details_description/pet_details_description_widget.dart';
import 'package:give_me_home/app/widgets/pet_photo_selection/pet_photo_selection_widget.dart';

class PetDetailsPage extends StatelessWidget {
  const PetDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data = ModalRoute.of(context)!.settings.arguments as PetModel;

    final controller = context.watch<PetDetailsController>();
    var photoIndex = controller.petPhotoIndex;

    if (photoIndex > data.photos.length) {
      photoIndex = 0;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: data.name,
              child: SizedBox(
                width: size.width,
                height: size.height * 0.41,
                child: Stack(
                  children: [
                    Image.network(
                      data.photos[photoIndex],
                      height: size.height * 0.38,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: (size.width / 2) - 122.5,
                      bottom: 0,
                      child: Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        elevation: 5,
                        child: Container(
                          width: 245,
                          height: 61,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryNormal,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: data.photos
                                .map((photo) => PetPhotoSelection(
                                    petPhoto: photo,
                                    index: data.photos.indexOf(photo).toInt()))
                                .toList(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  PetDetailsDescription(title: 'Name', subtitle: data.name),
                  const SizedBox(height: 15),
                  PetDetailsDescription(title: 'Breed', subtitle: data.breed),
                  const SizedBox(height: 15),
                  PetDetailsDescription(title: 'Gender', subtitle: data.gender),
                  const SizedBox(height: 15),
                  PetDetailsDescription(title: 'Size', subtitle: data.size),
                  const SizedBox(height: 15),
                  PetDetailsDescription(title: 'About', subtitle: data.about),
                  const SizedBox(height: 40),
                ],
              ),
            ),
            ActionButton(
                title: 'Adopt',
                handleOnTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => const AdoptModal(),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class AdoptModal extends StatelessWidget {
  const AdoptModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = context.watch<HomeController>();
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * 0.82,
      decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 56),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                'SEND A MESSAGE TO THE OWNER',
                textAlign: TextAlign.center,
                style: AppTextStyles.titleHeadingBoldHigher
                    .merge(const TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 40),
            RichText(
              text: TextSpan(
                text: 'Please, before you do so ',
                style: AppTextStyles.titleHeadingBold,
                children: [
                  TextSpan(
                      text: 'REMEMBER:',
                      style: AppTextStyles.titleHeadingBold.merge(
                          const TextStyle(color: AppColors.primaryNormal)))
                ],
              ),
            ),
            const SizedBox(height: 40),
            const MessageModal(
                title:
                    'Animals have feelings. They need affection and love every day.'),
            const SizedBox(height: 15),
            const MessageModal(
                title:
                    'All residents of the house must agree to the adoption.'),
            const SizedBox(height: 15),
            const MessageModal(
                title:
                    'When traveling, you will need to leave it with someone you trust.'),
            const SizedBox(height: 15),
            const MessageModal(
                title:
                    'You will have expenses with feed, vaccines and veterinarian.'),
            const SizedBox(height: 15),
            const MessageModal(
                title:
                    'Dogs and cats live 15 years or more and you will be responsible for taking care of them during that time. ;)'),
            const SizedBox(height: 50),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Owner: ',
                    style: AppTextStyles.titleHeadingBold,
                    children: [
                      TextSpan(
                          text: 'Merlinda',
                          style: AppTextStyles.titleHeadingRegular)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                SvgPicture.asset(AppAssets.phoneSvg),
                const SizedBox(width: 10),
                Text('662-644-3281', style: AppTextStyles.titleHeadingBold),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                SvgPicture.asset(AppAssets.mailSvg),
                const SizedBox(width: 10),
                Text('example@gmail.com',
                    style: AppTextStyles.titleHeadingBold),
              ],
            ),
            const SizedBox(height: 40),
            ActionButton(
                title: 'Got it',
                handleOnTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
