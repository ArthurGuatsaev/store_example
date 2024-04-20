// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'file_bloc.dart';

class FileState {
  final String fileData;

  const FileState({this.fileData = ''});

  FileState copyWith({
    String? fileData,
  }) {
    return FileState(
      fileData: fileData ?? this.fileData,
    );
  }
}
