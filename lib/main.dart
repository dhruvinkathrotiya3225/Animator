import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation sizeanimation;
  late Animation iconsizeanimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 4000))
          ..forward();
    sizeanimation = Tween<double>(begin: 50, end: 150).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0, 0.5)));
    iconsizeanimation = Tween<double>(begin: 50, end: 100).animate(
        CurvedAnimation(parent: animationController, curve: Interval(0.5, 1)));
  }

  double ValueOfSlider = 50;
  double weight = 60;
  double age = 28;
  bool firstcolor = false;
  bool secoundcolor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Color(0xff090e21),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff090e21),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            AnimatedBuilder(
                animation: animationController,
                builder: (context, _) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          AnimatedBuilder(
                              animation: animationController,
                              builder: (context, _) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      firstcolor = true;
                                      secoundcolor = false;
                                    });
                                  },
                                  child: Ink(
                                    child: Container(
                                      height: sizeanimation.value,
                                      width: sizeanimation.value,
                                      decoration: BoxDecoration(
                                        color: (firstcolor == true)
                                            ? Color(0xff3b3c4d)
                                            : Color(0xff1d1e33),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            child: (animationController
                                                    .isCompleted)
                                                ? Column(
                                                    children: [
                                                      Icon(
                                                        Icons.female_outlined,
                                                        color: (firstcolor ==
                                                                true)
                                                            ? Color(0xffeb1555)
                                                            : Colors.white,
                                                        size: iconsizeanimation
                                                            .value,
                                                      ),
                                                      Text(
                                                        "Female",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: (firstcolor ==
                                                                  true)
                                                              ? Color(
                                                                  0xffeb1555)
                                                              : Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(width: 20),
                          InkWell(
                            onTap: () {
                              setState(() {
                                secoundcolor = true;
                                firstcolor = false;
                              });
                            },
                            child: Ink(
                              child: Container(
                                  height: sizeanimation.value,
                                  width: sizeanimation.value,
                                  decoration: BoxDecoration(
                                    color: (secoundcolor == true)
                                        ? const Color(0xff3b3c4d)
                                        : const Color(0xff1d1e33),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: (animationController.isCompleted)
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.male_outlined,
                                              size: 100,
                                              color: (secoundcolor == true)
                                                  ? Color(0xffeb1555)
                                                  : Colors.white,
                                            ),
                                            Text(
                                              "Male",
                                              style: TextStyle(
                                                  color: (secoundcolor == true)
                                                      ? Color(0xffeb1555)
                                                      : Colors.white,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        )
                                      : Container()),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TweenAnimationBuilder(
                              tween: Tween<Offset>(
                                begin: Offset(0, 800),
                                end: Offset(0, 20),
                              ),
                              duration: Duration(milliseconds: 4000),
                              builder: (context, Offset position, _) {
                                return Transform.translate(
                                  offset: position,
                                  child: Container(
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff1d1e33),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "HEIGHT",
                                          style: TextStyle(
                                            color: Color(0xff626473),
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    "${ValueOfSlider.toInt()}",
                                                style: const TextStyle(
                                                    fontSize: 60),
                                              ),
                                              const TextSpan(
                                                text: "cm",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xff626473)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Slider(
                                          min: 50,
                                          max: 250,
                                          value: ValueOfSlider,
                                          label: "${ValueOfSlider.toInt()}",
                                          divisions: 100,
                                          activeColor: const Color(0xfff5c1d1),
                                          thumbColor: const Color(0xffeb1555),
                                          inactiveColor:
                                              const Color(0xff555555),
                                          onChanged: (val) {
                                            setState(() {
                                              ValueOfSlider = val;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TweenAnimationBuilder(
                              tween: Tween<double>(begin: 0, end: 1),
                              duration: Duration(milliseconds: 4000),
                              builder: (context, double value, _) {
                                return TweenAnimationBuilder(
                                  tween: Tween<Offset>(
                                      begin: Offset(0, 0), end: Offset(0, 0)),
                                  duration: Duration(milliseconds: 4000),
                                  builder: (context, Offset pos, _) {
                                    return Transform.translate(
                                      offset: pos,
                                      child: Transform.scale(
                                        scale: value,
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 170,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff1d1e33),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text(
                                                    "Weight",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    "${weight.toInt()}",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 45),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            weight--;
                                                          });
                                                        },
                                                        child: Ink(
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 50,
                                                            width: 50,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0xff4c4f5e),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: const Text(
                                                              "-",
                                                              style: TextStyle(
                                                                  fontSize: 45,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            weight++;
                                                          });
                                                        },
                                                        child: Ink(
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 50,
                                                            width: 50,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0xff6e6e7a),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: const Text(
                                                              "+",
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 45,
                                                                color: Color(
                                                                    0xfff67fa4),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Column(
                                              children: [
                                                Container(
                                                  height: 170,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff1d1e33),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      const Text(
                                                        "Age",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        "$age",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 45),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                age--;
                                                              });
                                                            },
                                                            child: Ink(
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                // padding: EdgeInsets.all(20),
                                                                height: 50,
                                                                width: 50,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xff4c4f5e),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    const Text(
                                                                  "-",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          45,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                age++;
                                                              });
                                                            },
                                                            child: Ink(
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                // padding: EdgeInsets.all(20),
                                                                height: 50,
                                                                width: 50,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xff6e6e7a),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    const Text(
                                                                  "+",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        45,
                                                                    color: Color(
                                                                        0xfff67fa4),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }),
                        ],
                      ),
                      SizedBox(height: 20),
                      TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0, end: 1),
                          duration: Duration(milliseconds: 4000),
                          builder: (context, double value, _) {
                            return Transform.scale(
                              scale: value,
                              child: InkWell(
                                onTap: () {},
                                child: Ink(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 80,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffeb1555),
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: const Text(
                                      "Calculate",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 45),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          })
                    ],
                  );
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
