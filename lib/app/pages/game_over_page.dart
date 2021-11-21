import 'package:flutter/material.dart';
import 'package:rpg_game_aps/app/models/jogador_model.dart';
import 'package:rpg_game_aps/app/models/usuario_model.dart';
import 'package:rpg_game_aps/app/shared/themes/app_colors.dart';
import 'package:rpg_game_aps/app/shared/themes/app_images.dart';
import 'components/custom_button.dart';
import 'components/personagem_card.dart';
import 'landing_page.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({
    Key? key,
    required this.vencedor,
  }) : super(key: key);

  final JogadorModel vencedor;

  String _gerarMensagemVencedor() {
    if (vencedor is UsuarioModel) {
      var usuario = vencedor as UsuarioModel;
      return 'Parabéns ${usuario.nome}, você venceu a partida!';
    } else {
      return 'O Computador venceu a partida! Não desista, tente novamente!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.logo,
                    width: 270,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                _gerarMensagemVencedor(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              PersonagemCard(
                personagem: vencedor.personagem,
                color: AppColors.primary,
                onTap: () {},
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'HOME',
                    onTap: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LandingPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
