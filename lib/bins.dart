import 'dart:async';
import 'package:flutter/material.dart';
import 'mapsgoogle.dart';

class bins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0), //evala const
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            //List<Column> messageWidgets = [];
            // for (var i = 0; i < 3; i++){

            const SizedBox(width: 10.0), //evala const
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "images/smartbin1.png",
                  //"https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  35.147375,
                  33.415861,
                  'SmartBin1'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: () {
        //toLocation(restaurantName);
        //_gotoLocation(lat, long);
        //gotolocation(lat, long);//other file - test
      },
      child: FittedBox(
        //eixe new ->to efuga // Container( child: FittedBox( htan etsi to efuga
        child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: const Color(0x802196F3),
            //evala const
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  //htan container kai to ekana sizedbox
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0), //efuga to new
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage(_image),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: myDetailsContainer1(restaurantName),
                ),
              ],
            )),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            //Container(child: Text(
            restaurantName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              //evala const
              color: Color(0xff6200ee),
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5.0), //evala const
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(),
          ],
        ),
        SizedBox(height: 5.0), //evala const
        MessagesStream(restaurantName),
      ],
    );
  }
}
