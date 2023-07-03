import 'dart:convert';

import 'package:alquran/app/data/models/detail_surah.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.quran.gading.dev/surah");
  var res = await http.get(url);

  var data = (json.decode(res.body) as Map<String, dynamic>)["data"];

  //1-114 -> index ke 113 = annas

  // data dari api (raw data) -> Model (yang sudah disiapkan)
  Surah surahAnnas = Surah.fromJson(data[113]);
  // print(surahAnnas.toJson());

  // INI COBA MASUK KE NESTED MODEL
  // print(surahAnnas.name?.long);
  Uri urlAnnas =
      Uri.parse("https://api.quran.gading.dev/surah/${surahAnnas.number}");
  var resAnnas = await http.get(urlAnnas);

  Map<String, dynamic> dataAnnas =
      (json.decode(resAnnas.body) as Map<String, dynamic>)["data"];
  // print(resAnnas.body);
  DetailSurah annas = DetailSurah.fromJson(dataAnnas);
  print(annas.verses![4].text!.arab);
}
