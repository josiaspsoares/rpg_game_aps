import 'package:rpg_game_aps/app/models/jogador_model.dart';
import 'package:rpg_game_aps/app/models/personagem_model.dart';

class UsuarioModel extends JogadorModel {
  final String _nome;

  UsuarioModel(
    int id,
    PersonagemModel personagem,
    this._nome,
  ) : super(id, personagem, true);

  String get nome => _nome;
}
