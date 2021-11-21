import 'dart:math';
import 'package:rpg_game_aps/app/controllers/personagem_controller.dart';
import 'package:rpg_game_aps/app/models/computador_model.dart';
import 'package:rpg_game_aps/app/models/jogador_model.dart';
import 'package:rpg_game_aps/app/models/usuario_model.dart';

class JogadorController {
  final _personagens = PersonagemController();

  late UsuarioModel _jogador1;
  late ComputadorModel _jogador2;

  get jogador1 => _jogador1;
  get jogador2 => _jogador2;

  void setJogador1(int id, String nome) {
    _jogador1 = UsuarioModel(id, _personagens.getPersonagens()[0], nome);
  }

  void setJogador2(int id) {
    _jogador2 = ComputadorModel(id, _personagens.getPersonagens()[Random().nextInt(5) + 1]);
  }

  void atualizarPersonagemJogador(JogadorModel jogador, int idPersonagem) {
    jogador.personagem = _personagens.getPersonagens()[idPersonagem];
  }
}
