import 'package:flutter/material.dart';
import 'package:responsi_app/services/base_network.dart';
import 'package:responsi_app/models/list_news_model.dart';
import 'package:responsi_app/pages/detailberita.dart';


class ListBerita extends StatelessWidget {
  final String? kat;
  const ListBerita({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String kategori = "$kat";
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            'REPUBLIKA ' + kat.toUpperCase(),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder(
                future: BaseNetwork.get("$kat"),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    ListNewsModel listNewsModel =
                    ListNewsModel.fromJson(snapshot.data);
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0;
                          i < listNewsModel.data!.posts!.length;
                          i++)
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailBerita(
                                        posts: listNewsModel.data!.posts![i]),
                                  ),
                                );
                              },
                              child: Card(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "${listNewsModel.data!.posts![i].title}",
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width / 3,
                                      child: Image.network(
                                          "${listNewsModel.data!.posts![i].thumbnail}"),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    );
                  }
                },
              ),
            )));
  }
}
