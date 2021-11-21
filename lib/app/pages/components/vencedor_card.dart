import 'package:flutter/material.dart';
import 'package:rpg_game_aps/app/shared/themes/app_colors.dart';
import 'package:rpg_game_aps/app/shared/themes/app_text_styles.dart';

class VencedorCard extends StatelessWidget {
  const VencedorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 242,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.winnerCard,
      ),
      alignment: Alignment.center,
      child: Text(
        'VENCEDOR',
        style: AppTextStyles.winnerTitle,
      ),
    );
  }
}
