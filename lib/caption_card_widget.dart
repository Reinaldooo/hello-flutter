import 'package:flutter/material.dart';

class CaptionCardWidget extends StatelessWidget {
  const CaptionCardWidget({
    Key? key,
    required String caption,
    required TextEditingController captionController,
  })  : _caption = caption,
        _captionController = captionController,
        super(key: key);

  final String _caption;
  final TextEditingController _captionController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("assets/1.jpg"),
          const SizedBox(height: 20),
          Text(
            _caption,
            style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _captionController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Inclua uma legenda para a foto",
                labelText: "Legenda"),
          )
        ],
      ),
    );
  }
}
