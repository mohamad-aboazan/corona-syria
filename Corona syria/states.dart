import 'package:corona_syria/Data.dart';
import 'package:flutter/material.dart';

class States extends StatefulWidget {
  Data d;

  States(this.d);

  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {
  @override
  void initState() {
    super.initState();
    print("===========================================");
    print(widget.d.All_Death);
  }

  @override
  Widget build(BuildContext context) {
    final qWidth = MediaQuery.of(context).size.width;
    final qHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? qHeight * 0.65
          : (qHeight * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
        color: Colors.deepPurple,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                // color: Colors.red,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                          // height: 90,
                          child: Card(
                        elevation: 10,
                        shadowColor: Colors.red,
                        color: Colors.redAccent,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  var w = constraints.maxWidth;
                                  print(w.toString());
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10)),
                                      color: Colors.red,
                                    ),
                                    // padding: EdgeInsets.only(top: 35, bottom: 5),
                                    child: Center(
                                      child: Text(
                                        "حالات وفاة جديدة",
                                        style: TextStyle(
                                            fontFamily: 'Qu',
                                            color: Colors.white,
                                            fontSize: qWidth>330 ? (qWidth*13)/395 : (qWidth*9)/395,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),);
                                },

                              ),
                            ),
                            // Container(
                            //     // color: Colors.green,
                            //     padding: EdgeInsets.only(top: 10),
                            //     child: Center(
                            //       child: Text(
                            //         "+" + widget.d.New_Death,
                            //         style: TextStyle(
                            //             fontFamily: 'Qu',
                            //             color: Colors.white,
                            //             fontSize: (qWidth * 12) / 392.72,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //     )),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Container(
                                  child: Text(
                                    "+" + widget.d.New_Death,
                                    style: TextStyle(
                                        fontFamily: 'Qu',
                                        color: Colors.white,
                                        fontSize: (qWidth * 15) / 392.72,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    Expanded(
                      child: Container(
                          child: Card(
                        elevation: 10,
                        shadowColor: Colors.white,
                        color: Colors.green,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  var w = constraints.maxWidth;
                                  print(w.toString());
                                  print(qWidth);
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10)),
                                      color: Colors.lightGreen,
                                    ),
                                    // padding: EdgeInsets.only(top: 35, bottom: 5),
                                    child: Center(
                                      child: Text(
                                        "حالات شفاء جديدة",
                                        style: TextStyle(
                                            fontFamily: 'Qu',
                                            color: Colors.white,
                                            fontSize: qWidth>330 ? (qWidth*13)/395 : (qWidth*9)/395,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),);
                                },

                              ),
                            ),
                            // Container(
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.vertical(
                            //           bottom: Radius.circular(10)),
                            //       color: Colors.lightGreen,
                            //     ),
                            //     padding: EdgeInsets.only(top: 5, bottom: 5),
                            //     child: Center(
                            //       child: Text(
                            //         "حالات شفاء جديدة",
                            //         style: TextStyle(
                            //             fontFamily: 'Qu',
                            //             color: Colors.white,
                            //             fontSize: (qWidth * 12) / 392.72,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //     )),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Container(
                                  // color: Colors.white,
                                  color: Colors.green,
                                  // padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "+" + widget.d.New_Healing,
                                    style: TextStyle(
                                        fontFamily: 'Qu',
                                        color: Colors.white,
                                        fontSize: (qWidth * 15) / 392.72,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    Expanded(
                      child: Container(
                          child: Card(
                        elevation: 10,
                        shadowColor: Colors.white,
                        color: Colors.orange,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  var w = constraints.maxWidth;
                                  print(w.toString());
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10)),
                                      color: Colors.orangeAccent,
                                    ),
                                    // padding: EdgeInsets.only(top: 35, bottom: 5),
                                    child: Center(
                                      child: Text(
                                        "حالات إصابة جديدة",
                                        style: TextStyle(
                                            fontFamily: 'Qu',
                                            color: Colors.white,
                                            fontSize: qWidth>330 ? (qWidth*13)/395 : (qWidth*9)/395,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),);
                                },

                              ),
                            ),

                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Container(
                                  child: Text(
                                    "+" + widget.d.New_Infection,
                                    style: TextStyle(
                                        fontFamily: 'Qu',
                                        color: Colors.white,
                                        fontSize: (qWidth * 15) / 392.72,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                // color: Colors.red,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          child: Card(
                        elevation: 10,
                        shadowColor: Colors.white,
                        color: Colors.orange,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(10)),
                                    color: Colors.orangeAccent,
                                  ),
                                  // padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Center(
                                    child: Text(
                                      "حالات الإصابة الكلية",
                                      style: TextStyle(
                                          fontFamily: 'Qu',
                                          color: Colors.white,
                                          fontSize: qWidth>330 ? (qWidth*15)/395 : (qWidth*11)/395,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),),
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Container(
                                  child: Text(
                                    widget.d.All_Infection,
                                    style: TextStyle(
                                        fontFamily: 'Qu',
                                        color: Colors.white,
                                        fontSize: (qWidth * 15) / 392.72,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                // color: Colors.red,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          child: Card(
                        elevation: 10,
                        shadowColor: Colors.white,
                        color: Colors.red,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(10)),
                                  color: Colors.redAccent,
                                ),
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Center(
                                  child: Text(
                                    "حالات الوفاة الكلية",
                                    style: TextStyle(
                                        fontFamily: 'Qu',
                                        color: Colors.white,
                                        fontSize: qWidth>330 ? (qWidth*13)/395 : (qWidth*9)/395,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Expanded(
                              child: Center(
                                child: Container(
                                  child: Text(
                                    widget.d.All_Death,
                                    style: TextStyle(
                                        fontFamily: 'Qu',
                                        color: Colors.white,
                                        fontSize: (qWidth * 15) / 392.72,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    Expanded(
                      child: Container(
                          child: Card(
                        elevation: 10,
                        shadowColor: Colors.white,
                        color: Colors.green,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(10)),
                                  color: Colors.lightGreen,
                                ),
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Center(
                                  child: Text(
                                    "حالات الشفاء الكلية",
                                    style: TextStyle(
                                        fontFamily: 'Qu',
                                        color: Colors.white,
                                        fontSize: qWidth>330 ? (qWidth*13)/395 : (qWidth*9)/395,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Expanded(
                              child: Center(
                                child: Container(
                                  child: Text(
                                    widget.d.All_Healing,
                                    style: TextStyle(
                                        fontFamily: 'Qu',
                                        color: Colors.white,
                                        fontSize: (qWidth * 15) / 392.72,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  "آخر تحديث اليوم " + widget.d.lastModified + " مساءً",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Qu",
                    fontSize: (qWidth * 12) / 392.72,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(7.0, 7.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
