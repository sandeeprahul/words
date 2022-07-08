import 'package:flutter/material.dart';
import 'package:words/TableScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xFF3F42EB),
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF3F42EB),
                      Color(0xFF6567ef),
                      Color(0xFFb2b3f7),
                    ]),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      '1 to 30 Tables ',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          // maxCrossAxisExtent: 75,
                          crossAxisCount: 4,
                          // childAspectRatio: 3 / 2,
                          // crossAxisSpacing: 20,
                          // mainAxisSpacing: 1
                        ),
                        itemCount: 30,
                        itemBuilder: (BuildContext ctx, index) {
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (BuildContext context ) {
                                  return TableScreen(number:index+1);
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  '' + (index + 1).toString(),
                                  // random.nextInt(20).toString(),
                                  // from 0 upto 99 included,
                                  style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              )),
        ),
      );
  }
}
