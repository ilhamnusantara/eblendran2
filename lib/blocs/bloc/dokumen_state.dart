part of 'dokumen_bloc.dart';

@immutable
abstract class DokumenState extends Equatable {}

class DokumenLoadingState extends DokumenState {
  @override
  List<Object?> get props => [];
}

class DokumenLoadedState extends DokumenState {
  final List<Dokumen> dokumenList;
  DokumenLoadedState(this.dokumenList);

  @override
  List<Object?> get props => [];
}

class DokumenErrorState extends DokumenState {
  final String error;
  DokumenErrorState(this.error);
  @override
  List<Object?> get props => [];
}
