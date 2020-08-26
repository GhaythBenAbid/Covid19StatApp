import 'package:http/http.dart';
import 'dart:convert';

Future test(e, country) async {
  Response response = await get("https://corona.lmao.ninja/v2/countries/$country");

  String x = jsonDecode(response.body).toString();
  //String h =x.substring(x.indexOf('China'),x.indexOf('China')+250);

  String all = x.substring(x.indexOf('cases'));
  print(all);
  int i = 0;
  var corona = new List(7);

  for (i = 0; i < 7; i++) {
    corona[i] = all.substring(all.indexOf(' ') + 1, all.indexOf(','));
    all = all.substring(all.indexOf(',') + 2);
  }

  return corona[e];
}
