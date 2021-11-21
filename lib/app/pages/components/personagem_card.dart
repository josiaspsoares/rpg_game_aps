import 'package:flutter/material.dart';
import 'package:rpg_game_aps/app/models/personagem_model.dart';
import 'package:rpg_game_aps/app/shared/themes/app_text_styles.dart';

import 'nome_personagem_card.dart';

class PersonagemCard extends StatelessWidget {
  const PersonagemCard({
    Key? key,
    required this.personagem,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  final PersonagemModel personagem;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: color,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NomePersonagemCard(nome: personagem.nome, backgroundColor: color),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              personagem.imagemUrl,
              height: 110,
              width: 110,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              personagem.descricao,
              style: AppTextStyles.characterDescription,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
