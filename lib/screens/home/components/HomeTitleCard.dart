import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class HomeTitleCard extends StatelessWidget {
  const HomeTitleCard(
      {Key? key, required this.text, required this.press, this.color})
      : super(key: key);

  final String? text, color;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: getProportionateScreenWidth(55) * 2,
          child: Column(
            children: [
              Container(
                // padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                height: getProportionateScreenWidth(55) * 2,
                width: getProportionateScreenWidth(55) * 2,
                decoration: BoxDecoration(
                  color: HexColor(color ?? "#FFFFFF"),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: invert(HexColor(color ?? "#FFFFFF"))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
