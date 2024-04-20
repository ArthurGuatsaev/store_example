part of 'any_bloc_bloc.dart';

abstract class AnyEvent {}

class GetAnyDataEvent extends AnyEvent {}

class LoadNextAnyDataEvent extends AnyEvent {
  final int index;

  LoadNextAnyDataEvent({required this.index});
}
