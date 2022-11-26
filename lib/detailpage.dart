import 'package:flutter/material.dart';

class Detail_page extends StatefulWidget {
  const Detail_page({Key? key}) : super(key: key);

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page>
    with TickerProviderStateMixin {
  late AnimationController rotationcontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rotationcontroller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 4000,
      ),
    )..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    rotationcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("${res["name"]}"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/imags/Space.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.8),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RotationTransition(
                  turns: rotationcontroller,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("${res["image"]}"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          opacity: 0.7,
                          image: AssetImage("assets/imags/imageb.jpg")),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "${res["des"]}",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
