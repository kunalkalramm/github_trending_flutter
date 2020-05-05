import 'package:flutter/material.dart';
import 'package:githubtoprepos/pages/repository_details_page.dart';
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
            _launchDetailsPage(repoData, context);
          },
          title: Text(repoData.repoName),
          subtitle: Text(repoData.author),
          leading: GestureDetector(
            onTap: () {
              _launchUrl(context, repoData.repoUrl);
            },
            child: CircleAvatar(
              backgroundImage: NetworkImage(repoData.avatarUrl),
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.star, size: 16.0),
                  Text(repoData.stars.toString())
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.flash_off, size: 16.0),
                  Text(repoData.forks.toString())
                ],
              )
            ],
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

  void _launchDetailsPage(GithubRepository data, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
       return GithubRepositoryDetails(
         repoName: data.repoName,
         avatarUrl: data.avatarUrl,
         authorName: data.author,
         description: data.description,
         languageColor: data.languageColor,
         language: data.language,
         forks: data.forks,
         stars: data.stars
       );
      }
    ));
  }
}

