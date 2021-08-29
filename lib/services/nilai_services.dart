part of 'services.dart';

class NilaiServices {
  static Future<ApiReturnValue<Nilai>> getNilai({http.Client client}) async {
    client ??= http.Client();
    final SharedPreferences sp = await SharedPreferences.getInstance();
    var nis = sp.getString('nis');
    var url = Uri.parse(baseURL + 'nilai?nis=' + nis);

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    Nilai nilais = Nilai.fromJson(data['data']['nilai']);
    return ApiReturnValue(value: nilais);
  }
}
