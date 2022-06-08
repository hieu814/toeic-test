import 'package:flutter/material.dart';

class DisplayCircleImage extends StatelessWidget {
  final double size;
  final bool hasBorder;
  final String url;

  const DisplayCircleImage(
      {Key? key, this.size = 10, this.hasBorder = false, this.url = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
        border: Border.all(
          color: Colors.white,
          width: hasBorder ? 2.0 : 0.0,
        ),
      ),
      child: ClipOval(
          child: url.isNotEmpty
              ? Image.network(url)
              : Image.asset(
                  'assets/images/placeholder.jpg',
                  fit: BoxFit.cover,
                  height: size,
                  width: size,
                )),
    );
  }
}
