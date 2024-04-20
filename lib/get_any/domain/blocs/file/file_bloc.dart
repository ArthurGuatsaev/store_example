import 'package:bloc/bloc.dart';
import 'package:store_example/get_any/domain/repositories/file_native_worker/file_native_worker.dart';

part 'file_event.dart';
part 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final BaseFileReaderWorkerRepository _fR;
  FileBloc({required BaseFileReaderWorkerRepository fR})
      : _fR = fR,
        super(const FileState()) {
    on<ReadFileMethodEvent>(readFileNative);
  }
  readFileNative(ReadFileMethodEvent event, Emitter<FileState> emit) async {
    final fileData = await _fR.getFile();
    emit(state.copyWith(fileData: fileData));
  }
}
