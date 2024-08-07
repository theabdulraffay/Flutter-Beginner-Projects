import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey =
    'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum%2Clitecoin&vs_currencies=';

class Networking {
  String currency;
  Networking(this.currency);

  dynamic getData() async {
    http.Response response = await http.get(
      Uri.parse('$apiKey$currency'),
    );

    if (response.statusCode == 200) {
      // print(response.body);
      return jsonDecode(response.body);
    }
  }
}
