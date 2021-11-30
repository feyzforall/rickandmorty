import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rickandmorty_state.dart';

class RickandmortyCubit extends Cubit<RickandmortyState> {
  RickandmortyCubit() : super(RickandmortyInitial());
}
