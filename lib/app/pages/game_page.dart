import 'package:flutter/material.dart';
import 'package:rpg_game_aps/app/controllers/partida_controller.dart';
import 'package:rpg_game_aps/app/models/jogador_model.dart';
import 'package:rpg_game_aps/app/pages/components/forca_card.dart';
import 'package:rpg_game_aps/app/shared/themes/app_colors.dart';
import 'package:rpg_game_aps/app/shared/themes/app_images.dart';
import 'package:spring/spring.dart';
import 'components/acao_button.dart';
import 'components/animacao_acao.dart';
import 'components/custom_appbar.dart';
import 'components/nivel_energia_card.dart';
import 'game_over_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.jogador1, required this.jogador2}) : super(key: key);

  final JogadorModel jogador1;
  final JogadorModel jogador2;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = PartidaController();

  @override
  void initState() {
    _controller.setPartida(1, widget.jogador1, widget.jogador2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.partida.vencedor != null) {
      Future.delayed(const Duration(milliseconds: 900), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => GameOverPage(
                      vencedor: _controller.partida.vencedor!,
                    )));
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar('RODADA ${_controller.partida.rodada}'),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NivelEnergiaCard(
                      nivelEnergia: _controller.partida.jogador2.nivelEnergia.toString(),
                      color: AppColors.secondary,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _controller.partida.jogador2.personagem.imagemUrl,
                      fit: BoxFit.cover,
                      width: 130,
                      height: 130,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                AnimacaoAcao(
                    springController: _controller.jogador2AnimationController,
                    slideType: SlideType.slide_in_bottom,
                    imagem: AppImages.defense,
                    cor: _controller.corAnimacaAcaoJogador2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: const [],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: const [],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          ForcaCard(
                            text: _controller.poderLancadoJogador2.toString(),
                            textColor: AppColors.secondary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          ForcaCard(
                            text: _controller.poderLancadoJogador1.toString(),
                            textColor: AppColors.primary,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: const [],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: const [],
                      ),
                    ),
                  ],
                ),
                AnimacaoAcao(
                  springController: _controller.jogador1AnimationController,
                  slideType: SlideType.slide_in_top,
                  imagem: AppImages.attack,
                  cor: _controller.corAnimacaAcaoJogador1,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Visibility(
                        visible: _controller.partida.jogador1.atacando,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AcaoButton(
                                  imageURL: AppImages.magicAttack,
                                  onTap: () {
                                    setState(() {
                                      _controller.atacarMagicamente();
                                      _controller.randomizarAcaoJogador2();
                                      _controller.computarResultadoRodada();
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AcaoButton(
                                  imageURL: AppImages.attack,
                                  onTap: () {
                                    setState(() {
                                      _controller.atacar();
                                      _controller.randomizarAcaoJogador2();
                                      _controller.computarResultadoRodada();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Image.asset(
                            _controller.partida.jogador1.personagem.imagemUrl,
                            fit: BoxFit.cover,
                            width: 130,
                            height: 130,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Visibility(
                        visible: !_controller.partida.jogador1.atacando,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AcaoButton(
                                  imageURL: AppImages.magicDefense,
                                  onTap: () {
                                    setState(() {
                                      setState(() {
                                        _controller.randomizarAcaoJogador2();
                                        _controller.defenderMagicamente();
                                        _controller.computarResultadoRodada();
                                      });
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                AcaoButton(
                                  imageURL: AppImages.defense,
                                  onTap: () {
                                    setState(() {
                                      _controller.randomizarAcaoJogador2();
                                      _controller.defender();
                                      _controller.computarResultadoRodada();
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NivelEnergiaCard(
                      nivelEnergia: _controller.partida.jogador1.nivelEnergia.toString(),
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
