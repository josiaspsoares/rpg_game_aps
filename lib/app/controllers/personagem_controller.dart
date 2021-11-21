import 'package:rpg_game_aps/app/models/personagem_model.dart';
import 'package:rpg_game_aps/app/repositories/ipersonagens_repository.dart';
import 'package:rpg_game_aps/app/repositories/personagens_repository.dart';

class PersonagemController {
  final IPersonagensRepository _repository = PersonagensRepository();

  List<PersonagemModel> getPersonagens() {
    return _repository.getPersonagens();
  }
}
