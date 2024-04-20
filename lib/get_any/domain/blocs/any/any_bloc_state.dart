// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'any_bloc_bloc.dart';

class AnyState {
  final List<String> anyList;
  final bool isLoading;
  const AnyState({this.anyList = const [], this.isLoading = false});

  AnyState copyWith({
    List<String>? anyList,
    bool? isLoading,
  }) {
    return AnyState(
      anyList: anyList ?? this.anyList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
