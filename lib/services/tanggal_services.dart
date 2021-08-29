part of 'services.dart';

Future<List> getSeminggu() async {
  int hariIni = DateTime.now().day.toInt();
  int kemarin1 = DateTime.now().day.toInt() - 1;
  int kemarin2 = DateTime.now().day.toInt() - 2;
  int kemarin3 = DateTime.now().day.toInt() - 3;
  int kemarin4 = DateTime.now().day.toInt() - 4;
  int kemarin5 = DateTime.now().day.toInt() - 5;
  int kemarin6 = DateTime.now().day.toInt() - 6;

  var data = [
    hariIni.toString(),
    kemarin1.toString(),
    kemarin2.toString(),
    kemarin3.toString(),
    kemarin4.toString(),
    kemarin5.toString(),
    kemarin6.toString(),
  ];
  return data;
}

class Seminggu extends Equatable {
  final int day1;

  Seminggu({this.day1});
  @override
  List<Object> get props => [day1];
}

List<Seminggu> mockSeminggu = [
  Seminggu(day1: DateTime.now().day.toInt()),
  Seminggu(day1: DateTime.now().day.toInt() - 1),
  Seminggu(day1: DateTime.now().day.toInt() - 2),
  Seminggu(day1: DateTime.now().day.toInt() - 3),
  Seminggu(day1: DateTime.now().day.toInt() - 4),
  Seminggu(day1: DateTime.now().day.toInt() - 5),
  Seminggu(day1: DateTime.now().day.toInt() - 6),
];
