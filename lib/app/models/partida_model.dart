import 'package:rpg_game_aps/app/models/jogador_model.dart';

class PartidaModel {
  PartidaModel(
    this._id,
    this._jogador1,
    this._jogador2, [
    this._rodada = 1,
  ]);

  final int _id;
  int _rodada;
  JogadorModel _jogador1;
  JogadorModel _jogador2;
  JogadorModel? _vencedor;

  int get id => _id;
  int get rodada => _rodada;
  JogadorModel get jogador1 => _jogador1;
  JogadorModel get jogador2 => _jogador2;
  JogadorModel? get vencedor => _vencedor;

  set rodada(int rodada) {
    _rodada = rodada;
  }

  set jogador1(JogadorModel jogador) {
    _jogador1 = jogador;
  }

  set jogador2(JogadorModel jogador) {
    _jogador2 = jogador;
  }

  set vencedor(JogadorModel? jogador) {
    _vencedor = jogador;
  }
}
