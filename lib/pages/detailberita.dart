import 'package:flutter/material.dart';
import 'package:responsi_app/models/list_news_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class DetailBerita extends StatelessWidget {
  final Posts posts;
  const DetailBerita({Key? key, required this.posts}): super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime timeParse = DateTime.parse('${posts.pubDate}');
    String dateTime = DateFormat.yMMMMEEEEd().format(timeParse);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("News Detail"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "${posts.title!}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Text("$dateTime")),
            SizedBox(height: 10),
            Image.network("${posts.thumbnail!}"),
            SizedBox(height: 20),
            Text(
              "${posts.description!}",
              textAlign: TextAlign.justify,
            ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Future<void> _launch(Uri url) async {
    String concatenate = url.origin + url.path;
    Uri finalURL = Uri.parse(concatenate);
    try {
      if (await canLaunchUrl(finalURL)) {
        await launchUrl(finalURL);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      if (kDebugMode) {
        print("error");
      }
    }
  }
}