part of 'models.dart';

class DaftarBayar extends Equatable {
  final int id;
  final String nis, tanggal, ket, bayar;

  DaftarBayar({
    this.id,
    this.nis,
    this.tanggal,
    this.ket,
    this.bayar,
  });

  factory DaftarBayar.fromJson(Map<String, dynamic> data) => DaftarBayar(
        id: data["id"],
        nis: data["nis"],
        tanggal: data["tanggal"],
        ket: data["ket"],
        bayar: data["bayar"],
      );

  DaftarBayar copyWith({
    int id,
    String nis,
    String tanggal,
    String ket,
    String bayar,
  }) =>
      DaftarBayar(
        id: id ?? this.id,
        nis: nis ?? this.nis,
        tanggal: tanggal ?? this.tanggal,
        ket: ket ?? this.ket,
        bayar: bayar ?? this.bayar,
      );

  @override
  List<Object> get props => [
        id,
        nis,
        tanggal,
        ket,
        bayar,
      ];
}
