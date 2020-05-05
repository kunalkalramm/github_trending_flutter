import 'package:flutter/material.dart';
import 'package:githubtoprepos/blocs/github_repo_bloc.dart';
import 'package:githubtoprepos/models/github_repository.dart';
import 'package:githubtoprepos/values/strings/strings.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:githubtoprepos/customWidgets/repository_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    bloc.fetchAllRepositories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(ConstStrings.trendingRepos),
      ),
      body: StreamBuilder(
        stream: bloc.githubRepositories,
        builder: (BuildContext context, AsyncSnapshot<List<GithubRepository>> snapshot) {
          if(snapshot.hasData) {
            return buildList(snapshot);
          } else if(snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString()
              ),
            );
          } else {
            return Center(
              child: SpinKitDoubleBounce(
                color: Colors.black45,
                size: 50.0,
              ),
            );

          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  Widget buildList(AsyncSnapshot<List<GithubRepository>> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return RepositoryCard(repoData:snapshot.data[index]);
        }
    );
  }
}
