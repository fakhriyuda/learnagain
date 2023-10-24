import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnagain/features/detail/presentation/detail_page.dart';
import 'package:learnagain/features/home/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(GetPokemon());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon Back'),
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listener: (context, state) {
            if (state is HomeSuccess) {
              print('yud success yuda');
            }
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is HomeSuccess) {
              return ListView.builder(
                  itemCount: homeBloc.pokemons.length,
                  itemBuilder: (context, index) {
                    var pokemonItem = homeBloc.pokemons[index];
                    return ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      title: Text(pokemonItem.name ?? "Unknown"),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(nameketek: "yuda"),));
                      },
                    );
                  });
            }
            return SizedBox();
          },
        ));
  }
}
