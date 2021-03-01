import 'dart:async';
import 'dart:collection';
import 'dart:io';

import 'package:corona_syria/Data.dart';
import 'package:corona_syria/Map.dart';
import 'package:corona_syria/states.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Charts.dart';

void main() {
  runApp(MyApp());
}

// 0993643049
class splach extends StatefulWidget {
  @override
  _splachState createState() => _splachState();
}

class _splachState extends State<splach> {
  spl() async {
    Timer(
        Duration(milliseconds: 2000),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Screen())));
  }

  @override
  void initState() {
    spl();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          color: Colors.deepPurple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Corona Syria",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Anto',
                    decoration: TextDecoration.none,
                    fontSize: 40,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(6.0, 6.0),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(10),
                  child:
                      Image(width: 130, image: AssetImage('Images/icon.png'))),
            ],
          ),
        ));
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.deepPurple,
      systemNavigationBarIconBrightness: Brightness.light,
      // systemNavigationBarDividerColor: Color(0xFFe4cd41),
      statusBarColor: Colors.deepPurple,
    ));
    return Directionality(
        textDirection: TextDirection.rtl,
        child: MaterialApp(
          builder: DevicePreview.appBuilder,
          title: "CoronaSyria",
          debugShowCheckedModeBanner: false,
          // debugShowMaterialGrid: true,
          home: splach(),
        ));
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Data d;

  Future GETDATA() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      //
      var url = "http://www.coronasyria.tk/APISy.php";
      var res = await http.get(url);
      var resbody = jsonDecode(res.body);
      preferences.setString("oldCharts", res.body);
      return resbody;
    } on TimeoutException catch (e) {
      String tempRes = preferences.getString("oldCharts");
      if (tempRes != null) {
        var r = jsonDecode(tempRes);
        print(r.toString());
        return r;
      }
    } on SocketException catch (e) {
      String tempRes = preferences.getString("oldCharts");
      if (tempRes != null) {
        var r = jsonDecode(tempRes);
        print(r.toString());
        return r;
      }
    }
  }

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    setState(() {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFFFFFFF),
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Color(0xFFe4cd41),
        statusBarColor: Colors.deepPurple,
      ));
    });
    super.initState();
    firebaseCloudMessaging_Listeners();
  }

  void firebaseCloudMessaging_Listeners() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String t = preferences.getString("token");
    print("tttttttttttttttttt : " + t.toString());
    if (t == null) {
      _firebaseMessaging.getToken().then((token) async {
        print("this is my token : " + token);

        var res = await http.post("http://www.coronasyria.tk/newToken.php",
            body: {"token": token, "password": "CSyT"});
        print(res.body.toString());
        if (res.body.toString() == "suc") {
          print("sucssece ssssssssssssssssssssssssssssss");
          preferences.setString("token", token);
        }
      });
    } else {
      print("in my shared found token : " + t.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var qwidth = MediaQuery.of(context).size.width;
    var qheight = MediaQuery.of(context).size.height;
    print("widdddddddth : " + qwidth.toString());
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        toolbarHeight: 20,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        // shadowColor: Colors.deepPurple,
        centerTitle: true,
      ), //
      body: FutureBuilder(
        future: GETDATA(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            d = new Data(
                snapshot.data['New_Infection'].toString(),
                snapshot.data['New_Healing'].toString(),
                snapshot.data['New_Death'].toString(),
                snapshot.data['All_Infection'].toString(),
                snapshot.data['All_Healing'].toString(),
                snapshot.data['All_Death'].toString(),
                snapshot.data['Damascuse'].toString(),
                snapshot.data['NDamascuse'].toString(),
                snapshot.data['RefD'].toString(),
                snapshot.data['NRefD'].toString(),
                snapshot.data['Halab'].toString(),
                snapshot.data['NHalab'].toString(),
                snapshot.data['Hama'].toString(),
                snapshot.data['NHama'].toString(),
                snapshot.data['Homs'].toString(),
                snapshot.data['NHoms'].toString(),
                snapshot.data['Latakia'].toString(),
                snapshot.data['NLatakia'].toString(),
                snapshot.data['Tartous'].toString(),
                snapshot.data['NTartous'].toString(),
                snapshot.data['Der'].toString(),
                snapshot.data['NDer'].toString(),
                snapshot.data['Raqa'].toString(),
                snapshot.data['NRaqa'].toString(),
                snapshot.data['Haska'].toString(),
                snapshot.data['NHaska'].toString(),
                snapshot.data['Daraa'].toString(),
                snapshot.data['NDaraa'].toString(),
                snapshot.data['Edlib'].toString(),
                snapshot.data['NEdlib'].toString(),
                snapshot.data['Sweda'].toString(),
                snapshot.data['NSweda'].toString(),
                snapshot.data['Qunetra'].toString(),
                snapshot.data['NQunetra'].toString(),
                snapshot.data['lastModified'].toString(),
                snapshot.data['tz_Infection'].toString(),
                snapshot.data['tz_Healing'].toString(),
                snapshot.data['tz_Death'].toString(),
                snapshot.data['Infection'],
                snapshot.data['Healing'],
                snapshot.data['Death']);
            return ListView(
              children: [
                Container(
                  width: double.infinity,
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? qheight * 0.1
                          : qheight * 0.2,
                  color: Colors.deepPurple,
                  child: Center(
                    child: Text(
                      "Corona Syria",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Anto',
                        fontSize: (qwidth * 30) / 395,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black,
                            offset: Offset(6.0, 6.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                States(d),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 20),
                  // color: Colors.red,
                  child: Center(
                    child: Text(
                      "مخطط حالات الاصابة",
                      style: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.orange,
                              offset: Offset(3.0, 3.0),
                            ),
                          ],
                          fontFamily: 'Qu',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: (qwidth * 18) / 392.72),
                    ),
                  ),
                ), // مخطط حالات الاصابة
                Container(
                  margin: EdgeInsets.all(20),
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.orange,
                  ),
                  child: Charts(d.Infection, "الإصابة"),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 5),
                  // color: Colors.red,
                  child: Center(
                    child: Text(
                      "مخطط حالات الشفاء",
                      style: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.green,
                              offset: Offset(3.0, 3.0),
                            ),
                          ],
                          fontFamily: 'Qu',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: (qwidth * 18) / 392.72),
                    ),
                  ),
                ), // مخطط حالات الشفاء
                Container(
                  margin: EdgeInsets.all(20),
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.green,
                  ),
                  child: Charts(d.Healing, "الشفاء"),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 5),
                  // color: Colors.red,
                  child: Center(
                    child: Text(
                      "مخطط حالات الوفاة",
                      style: TextStyle(
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.red,
                              offset: Offset(3.0, 3.0),
                            ),
                          ],
                          fontFamily: 'Qu',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: (qwidth * 18) / 392.72),
                    ),
                  ),
                ), // مخطط حالات الوفاة
                Container(
                  margin: EdgeInsets.all(20),
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.red,
                  ),
                  child: Charts(d.Death, "الوفاة"),
                ),
                Map(d),
                // توزع الاصابات على الخريطة
                InkWell(
                  child: Container(
                    height: 50,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            " Programmed by ",
                            style: TextStyle(
                                fontSize: (qwidth * 15) / 392.72,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Mohamad AboAzan",
                            style: TextStyle(
                                fontSize: (qwidth * 13) / 392.72,
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " © 2021 ",
                            style: TextStyle(
                                fontSize: (qwidth * 15) / 392.72,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  onTap: () {
                    launch('https://www.facebook.com/mohamad.aboazan.12');
                  },
                ),
              ],
            );
          }
          return Center(
              child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                      strokeWidth: 9,
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Colors.deepPurple))));
        },
      ),
    );
  }
}
