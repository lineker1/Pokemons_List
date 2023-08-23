import 'package:pokemon_list/features.auth/domain/entities/pokemons.dart';

class PokemonsModel {
  int? id;
  String? name;
  String? number;
  String? img;


  PokemonsModel({this.id, this.name, this.number, this.img});

  factory PokemonsModel.fromJson(Map<String, dynamic> map) {

    return PokemonsModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      number: map['num'] ?? '',
      img: map['img'] ?? '',
    );
  }

  PokemonsEntity toEntity() {
    return PokemonsEntity(
      id: id,
      name: name,
      number: number,
      img: img,
    );
  }
}
