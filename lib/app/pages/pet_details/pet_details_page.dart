import 'package:flutter/material.dart';
import 'package:give_me_home/app/constants/app_colors.dart';
import 'package:give_me_home/app/constants/app_text_styles.dart';
import 'package:give_me_home/app/widgets/action_button/action_button_widget.dart';
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

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.41,
              child: Stack(
                children: [
                  Hero(
                    tag: data.name,
                    child: Image.network(
                      data.photos[photoIndex],
                      height: size.height * 0.38,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Positioned(
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
                    ),
                  )
                ],
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
            ActionButton(title: 'Adopt', handleOnTap: () {})
          ],
        ),
      ),
    );
  }
}
