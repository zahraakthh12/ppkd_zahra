import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ppkd_zahra/Tugas14Flutter/models/hp_models.dart';

Future<List<CharacterModel>> getCharactersByHouse(String houseName) async {
  final response = await http.get(
    Uri.parse("https://hp-api.onrender.com/api/characters"),
  );

  if (response.statusCode == 200) {
    final List<dynamic> charJson = json.decode(response.body);

    // Filter berdasarkan house yang dipilih (case-insensitive)
    final filtered = charJson
        .map((json) => CharacterModel.fromJson(json))
        .where((char) =>
            (char.house ?? '').toLowerCase() == houseName.toLowerCase())
        .toList();

    return filtered;
  } else {
    throw Exception('Failed to load characters. Status code: ${response.statusCode}');
  }
}
