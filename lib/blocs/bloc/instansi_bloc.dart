import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../models/models.dart';
import '../../services/instansi_services.dart';

import 'package:equatable/equatable.dart';
part 'instansi_event.dart';
part 'instansi_state.dart';

class InstansiBloc extends Bloc<InstansiEvent, InstansiState> {
  final InstansiService _instansiService;
  InstansiBloc(this._instansiService) : super(InstansiLoadingState()) {
    on<LoadInstansi>(_onLoadInstansi);
    on<AddInstansi>(_onAddInstansi);
    on<UpdateInstansi>(_onUpdateInstansi);
    on<DeleteInstansi>(_onDeleteInstansi);
  }

  void _onLoadInstansi(event, emit) async {
    emit(InstansiLoadingState());
    try {
      List<Instansi> instansi = await _instansiService.getInstansi();
      debugPrint(instansi.first.namaInstansi);
      emit(InstansiLoadedState(instansi));
    } catch (e) {
      emit(InstansiErrorState(e.toString()));
    }
  }

  void _onAddInstansi(event, emit) {
    final state = this.state;
    emit(InstansiLoadedState(
        (state as InstansiLoadedState).instansiList..add(event.dokumen)));
  }

  void _onUpdateInstansi(event, emit) {}

  void _onDeleteInstansi(event, emit) {}
}
