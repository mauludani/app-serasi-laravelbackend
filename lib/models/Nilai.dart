part of 'models.dart';

class Nilai extends Equatable {
  final String nis, idNilai, idMapel, idSemester;
  final int tugas1, tugas2, tugas3, uts, uas;

  Nilai(
      {this.idMapel,
      this.idNilai,
      this.idSemester,
      this.nis,
      this.tugas1,
      this.tugas2,
      this.tugas3,
      this.uas,
      this.uts});

  factory Nilai.fromJson(Map<String, dynamic> data) => Nilai(
        nis: data["nis"],
        idMapel: data["id_mapel"],
        idNilai: data["id_Nilai"],
        idSemester: data["id_semester"],
        tugas1: data["nilai_tugas1"],
        tugas2: data["nilai_tugas2"],
        tugas3: data["nilai_tugas3"],
        uas: data["uas"],
        uts: data["uts"],
      );

  Nilai copyWith(
          {String nis,
          String idNilai,
          String idMapel,
          String idSemester,
          int tugas1,
          int tugas2,
          int tugas3,
          int uts,
          int uas}) =>
      Nilai(
        nis: nis ?? this.nis,
        idMapel: idMapel ?? this.idMapel,
        idNilai: idNilai ?? this.idNilai,
        idSemester: idSemester ?? this.idSemester,
        tugas1: tugas1 ?? this.tugas1,
        tugas2: tugas2 ?? this.tugas2,
        tugas3: tugas3 ?? this.tugas3,
        uas: uas ?? this.uas,
        uts: uts ?? this.uts,
      );

  @override
  List<Object> get props =>
      [idNilai, idMapel, idSemester, tugas1, tugas2, tugas3, uts, uas, nis];
}
