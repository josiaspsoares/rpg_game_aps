import 'package:rpg_game_aps/app/models/personagem_model.dart';

abstract class JogadorModel {
  final int _id;
  int _nivelEnergia;
  bool _atacando;
  PersonagemModel _personagem;

  JogadorModel(
    this._id,
    this._personagem, [
    this._atacando = false,
    this._nivelEnergia = 100,
  ]);

  int get id => _id;
  int get nivelEnergia => _nivelEnergia;
  bool get atacando => _atacando;
  PersonagemModel get personagem => _personagem;

  set nivelEnergia(int nivelEnergia) {
    _nivelEnergia = nivelEnergia;
  }

  set atacando(bool atacando) {
    _atacando = atacando;
  }

  set personagem(PersonagemModel personagem) {
    _personagem = personagem;
  }

}
