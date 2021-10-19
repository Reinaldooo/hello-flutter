import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
//
import 'home_page.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({Key? key}) : super(key: key);

  static const routeName = '/image-detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Container(
        color: Colors.black87,
        child: Stack(
          children: <Widget>[
            const Center(child: CircularProgressIndicator()),
            Center(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: args.url,
              ),
            ),
          ],
        ));
  }
}
