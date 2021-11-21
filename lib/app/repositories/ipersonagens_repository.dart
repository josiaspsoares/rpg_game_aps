import 'package:rpg_game_aps/app/models/personagem_model.dart';

abstract class IPersonagensRepository {
  List<PersonagemModel> getPersonagens();
}
