import 'package:flutter/material.dart';
import 'package:rpg_game_aps/app/controllers/jogador_controller.dart';
import 'package:rpg_game_aps/app/pages/components/escolha_personagem_modal.dart';
import 'package:rpg_game_aps/app/pages/game_page.dart';
import 'package:rpg_game_aps/app/shared/themes/app_colors.dart';
import 'package:rpg_game_aps/app/shared/themes/app_images.dart';
import 'components/custom_button.dart';
import 'components/personagem_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.nomeJogador1}) : super(key: key);
  final String nomeJogador1;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = JogadorController();

  @override
  void initState() {
    _controller.setJogador1(1, widget.nomeJogador1);
    _controller.setJogador2(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
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
                height: 40,
              ),
              Text(
                'Olá ${_controller.jogador1.nome}, agora escolha seu personagem!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: PersonagemCard(
                      personagem: _controller.jogador1.personagem,
                      color: AppColors.primary,
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return EscolhaPersonagemModal(_controller);
                          },
                        ).then((value) => setState(() {}));
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.asset(AppImages.versus),
                  ),
                  Expanded(
                    flex: 4,
                    child: PersonagemCard(
                      personagem: _controller.jogador2.personagem,
                      color: AppColors.secondary,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'JOGAR',
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => GamePage(jogador1: _controller.jogador1, jogador2: _controller.jogador2),
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
