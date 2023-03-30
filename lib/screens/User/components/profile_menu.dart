import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    this.text,
    this.icon,
    this.press,
    this.iconWidget,
  }) : super(key: key);

  final String? text, icon;
  final VoidCallback? press;
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kColorFimary, padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            icon == ""
                ? iconWidget ?? Container()
                : SvgPicture.asset(
                    icon ?? "",
                    color: kColorFimary,
                    width: 22,
                  ),
            const SizedBox(width: 20),
            Expanded(child: Text(text ?? "")),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
