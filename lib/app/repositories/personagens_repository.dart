import 'package:rpg_game_aps/app/models/personagem_model.dart';
import 'package:rpg_game_aps/app/shared/themes/app_images.dart';
import 'ipersonagens_repository.dart';

class PersonagensRepository implements IPersonagensRepository {
  final List<PersonagemModel> _personagens = [
    PersonagemModel(
      id: 1,
      nome: 'O Cientista',
      descricao: 'A ciência é a fortaleza',
      imagemUrl: AppImages.character1,
    ),
    PersonagemModel(
      id: 2,
      nome: 'O Lenhador',
      descricao: 'Preparado para o combate',
      imagemUrl: AppImages.character2,
    ),
    PersonagemModel(
      id: 3,
      nome: 'O Príncipe',
      descricao: 'Justiça acima de tudo',
      imagemUrl: AppImages.character3,
    ),
    PersonagemModel(
      id: 4,
      nome: 'O Mago',
      descricao: 'A magia está no ar',
      imagemUrl: AppImages.character4,
    ),
    PersonagemModel(
      id: 5,
      nome: 'A Princesa',
      descricao: 'A sabedoria vencerá',
      imagemUrl: AppImages.character5,
    ),
    PersonagemModel(
      id: 6,
      nome: 'A Rainha',
      descricao: 'O bem derrotará o mal',
      imagemUrl: AppImages.character6,
    ),
  ];

  @override
  List<PersonagemModel> getPersonagens() {
    return _personagens;
  }
}