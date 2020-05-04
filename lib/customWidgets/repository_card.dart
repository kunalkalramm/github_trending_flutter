import 'package:flutter/material.dart';
import 'package:githubtoprepos/models/github_repository.dart';

class RepositoryCard extends StatelessWidget {

  final GithubRepository repoData;
  RepositoryCard({this.repoData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
      child: Card(
        child: ListTile(
          onTap: () {},
          title: Text(repoData.repoName),
          subtitle: Text(repoData.author),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(repoData.avatarUrl),
          ),
        ),
      ),
    );
  }
}

