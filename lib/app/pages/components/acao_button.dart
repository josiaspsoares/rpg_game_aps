import 'package:flutter/material.dart';

class AcaoButton extends StatelessWidget {
  const AcaoButton({
    Key? key,
    required this.imageURL,
    required this.onTap,
  }) : super(key: key);

  final String imageURL;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imageURL,
        fit: BoxFit.cover,
        width: 35,
        height: 35,
      ),
    );
  }
}
