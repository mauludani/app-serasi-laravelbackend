part of 'models.dart';

class User extends Equatable {
  final int id, idLevel;
  final String nama, nis, jk, kelas;
  static String token;

  User({this.id, this.idLevel, this.jk, this.kelas, this.nama, this.nis});

  factory User.fromJson(Map<String, dynamic> data) => User(
      id: data['id_siswa'],
      idLevel: data['id_level'],
      jk: data['jk'],
      kelas: data['kelas'],
      nama: data['name'],
      nis: data['email']);

  User copyWith(
          {int id,
          int idLevel,
          String nama,
          String nis,
          String jk,
          String kelas}) =>
      User(
        id: id ?? this.id,
        idLevel: idLevel ?? this.idLevel,
        nama: nama ?? this.nama,
        nis: nis ?? this.nis,
        jk: jk ?? this.jk,
        kelas: kelas ?? this.kelas,
      );

  @override
  List<Object> get props => [id, idLevel, jk, kelas, nama, nis];
}

User mockUser = User(
    id: 1,
    idLevel: 1,
    nama: 'Yan Eka Fajar R.',
    jk: 'L',
    kelas: 'X Multimeida',
    nis: '1234567890');
