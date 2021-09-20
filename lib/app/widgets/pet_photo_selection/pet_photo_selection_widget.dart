import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:give_me_home/app/controllers/pet_details_controller.dart';

class PetPhotoSelection extends StatefulWidget {
  final String petPhoto;
  late int index;

  PetPhotoSelection({Key? key, required this.petPhoto, required this.index})
      : super(key: key);

  @override
  State<PetPhotoSelection> createState() => _PetPhotoSelectionState();
}

class _PetPhotoSelectionState extends State<PetPhotoSelection> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PetDetailsController>();

    return InkWell(
      onTap: () {
        controller.petPhotoIndex = widget.index;
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          border: Border.all(
              color: controller.petPhotoIndex == widget.index
                  ? Colors.white
                  : Colors.transparent,
              width: 3),
        ),
        child: CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(widget.petPhoto),
        ),
      ),
    );
  }
}
