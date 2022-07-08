import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TableScreen extends StatefulWidget {
  final int number;

  const TableScreen({Key? key, required this.number}) : super(key: key);

  @override
  State<TableScreen> createState() => _TableScreenState(this.number);
}

class _TableScreenState extends State<TableScreen> {

  int number;
  _TableScreenState(this.number);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // table();
    setState(() {
      // j++;
      i = number;
    });

    var element = list[random.nextInt(list.length)];
    print("element" + element);
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    generateRandom();

    // _controllerCenter.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerCenter.dispose();
  }

  var list = ['1', '2', '3', '4', '5'];


  late ConfettiController _controllerCenter;

  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  int i = 2;
  Color bottomColor = Colors.red;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomCenter;
  Alignment end = Alignment.topCenter;
  int tab = 0;
  int j = 2;
  Random random = new Random();
  var randomlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /* AnimatedContainer(
                duration: const Duration(seconds: 2),
                onEnd: () {
                  setState(() {
                    index = index + 1;
                    // animate the color
                    bottomColor = colorList[index % colorList.length];
                    topColor = colorList[(index + 1) % colorList.length];
                  });
                },
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: begin,
                        end: end,
                        colors: [bottomColor, topColor]))),*/
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(begin: end, end: begin, colors: [
                      Color(0xff0044f3),
                      Color(0xff1024EE),
                      Color(0xffc38862),
                      Color(0xfffbd5b8),
                    ]))),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))
                    ],
                  ),
                ),
                Expanded(
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        // maxCrossAxisExtent: 75,
                        crossAxisCount: 5,
                        // childAspectRatio: 3 / 2,
                        // crossAxisSpacing: 20,
                        // mainAxisSpacing: 1
                      ),
                      itemCount: randomlist.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Center(
                          child: GestureDetector(
                            onTap: () {
                              if (randomlist[index].toString() ==
                                  tab.toString()) {
                                _controllerCenter.play();
                                showAlert(
                                    context, true, randomlist[index].toString());
                              } else {
                                // _controllerCenter.stop();
                                showAlert(
                                    context, false, randomlist[index].toString());
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Transform.rotate(
                                angle: random.nextInt(100).toDouble(),
                                child: Text(
                                  randomlist[index].toString(),
                                  // random.nextInt(20).toString(),
                                  // from 0 upto 99 included,
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: randomlist[index].toString() ==
                                          tab.toString()
                                          ? Colors.grey[600]
                                          : Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),

                  /*   ListView.builder(
                      itemCount: randomlist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Transform.rotate(
                          angle: 30.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                randomlist[index].toString(),
                                // random.nextInt(20).toString(),
                                // from 0 upto 99 included,
                                style: TextStyle(
                                    fontSize: 40,
                                    color: randomlist[index].toString() ==
                                            tab.toString()
                                        ? Colors.red
                                        : Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      }),*/
                ),
                /*SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ListView.builder(
                      itemCount: randomlist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Transform.rotate(
                          angle: random.nextInt(100).toDouble(),
                          child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                randomlist[index].toString(),
                                // random.nextInt(20).toString(),
                                // from 0 upto 99 included,
                                style: TextStyle(
                                    fontSize: 40,
                                    color: randomlist[index].toString() ==
                                            tab.toString()
                                        ? Colors.red
                                        : Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      }),
                ),*/
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color(0xfffbddc6),
                      boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 5.0,spreadRadius: 4.0,offset: Offset(5.0,5.0))],
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  height: 75,
                  width: double.infinity,
                  // alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            i.toString(),
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'X',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            j.toString() + '=',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '?',
                            // tab.toString(),
                            style: const TextStyle(
                                fontSize: 40,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                // i++;
                                j++;
                              });
                              generateRandom();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 75,
                              width: 75,
                              child: Center(
                                  child: Text(
                                    'Next',
                                    style:
                                    TextStyle(fontSize: 22, color: Colors.white),
                                  )),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality.explosive,
              // don't specify a direction, blast randomly
              shouldLoop: true,
              // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
              // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void generateRandom() {

    randomlist.clear();
    if (tab == i * 10) {
      // print('generateRandom');
    } else {
      // print(''+tab.toString());

      setState(() {
        // j++;
        tab = i * j;
      });

      for (int i = 2; i < 33; i++) {
        var j = 2;
        var k = i * j;
        setState(() {
          j++;
          randomlist.add(k);
          randomlist.shuffle();

        });
        Timer.periodic(Duration(seconds: 10), (timer) {
          //code to run on every 5 seconds
          setState(() {
            // j++;
            randomlist.shuffle();
          });
        });
      }
    }
  }

  void showAlert(BuildContext context, bool b, String s) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
            content: SizedBox(
              height: 90,
              child: Column(
                children: [
                  Text(
                    i.toString() + 'X' + j.toString() + '=',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(b ? 'Yay! $tab is correct' : '$s is not correct',
                      style: TextStyle(fontSize: 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok')),
                      TextButton(onPressed: () {}, child: Text('Next')),
                    ],
                  ),
                ],
              ),
            )));
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
}
