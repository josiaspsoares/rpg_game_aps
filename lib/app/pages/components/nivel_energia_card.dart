import 'package:flutter/material.dart';
import 'package:rpg_game_aps/app/shared/themes/app_text_styles.dart';

class NivelEnergiaCard extends StatelessWidget {
  const NivelEnergiaCard({
    Key? key,
    required this.nivelEnergia,
    required this.color,
  }) : super(key: key);

  final String nivelEnergia;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      child: Text(
        nivelEnergia,
        style: AppTextStyles.characterEnergy,
      ),
    );
  }
}
