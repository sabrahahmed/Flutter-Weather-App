import 'package:http/http.dart' as http;
import 'dart:convert';

class Connection {
  Connection(this.url);

  final String url;

  Future getWeatherData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
