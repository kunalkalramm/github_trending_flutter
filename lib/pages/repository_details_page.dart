import 'package:flutter/material.dart';
import 'package:githubtoprepos/customWidgets/repo_details_field.dart';

class GithubRepositoryDetails extends StatefulWidget {
  final String repoName;
  final String avatarUrl;
  final String authorName;
  final String description;
  final String language;
  final String languageColor;
  final int forks;
  final int stars;

  GithubRepositoryDetails(
      {this.repoName,
      this.avatarUrl,
      this.authorName,
      this.description,
      this.language,
      this.languageColor,
      this.forks,
      this.stars});

  @override
  _GithubRepositoryDetailsState createState() => _GithubRepositoryDetailsState(
      repoName: repoName,
      avatarUrl: avatarUrl,
      authorName: authorName,
      description: description,
      language: language,
      languageColor: languageColor,
      forks: forks,
      stars: stars);
}

class _GithubRepositoryDetailsState extends State<GithubRepositoryDetails> {
  final String repoName;
  final String avatarUrl;
  final String authorName;
  final String description;
  final String language;
  final String languageColor;
  final int forks;
  final int stars;

  _GithubRepositoryDetailsState(
      {this.repoName,
      this.avatarUrl,
      this.authorName,
      this.description,
      this.language,
      this.languageColor,
      this.forks,
      this.stars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  elevation: 0.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Repository Description",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          letterSpacing: 2.0),
                    ),
                    background: Image.network(
                      avatarUrl,
                      fit: BoxFit.none,
                    ),
                  ),
                )
              ];
            },
            body: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RepositoryDetailsField(
                      label: "Repository Name", value: repoName),
                  RepositoryDetailsField(label: "Author", value: authorName),
                  RepositoryDetailsField(label: "Language", value: language),
                  RepositoryDetailsField(
                      label: "Description", value: description),
                  Row()
                ],
              ),
            )),
      ),
    );
  }
}
