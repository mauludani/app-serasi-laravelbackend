// part of 'services.dart';

// class AbsensiServices {
//   static Future<ApiReturnValue<List<Absensi>>> getAbsensi(
//       {http.Client client}) async {
//     client ??= http.Client();
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     var nis = sp.getString('nis') ?? '';
//     var url = Uri.parse(baseURL + 'absensi?nis=' + nis);

//     var response = await client.get(url);

//     if (response.statusCode != 200) {
//       return ApiReturnValue(message: 'Periksa NIS dan Password kembali!');
//     }

//     var data = jsonDecode(response.body);
//     List<Absensi> absensis = (data['data']['absensi'] as Iterable)
//         .map((e) => Absensi.fromJson(e))
//         .toList();

//     return ApiReturnValue(value: absensis);
//   }
// }
