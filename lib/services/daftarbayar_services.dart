part of 'services.dart';

Future<List> fetchDaftarBayar() async {
  final SharedPreferences sp = await SharedPreferences.getInstance();
  var nis = sp.getString('nis') ?? '';
  var url = Uri.parse(baseURL + 'daftarbayar?nis=' + nis);
  final response = await http.get(url, headers: {"Accept": "application/json"});

  var data = jsonDecode(response.body);
  return data;
}

Future<List> fetchDaftarTagihan() async {
  final SharedPreferences sp = await SharedPreferences.getInstance();
  var nis = sp.getString('nis') ?? '';
  var url = Uri.parse(baseURL + 'daftartagihan?nis=' + nis);
  final response = await http.get(url, headers: {"Accept": "application/json"});

  var data = jsonDecode(response.body);
  return data;
}
