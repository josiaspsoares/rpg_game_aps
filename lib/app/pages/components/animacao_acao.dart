import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class AnimacaoAcao extends StatelessWidget {
  const AnimacaoAcao({
    Key? key,
    required this.springController,
    required this.slideType,
    required this.imagem,
    required this.cor,
  }) : super(key: key);

  final SpringController springController;
  final SlideType slideType;
  final String imagem;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Spring.slide(
        springController: springController,
        slideType: slideType,
        delay: const Duration(milliseconds: 500),
        animDuration: const Duration(milliseconds: 1000),
        curve: Curves.easeInExpo,
        extend: 30,
        withFade: true,
        child: Container(
          width: 30,
          height:60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: cor.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
            color: cor,
          ),
        ));
  }
}
