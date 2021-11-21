import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static final appbarText = GoogleFonts.roboto(
    fontSize: 24,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w700,
  );

  static final characterName = GoogleFonts.roboto(
    fontSize: 16,
    color: AppColors.textWhite,
  );

  static final characterDescription = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w500,
  );

  static final characterEnergy = GoogleFonts.roboto(
    fontSize: 20,
    color: AppColors.textWhite,
    fontWeight: FontWeight.w700,
  );

  static final characterPower = GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.primary,
    fontWeight: FontWeight.w700,
  );

  static final winnerTitle = GoogleFonts.roboto(
    fontSize: 22,
    color: AppColors.textWhite,
    fontWeight: FontWeight.w500,
  );

  static final round = GoogleFonts.roboto(
    fontSize: 30,
    color: AppColors.textBlack,
    fontWeight: FontWeight.w700,
  );

  static final button = GoogleFonts.roboto(
    fontSize: 22,
    color: AppColors.textWhite,
    fontWeight: FontWeight.w500,
  );
}
