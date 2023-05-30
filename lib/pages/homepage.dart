import 'package:flutter/material.dart';
import 'package:responsi_app/pages/listberita.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListBerita(
                            category: "terbaru",
                          ),
                        ));
                  },
                  style: ElevatedButton.styleFrom(Colors.green),
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    child: Text("TERBARU"),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListBerita(
                            category: "daerah",
                          ),
                        ));
                  },
                  style: ElevatedButton.styleFrom((Colors.green)),
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    child: Text("DAERAH"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListBerita(
                            category: "internasional",
                          ),
                        ));
                  },
                  style: ElevatedButton.styleFrom((Colors.green)),
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    child: Text("INTERNASIONAL"),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListBerita(
                            category: "islam",
                          ),
                        ));
                  },
                  style: ElevatedButton.styleFrom((Colors.green)),
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    child: Text("ISLAM"),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
