part of 'nilai_cubit.dart';

abstract class NilaiState extends Equatable {
  const NilaiState();

  @override
  List<Object> get props => [];
}

class NilaiInitial extends NilaiState {}

class NilaiLoaded extends NilaiState {
  final Nilai nilais;

  NilaiLoaded(this.nilais);

  @override
  List<Object> get props => [nilais];
}

class NilaiLoadingFailed extends NilaiState {
  final String message;

  NilaiLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
