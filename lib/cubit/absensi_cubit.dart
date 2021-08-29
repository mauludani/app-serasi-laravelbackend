// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:serasi/models/models.dart';
// import 'package:serasi/services/services.dart';

// part 'absensi_state.dart';

// class AbsensiCubit extends Cubit<AbsensiState> {
//   AbsensiCubit() : super(AbsensiInitial());

//   Future<void> getAbsensis() async {
//     ApiReturnValue<List<Absensi>> result = await AbsensiServices.getAbsensi();

//     if (result.value != null) {
//       emit(AbsensiLoaded(result.value));
//     } else {
//       emit(AbsensiLoadingFailed(result.message));
//     }
//   }
// }
