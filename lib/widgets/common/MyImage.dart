import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/Image.dart';
import '../../utils/constant.dart';

class MyImage extends StatelessWidget {
  const MyImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final ImageModel? image;
  @override
  Widget build(BuildContext context) {
    String url = placeholderUrl;
    if (image!.url != null) {
      url = "http://${MyConfig.apiURL}${image!.url.toString()}";
    }
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/place_holder.jpg',
      image: url,
      fit: BoxFit.cover,
    );
  }
}
