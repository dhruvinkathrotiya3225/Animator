import 'package:flutter/material.dart';
import 'package:planet/detailpage.dart';

import 'Global.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        "detailpage": (context) => Detail_page(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galaxy Planets"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
          itemCount: Global.planetdeatil.length,
          itemBuilder: (context, i) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("detailpage",
                        arguments: Global.planetdeatil[i]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 260,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 3,
                              blurRadius: 6,
                            ),
                          ],
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(70),
                          color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 21,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("detailpage",
                          arguments: Global.planetdeatil[i]);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 90,
                      width: 317,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(70),
                              bottomRight: Radius.circular(70))),
                      child: Text(
                        "${Global.planetdeatil[i]["name"]}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "${Global.planetdeatil[i]["image"]}"))),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
