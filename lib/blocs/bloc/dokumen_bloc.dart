import 'dart:async';

import 'package:eblendrang2/models/models.dart';
import 'package:eblendrang2/services/dokumen_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'dokumen_event.dart';
part 'dokumen_state.dart';

class DokumenBloc extends Bloc<DokumenEvent, DokumenState> {
  final DokumenService _dokumenService;
  DokumenBloc(this._dokumenService) : super(DokumenLoadingState()) {
    on<LoadDokumen>(_onLoadDokumen);
    on<AddDokumen>(_onAddDokumen);
    on<UpdateDokumen>(_onUpdateDokumen);
    on<DeleteDokumen>(_onDeleteDokumen);
  }

  void _onLoadDokumen(event, emit) async {
    emit(DokumenLoadingState());
    try {
      List<Dokumen> dokumen = await _dokumenService.getDokumens();
      emit(DokumenLoadedState(dokumen));
    } catch (e) {
      emit(DokumenErrorState(e.toString()));
    }
  }

  void _onAddDokumen(event, emit) {
    final state = this.state;
    emit(DokumenLoadedState(
        (state as DokumenLoadedState).dokumenList..add(event.dokumen)));
  }

  void _onUpdateDokumen(event, emit) {}

  void _onDeleteDokumen(event, emit) {}
}
