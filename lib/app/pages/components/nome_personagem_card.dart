import 'package:flutter/material.dart';
import 'package:rpg_game_aps/app/shared/themes/app_text_styles.dart';

class NomePersonagemCard extends StatelessWidget {
  const NomePersonagemCard({Key? key, required this.nome, required this.backgroundColor}) : super(key: key);

  final String nome;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 119,
      height: 35,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        nome,
        style: AppTextStyles.characterName,
        textAlign: TextAlign.center,
      ),
    );
  }
}
