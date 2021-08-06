import 'package:apiproject/Services/anime.dart';
import 'package:apiproject/Services/apiproject.dart';
import 'package:apiproject/widgets/anime-card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Anime> _animemodel;
  @override
  void initState() {
    _animemodel = AnimeApi.fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animes List"),
      ),
      body: Container(
        child: FutureBuilder<Anime>(
            future: _animemodel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.data.documents.length,
                  itemBuilder: (context, index) {
                    var animedata = snapshot.data.data;
                    return AnimeCard(
                      scores: animedata.documents[index].score.toString(),
                      animename: animedata.documents[index].titles.en,
                      thumnailurl: animedata.documents[index].bannerImage,
                      episodes:
                          animedata.documents[index].episodesCount.toString(),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
