part of 'dokumen_bloc.dart';

@immutable
abstract class DokumenEvent extends Equatable {
  const DokumenEvent();
}

class LoadDokumen extends DokumenEvent {
  @override
  List<Object?> get props => [];
}

class AddDokumen extends DokumenEvent {
  final Instansi dokumen;
  const AddDokumen({
    required this.dokumen,
  });

  @override
  List<Object> get props => [];
}

class UpdateDokumen extends DokumenEvent {
  final Instansi dokumen;
  const UpdateDokumen({required this.dokumen});

  @override
  List<Object> get props => [];
}

class DeleteDokumen extends DokumenEvent {
  final Instansi dokumen;
  const DeleteDokumen({required this.dokumen});

  @override
  List<Object> get props => [];
}
