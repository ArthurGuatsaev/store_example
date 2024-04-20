import 'package:bloc/bloc.dart';
import 'package:store_example/get_any/domain/repositories/any_repository.dart';

part 'any_bloc_event.dart';
part 'any_bloc_state.dart';

class AnyBloc extends Bloc<AnyEvent, AnyState> {
  final BaseAnyRepository _anyR;
  AnyBloc({required BaseAnyRepository anyR})
      : _anyR = anyR,
        super(const AnyState()) {
    on<GetAnyDataEvent>(getAnyList);
    on<LoadNextAnyDataEvent>(loadNextAnyList);
  }

  /// получаем загруженный при инициализации список
  getAnyList(GetAnyDataEvent event, Emitter<AnyState> emit) {
    final anyList = _anyR.anyList;
    return emit(state.copyWith(anyList: anyList));
  }

  /// подгружаем список через функцию заглушку
  loadNextAnyList(LoadNextAnyDataEvent event, Emitter<AnyState> emit) async {
    if (event.index == state.anyList.length - 2) {
      emit(state.copyWith(isLoading: true));
      final page = state.anyList.length ~/ 20;
      final newAnyList = await _anyR.getAnyList(page, 20);
      emit(state.copyWith(anyList: newAnyList, isLoading: false));
    }
  }
}
