import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:githubtoprepos/models/github_repository.dart';

class GithubApi {
  final String _urlEndpoint = 'https://github-trending-api.now.sh/';

  Future<List<GithubRepository>> getTrendingRepositories() async {
    final Response response = await get(_urlEndpoint);
    if(response.statusCode == HttpStatus.ok) {
      return (json.decode(response.body) as List).map((i) =>
          GithubRepository.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}