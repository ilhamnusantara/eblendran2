part of 'instansi_bloc.dart';

@immutable
abstract class InstansiState extends Equatable {}

class InstansiLoadingState extends InstansiState {
  @override
  List<Object?> get props => [];
}

class InstansiLoadedState extends InstansiState {
  final List<Instansi> instansiList;
  InstansiLoadedState(this.instansiList);

  @override
  List<Object?> get props => [];
}

class InstansiErrorState extends InstansiState {
  final String error;
  InstansiErrorState(this.error);
  @override
  List<Object?> get props => [];
}
