import 'package:flutter/material.dart';
import 'package:pokemon_list/features.auth/domain/entities/pokemons.dart';

class InfoPokemonScreen extends StatelessWidget {
  const InfoPokemonScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    double height, width;
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final pokemon =
        ModalRoute.of(context)!.settings.arguments as PokemonsEntity;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: height * .5,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Container(
                      height: height * .5,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 110.0,
                                ),
                                Text(
                                  '${pokemon.name} #${pokemon.number}',
                                  style:
                                  Theme.of(context).textTheme.displaySmall,
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: width *.9 - (height * .3),
                top: height *.7 - (width * .7),
                child: Image.network(
                  pokemon.img ?? '',
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
