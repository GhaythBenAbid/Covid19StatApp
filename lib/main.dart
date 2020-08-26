import 'package:flutter/material.dart';
import 'package:corona/services/corona.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String cases = '0';
  String todayCases = '0';
  String deaths = '0';
  String recovered = '0';
  String active = '0';
  String country = 'Tunisia';

  Future<dynamic> work(x) async {
    var cases0 = await test(0, x);
    var todaycases0 = await test(1, x);
    var deaths0 = await test(2, x);
    var recovered0 = await test(4, x);
    var active0 = await test(5, x);
    setState(() {
      country = x;
      cases = cases0;
      todayCases = todaycases0;
      deaths = deaths0;
      recovered = recovered0;
      active = active0;
    });
  }

  @override
  void initState() {
    super.initState();
    work('Tunisia');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6441a5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 60),
              TextField(
                onSubmitted: (String countryx) {
                  setState(() {
                    work(countryx);
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Country...'),
                style: TextStyle(
                  fontFamily: 'Roobert',
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Cases :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Roobert',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  "$cases",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Roobert',
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "TodayCases :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Roobert',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  "$todayCases",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Roobert',
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Deaths :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Roobert',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  "$deaths",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Roobert',
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Recovered :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Roobert',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  "$recovered",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Roobert',
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Active :",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Roobert',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  "$active",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Roobert',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
