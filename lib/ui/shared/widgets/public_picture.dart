import 'package:flutter/material.dart';

class PublicPicture extends StatelessWidget {

  const PublicPicture({super.key,required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/placeholder.png'),
        )
      )
    );
  }
}