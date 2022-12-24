part of 'instansi_bloc.dart';

@immutable
abstract class InstansiEvent extends Equatable {
  const InstansiEvent();
}

class LoadInstansi extends InstansiEvent {
  @override
  List<Object?> get props => [];
}

class AddInstansi extends InstansiEvent {
  final Instansi instansi;
  const AddInstansi({
    required this.instansi,
  });

  @override
  List<Object> get props => [];
}

class UpdateInstansi extends InstansiEvent {
  final Instansi instansi;
  const UpdateInstansi({required this.instansi});

  @override
  List<Object> get props => [];
}

class DeleteInstansi extends InstansiEvent {
  final Instansi instansi;
  const DeleteInstansi({required this.instansi});

  @override
  List<Object> get props => [];
}
