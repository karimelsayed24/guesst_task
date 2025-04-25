
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svg/banner_background.svg'),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset('assets/images/girle_image.png'),
        ),
      ],
    );
  }
}
