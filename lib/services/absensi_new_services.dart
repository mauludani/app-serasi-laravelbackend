part of 'services.dart';

Future<List> fetchAbsensi() async {
  final SharedPreferences sp = await SharedPreferences.getInstance();
  var nis = sp.getString('nis') ?? '';
  var url = Uri.parse(baseURL + 'absensi?nis=' + nis);
  final response = await http.get(url, headers: {"Accept": "application/json"});

  var data = jsonDecode(response.body);
  return data;
}
