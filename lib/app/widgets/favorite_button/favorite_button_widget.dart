import 'package:give_me_home/app/constants/app_assets.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:give_me_home/app/constants/app_colors.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isAnimatedComplete = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isAnimatedComplete = true;
        });
      }

      if (status == AnimationStatus.dismissed) {
        setState(() {
          _isAnimatedComplete = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(21),
      ),
      child: IconButton(
        onPressed: () {
          _isAnimatedComplete ? _controller.reverse() : _controller.forward();
        },
        icon: Lottie.asset(
          AppAssets.favoriteAnimatedJson,
          width: 24,
          height: 24,
          controller: _controller,
        ),
      ),
    );
  }
}
