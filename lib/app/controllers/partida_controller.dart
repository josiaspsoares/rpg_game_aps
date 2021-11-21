import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rpg_game_aps/app/models/jogador_model.dart';
import 'package:rpg_game_aps/app/models/partida_model.dart';
import 'package:rpg_game_aps/app/shared/themes/app_colors.dart';
import 'package:spring/spring.dart';

class PartidaController {
  late PartidaModel _partida;

  // Variáveis para armazenar o poder lançado por cada jogador ao executar uma ação
  int _poderLancadoJogador1 = 0;
  int _poderLancadoJogador2 = 0;


  // Variáveis para controlar as cores das ações dos jogadores
  Color _corAnimacaAcaoJogador1 = Colors.white;
  Color _corAnimacaAcaoJogador2 = Colors.white;


  // Variáveis para controlar a animação das ações dos jogadores
  final SpringController jogador1AnimationController = SpringController(
    initialAnim: Motion.pause,
  );
  final SpringController jogador2AnimationController = SpringController(
    initialAnim: Motion.pause,
  );


  // Energia a ser retirada de quem perdeu na rodada
  static const _energiaRetirada = 10;

  // Energia a ser retirada pelo uso de magia
  static const _energiaRetiradaMagia = 5;


  // Gettes e Setters
  get partida => _partida;

  void setPartida(int id, JogadorModel jogador1, JogadorModel jogador2) {
    _partida = PartidaModel(id, jogador1, jogador2);
  }

  get poderLancadoJogador1 => _poderLancadoJogador1;
  get poderLancadoJogador2 => _poderLancadoJogador2;

  get corAnimacaAcaoJogador1 => _corAnimacaAcaoJogador1;
  get corAnimacaAcaoJogador2 => _corAnimacaAcaoJogador2;


  // Método para obter a cor da animação do Jogador1 de acordo com o tipo de ação
  // 1 - Ataque ou defesa 2 - Ataque mágico ou defesa mágica
   _obterCorAnimacaoJogador1(int tipoAcao) {
    if (partida.jogador1.atacando) {
      if (tipoAcao == 1) {
        _corAnimacaAcaoJogador1 = AppColors.attack;
      } else {
        _corAnimacaAcaoJogador1 = AppColors.magicAttack;
      }
    } else {
      if (tipoAcao == 1) {
        _corAnimacaAcaoJogador1 = AppColors.defense;
      } else {
        _corAnimacaAcaoJogador1 = AppColors.magicDefense;
      }
    }
  }

  // Método para obter a cor da animação do Jogador2 de acordo com o tipo de ação
  // 1 - Ataque ou defesa 2 - Ataque mágico ou defesa mágica
  void _obterCorAnimacaoJogador2(int tipoAcao) {
    if (partida.jogador2.atacando) {
      if (tipoAcao == 1) {
        _corAnimacaAcaoJogador2 = AppColors.attack;
      } else {
        _corAnimacaAcaoJogador2 = AppColors.magicAttack;
      }
    } else {
      if (tipoAcao == 1) {
        _corAnimacaAcaoJogador2 = AppColors.defense;
      } else {
        _corAnimacaAcaoJogador2 = AppColors.magicDefense;
      }
    }
  }


  // Metódos referentes às ações dos jogadores
  void atacar() {
    if (_partida.jogador1.atacando) {
      // Escolhe aleatoriamente o poder de ataque
      _poderLancadoJogador1 = Random().nextInt(99) + 1;

      // Obtém a cor da animação da ação atual
      _obterCorAnimacaoJogador1(1);

      // Inicia a animação da ação
      jogador1AnimationController.play(
        motion: Motion.reverse,
        animDuration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        delay: const Duration(milliseconds: 900),
      );
    } else if (_partida.jogador2.atacando) {
      _poderLancadoJogador2 = Random().nextInt(99) + 1;

      _obterCorAnimacaoJogador2(1);

      jogador2AnimationController.play(
        motion: Motion.reverse,
        animDuration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        delay: const Duration(milliseconds: 900),
      );
    }
  }

  void atacarMagicamente() {
    if (_partida.jogador1.atacando) {
      // Escolhe aleatoriamente o poder de ataque
      _poderLancadoJogador1 = Random().nextInt(60) + 40;

      // Decrementa a energia do jogador em virtude do uso de magia
      _partida.jogador1.nivelEnergia -= _energiaRetiradaMagia;

      // Obtém a cor da animação da ação atual
      _obterCorAnimacaoJogador1(2);

      // Inicia a animação da ação
      jogador1AnimationController.play(
        motion: Motion.reverse,
        animDuration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        delay: const Duration(milliseconds: 900),
      );
    } else if (_partida.jogador2.atacando) {
      _poderLancadoJogador2 = Random().nextInt(60) + 40;
      _partida.jogador2.nivelEnergia -= _energiaRetiradaMagia;

      _obterCorAnimacaoJogador2(2);

      jogador2AnimationController.play(
        motion: Motion.reverse,
        animDuration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        delay: const Duration(milliseconds: 900),
      );
    }
  }

  void defender() {
    if (!_partida.jogador1.atacando) {
      // Escolhe aleatoriamente o poder de defesa
      _poderLancadoJogador1 = Random().nextInt(99) + 1;

      // Obtém a cor da animação da ação atual
      _obterCorAnimacaoJogador1(1);

      // Inicia a animação da ação
      jogador1AnimationController.play(
        motion: Motion.reverse,
        animDuration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        delay: const Duration(milliseconds: 900),
      );
    } else if (!_partida.jogador2.atacando) {
      _poderLancadoJogador2 = Random().nextInt(99) + 1;

      _obterCorAnimacaoJogador2(1);

      jogador2AnimationController.play(
        motion: Motion.reverse,
        animDuration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        delay: const Duration(milliseconds: 900),
      );
    }
  }

  void defenderMagicamente() {
    if (!_partida.jogador1.atacando) {
      // Escolhe aleatoriamente o poder de defesa
      _poderLancadoJogador1 = Random().nextInt(60) + 40;

      // Decrementa a energia do jogador em virtude do uso de magia
      _partida.jogador1.nivelEnergia -= _energiaRetiradaMagia;

      // Obtém a cor da animação da ação atual
      _obterCorAnimacaoJogador1(2);

      // Inicia a animação da ação
      jogador1AnimationController.play(
        motion: Motion.reverse,
        animDuration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        delay: const Duration(milliseconds: 900),
      );
    } else if (!_partida.jogador2.atacando) {
      _poderLancadoJogador2 = Random().nextInt(60) + 40;
      _partida.jogador2.nivelEnergia -= _energiaRetiradaMagia;

      _obterCorAnimacaoJogador2(2);

      jogador2AnimationController.play(
        motion: Motion.reverse,
        animDuration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        delay: const Duration(milliseconds: 900),
      );
    }
  }

  // Método para randomizar as ações do Computador (Jogador 2)
  void randomizarAcaoJogador2() {

    // Verifica se o jogador 2 está atacando ou defendendo
    if (_partida.jogador2.atacando) {
      // Escolhe aleatoriamente o tipo de ataque
      // 0 - Ataque 1 - Ataque Mágico
      int tipoAtaque = Random().nextInt(2);

      // Realiza o ataque de acordo com o tipo escolhido
      if (tipoAtaque == 0) {
        atacar();
      } else if (tipoAtaque == 1) {
        atacarMagicamente();
      }
    } else {
      // Escolhe aleatoriamente o tipo de defesa
      // 0 - Defesa 1 - Defesa Mágica
      int tipoDefesa = Random().nextInt(2);

      // Realiza a defesa de acordo com o tipo escolhido
      if (tipoDefesa == 0) {
        defender();
      } else if (tipoDefesa == 1) {
        defenderMagicamente();
      }
    }
  }

  // Método para computar os resultados de cada rodada
  void computarResultadoRodada() {
    // Verifica quem lançou o poder mais alto e retira energia do adversário
    if (_poderLancadoJogador1 > _poderLancadoJogador2) {
      _partida.jogador2.nivelEnergia -= _energiaRetirada;
    } else if (_poderLancadoJogador1 < _poderLancadoJogador2) {
      _partida.jogador1.nivelEnergia -= _energiaRetirada;
    }

    // Caso a enegia de um dos jogadores seja menor ou igual a zero, é definido um vencedor
    if (_partida.jogador1.nivelEnergia <= 0) {
      _partida.vencedor = _partida.jogador2;
      return;
    } else if (_partida.jogador2.nivelEnergia <= 0) {
      _partida.vencedor = _partida.jogador1;
      return;
    }

    // Incrementa a rodada atual
    _partida.rodada++;

    // Alterna o jogador atacante
    if (_partida.jogador1.atacando) {
      _partida.jogador1.atacando = false;
      _partida.jogador2.atacando = true;
    } else {
      _partida.jogador2.atacando = false;
      _partida.jogador1.atacando = true;
    }
  }
}