import 'package:basketia/features/scores/view/layout/score_screen.dart';
import 'package:basketia/features/scores/model/score/score.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'connection.dart';

final scoreProvider = FutureProvider.autoDispose<List<Score>>((ref) async {
  var params = {
    'gameDate': DateFormat('yyyyMMdd').format(ref.watch(dateProvider)),
    'topPerformers': 'true',
    'lineups': 'true',
  };

  final response = await GetIt.I<Dio>().get<Map<String, dynamic>>(
    '$baseUrl/getNBAScoresOnly',
    queryParameters: params,
    options: Options(
      headers: headers,
    ),
  );

  if (response.statusCode == 200) {
    final data = response.data;
    if (data != null && data.containsKey('body')) {
      final gamesData = data['body'] as Map<String, dynamic>;
      List<Score> games = gamesData.entries.map((e) {
        return Score.fromJson(e.value);
      }).toList();
      return games;
    }
  }
  throw Exception('Failed to load matches');
});
