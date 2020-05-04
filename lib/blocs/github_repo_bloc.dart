import 'package:githubtoprepos/resources/repository.dart';
import 'package:githubtoprepos/models/github_repository.dart';
import 'package:rxdart/rxdart.dart';

class GithubRepositoryBloc {
  final _repository = Repository();
  final _githubRepositorySource = PublishSubject<List<GithubRepository>>();
  Stream<List<GithubRepository>> get githubRepositories => _githubRepositorySource.stream;

  fetchAllRepositories() async {
     List<GithubRepository> repositories = await _repository.fetchTrendingRepositories();
    _githubRepositorySource.sink.add(repositories);
  }

  dispose() {
    _githubRepositorySource.close();
  }
}

final bloc = GithubRepositoryBloc();