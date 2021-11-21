import 'package:flutter/material.dart';
import 'package:rpg_game_aps/app/controllers/jogador_controller.dart';
import 'package:rpg_game_aps/app/controllers/personagem_controller.dart';
import 'package:rpg_game_aps/app/shared/themes/app_colors.dart';
import 'escolha_personagem_card.dart';

class EscolhaPersonagemModal extends StatelessWidget {
  EscolhaPersonagemModal(
    this._jogadorController, {
    Key? key,
  }) : super(key: key);
  final PersonagemController _controller = PersonagemController();
  final JogadorController _jogadorController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
          itemCount: _controller.getPersonagens().length,
          itemBuilder: (context, index) {
            return EscolhaPersonagemCard(
              personagem: _controller.getPersonagens()[index],
              isSelecionado: _controller.getPersonagens()[index].id == _jogadorController.jogador1.personagem.id,
              onTap: () {
                if (_controller.getPersonagens()[index].id != _jogadorController.jogador2.personagem.id) {
                  _jogadorController.atualizarPersonagemJogador(_jogadorController.jogador1, index);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Escolha um personagem diferente',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: AppColors.tertiary,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
            );
          }),
    );
  }
}
