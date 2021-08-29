import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serasi/models/models.dart';
import 'package:serasi/services/services.dart';

part 'nilai_state.dart';

class NilaiCubit extends Cubit<NilaiState> {
  NilaiCubit() : super(NilaiInitial());

  Future<void> getNilais() async {
    ApiReturnValue<Nilai> result = await NilaiServices.getNilai();

    emit(NilaiLoaded(result.value));
  }
}
