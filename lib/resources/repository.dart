import 'package:githubtoprepos/models/github_repository.dart';
import 'package:githubtoprepos/resources/github_api.dart';

class Repository {
  final githubApi = GithubApi();

  Future<List<GithubRepository>> fetchTrendingRepositories() {
    return githubApi.getTrendingRepositories();
  }
}