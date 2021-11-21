import 'package:flutter/material.dart';
import 'package:rpg_game_aps/app/shared/themes/app_text_styles.dart';

class ForcaCard extends StatelessWidget {
  const ForcaCard({
    Key? key,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 59,
      height: 27,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Text(
        text,
        style: AppTextStyles.characterPower.copyWith(color: textColor),
      ),
    );
  }
}
