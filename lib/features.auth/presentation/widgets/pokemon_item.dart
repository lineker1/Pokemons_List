import 'package:flutter/material.dart';
import 'package:pokemon_list/features.auth/domain/entities/pokemons.dart';

class Pokemon_Card extends StatelessWidget {
  final PokemonsEntity? pokemon;

  const Pokemon_Card({super.key, this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2.0,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 20.0,
                    child: Text(
                      pokemon?.name ?? '',
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
