import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_list/features.auth/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon_list/features.auth/presentation/bloc/pokemon_bloc_event.dart';
import 'package:pokemon_list/features.auth/presentation/bloc/pokemon_bloc_state.dart';

class HomeInitialScreen extends StatefulWidget {
  final PokemonBloc bloc;

  const HomeInitialScreen({super.key, required this.bloc});

  @override
  State<HomeInitialScreen> createState() => _HomeInitialScreenState();
}

class _HomeInitialScreenState extends State<HomeInitialScreen> {
  @override
  void initState() {
    widget.bloc.add(GetPokemonsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Pokemonzada',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<PokemonBloc, PokemonBlocState>(
      bloc: widget.bloc,
      builder: (_, state) {
        if (state is PokemonLoadState) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is PokemonErrorState) {
          return Center(
            child: IconButton(
              onPressed: () => widget.bloc.add(GetPokemonsEvent()),
              icon: const Icon(Icons.refresh),
            ),
          );
        }
        if (state is PokemonSucessState) {
          return Column(
            children: [
              TextField(
                onChanged: (query) => widget.bloc.add(SearchEvent(query)),
                decoration: const InputDecoration(
                  labelText: 'Search by name',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: state.result.length,
                  itemBuilder: (context, index) {
                    final pokemon = state.result[index];
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 8,
                          child: Column(
                            children: [
                              Image.network(
                                pokemon.img ?? '',
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 10),
                              Text('${pokemon.number} - ${pokemon.name}'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
