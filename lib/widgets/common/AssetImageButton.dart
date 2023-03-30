import 'package:flutter/material.dart';

class AssetImageButton extends StatelessWidget {
  final String asset;
  final void Function()? onTap;
  const AssetImageButton({
    Key? key,
    required this.asset,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        asset,
        fit: BoxFit.cover,
      ),
    );
  }
}
