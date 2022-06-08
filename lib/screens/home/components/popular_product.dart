import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final List<String> title;
  final String label;
  final GestureTapCallback? press;
  const PopularProducts({
    Key? key,
    required this.title,
    required this.label,
    this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: label, press: press),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                title.length,
                (index) {
                  return VocabularyCard(
                    press: () {},
                    color: randomColor[index + 2],
                    text: title[index],
                  ); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}

class VocabularyCard extends StatelessWidget {
  const VocabularyCard(
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
