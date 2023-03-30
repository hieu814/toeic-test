import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: const [
            Expanded(
                child: Center(
                    child: Text(
              "TOEIC TEST",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )))
          ],
        ));
  }
}
