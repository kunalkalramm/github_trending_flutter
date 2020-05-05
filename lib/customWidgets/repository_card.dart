import 'package:flutter/material.dart';
import 'package:githubtoprepos/models/github_repository.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';


class RepositoryCard extends StatelessWidget {
  final GithubRepository repoData;

  RepositoryCard({this.repoData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
      child: Card(
        child: ListTile(
          onTap: () {
            _launchUrl(context, repoData.repoUrl);
          },
          title: Text(repoData.repoName),
          subtitle: Text(repoData.author),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(repoData.avatarUrl),
          ),
        ),
      ),
    );
  }

  void _launchUrl(BuildContext context, String url) async {
    try {
      print(url);
      await launch(url, option: CustomTabsOption(
        toolbarColor: Theme.of(context).primaryColor,
        enableDefaultShare: true,
        enableUrlBarHiding: true,
        animation: CustomTabsAnimation.slideIn(),
        extraCustomTabs: <String> [
        'org.mozilla.firefox',
          'com.microsoft.emmx'
        ]
      ));
    } catch(e) {
      final snackbar = SnackBar(
        content: Text(e.toString()),
      );
      Scaffold.of(context).showSnackBar(snackbar);
      print(e.toString());
    }
  }
}

