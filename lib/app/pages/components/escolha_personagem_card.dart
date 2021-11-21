import 'package:flutter/material.dart';
import 'package:rpg_game_aps/app/models/personagem_model.dart';
import 'package:rpg_game_aps/app/shared/themes/app_colors.dart';
import 'package:rpg_game_aps/app/shared/themes/app_text_styles.dart';

import 'nome_personagem_card.dart';

class EscolhaPersonagemCard extends StatelessWidget {
  const EscolhaPersonagemCard(
      {Key? key, required this.personagem, required this.onTap, this.isSelecionado = false})
      : super(key: key);
  final PersonagemModel personagem;
  final bool isSelecionado;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.background,
            border: isSelecionado
                ? Border.all(
                    color: AppColors.primary,
                    width: 1.5,
                  )
                : Border.all(
                    color: AppColors.tertiary.withOpacity(0.4),
                    width: 1,
                  ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Image.asset(personagem.imagemUrl, fit: BoxFit.cover,),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(
                  width: 30,
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    NomePersonagemCard(
                        nome: personagem.nome,
                        backgroundColor: AppColors.primary),
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
            ],
          ),
        ),
      ),
    );
  }
}
