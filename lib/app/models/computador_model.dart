import 'package:rpg_game_aps/app/models/jogador_model.dart';
import 'package:rpg_game_aps/app/models/personagem_model.dart';

class ComputadorModel extends JogadorModel {
  ComputadorModel(
    int id,
    PersonagemModel personagem,
  ) : super(id, personagem);
}
