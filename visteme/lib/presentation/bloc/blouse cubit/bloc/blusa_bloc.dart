import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:visteme/data/models/blusa_model.dart';
import 'package:visteme/data/repositories/blusa/blusa_repository.dart';

part 'blusa_event.dart';
part 'blusa_state.dart';

class BlusaBloc extends Bloc<BlusaEvent, BlusaState> {
  final BlusaRepository _blusaRepository;
  StreamSubscription? _blusaSubscription;

  BlusaBloc({required BlusaRepository blusaRepository})
      : _blusaRepository = blusaRepository,
        super(BlusaLoading());

  @override
  Stream<BlusaState> mapEventToState(
    BlusaEvent event,
  ) async* {
    if (event is LoadBlusas) {
      yield* _mapLoadBlusasToState();
    }
    if (event is UpdateBlusas) {
      yield* _mapUpdateBlusasToState(event);
    }
  }

  Stream<BlusaState> _mapLoadBlusasToState() async* {
    _blusaSubscription?.cancel();
    _blusaSubscription = _blusaRepository.getAllBlusas().listen(
          (blusas) => add(
            UpdateBlusas(blusas),
          ),
        );
  }

  Stream<BlusaState> _mapUpdateBlusasToState(UpdateBlusas event) async* {
    yield BlusaLoaded(blusas: event.blusas);
  }
}
