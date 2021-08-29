part of 'services.dart';

class UserServices extends ChangeNotifier {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    log(email + password);
    String url = baseURL + 'login';
    var uri = Uri.parse(url);
    var response = await client.post(uri,
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    final SharedPreferences sp = await SharedPreferences.getInstance();

    await sp.setString('name', value.nama);
    await sp.setString('nis', value.nis);
    await sp.setString('pass', password);
    await sp.setString('token', User.token);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> updateDeviceId(String email, String id,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    print(id);
    String url = baseURL + 'updatedevice';
    var uri = Uri.parse(url);
    var response = await client.post(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{'email': email, 'device': id}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = "success";

    return ApiReturnValue(message: data);
  }
}
