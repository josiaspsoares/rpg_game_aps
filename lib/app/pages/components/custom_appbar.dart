import 'package:flutter/material.dart';
import 'package:rpg_game_aps/app/shared/themes/app_colors.dart';
import 'package:rpg_game_aps/app/shared/themes/app_text_styles.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  CustomAppBar(
    this.title, {
    Key? key,
  })  : preferredSize = const Size.fromHeight(80.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.appbarText,
          ),
        ],
      ),
      decoration: const BoxDecoration(
        boxShadow: [
            BoxShadow(
                color: Color(0x0c000000),
                blurRadius: 30,
                offset: Offset(0, 10),
            ),
        ],
      color: AppColors.appbar,
      ),
    );
  }
}
