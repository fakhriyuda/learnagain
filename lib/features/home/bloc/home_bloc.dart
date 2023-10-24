import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:learnagain/features/home/data/model/Pokemon.dart';
import 'package:learnagain/features/home/data/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetPokemon>(_getPokemon);
  }

  List<Result> pokemons = [];

  Future _getPokemon(GetPokemon event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      Pokemon result = await HomeRepository.getListPokemon();
      print(result.results);
      if (result.results != null) {
        pokemons = result.results ?? [];
        emit(HomeSuccess());
      }
    } on DioException catch (e) {
      print(e.toString());
      emit(HomeError(e.toString()));
    }
  }
}
