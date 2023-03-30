import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        if (press != null)
          GestureDetector(
            onTap: press,
            child: const Text(
              "See More",
              style: TextStyle(color: Color(0xFFBBBBBB)),
            ),
          ),
      ],
    );
  }
}
