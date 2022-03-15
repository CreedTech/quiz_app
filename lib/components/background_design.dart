import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class BackGroundDesign extends StatelessWidget {
  const BackGroundDesign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // child: WebsafeSvg.asset('assets/icons/image2vector.svg'),
      child: Image.asset(
        'assets/images/my_bg.jpg',
        alignment: Alignment.center,
        fit: BoxFit.cover,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}