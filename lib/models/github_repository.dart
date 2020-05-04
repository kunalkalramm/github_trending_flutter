class GithubRepository {
  String _author;
  String _repoName;
  String _repoUrl;
  String _avatarUrl;
  String _description;
  String _language;
  String _languageColor;
  int _stars;
  int _forks;

  GithubRepository.fromJson(Map<String, dynamic> parsedJson) {
    _author = parsedJson['author'];
    _repoName = parsedJson['name'];
    _avatarUrl = parsedJson['avatar'];
    _repoUrl = parsedJson['url'];
    _description = parsedJson['description'];
    _language = parsedJson['language'];
    _languageColor = parsedJson['languageColor'];
    _stars = parsedJson['stars'];
    _forks = parsedJson['forks'];
  }

  int get forks => _forks;

  int get stars => _stars;

  String get languageColor => _languageColor;

  String get language => _language;

  String get description => _description;

  String get avatarUrl => _avatarUrl;

  String get repoUrl => _repoUrl;

  String get repoName => _repoName;

  String get author => _author;

}