import 'package:flutter/material.dart';
import 'package:toeic/screens/home/components/section_title.dart';

import '../../../utils/constant.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"color": "#e52165", "text": "Part 1"},
      {"color": "#FFA07A", "text": "Part 2"},
      {"color": "#00FF7F", "text": "Part 3"},
      {"color": "#87CEFA", "text": "Part 4"},
      {"color": "#FF7F50", "text": "Part 5"},
      {"color": "#008B8B", "text": "Part 6"},
      {"color": "#F5DEB3", "text": "Part 7"},
    ];
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: const SectionTitle(
            title: "Skill test",
            // press: () {},
          ),
        ),
        Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                categories.length,
                (index) => CategoryCard(
                  text: "Part ${index + 1}",
                  color: categories[index]["color"],
                  press: () {},
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
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
                height: getProportionateScreenWidth(55),
                width: getProportionateScreenWidth(55) * 2,
                decoration: BoxDecoration(
                  color: HexColor(color ?? "#FFFFFF"),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    text!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
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
