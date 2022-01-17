import 'dart:async';
//import 'package:flutter/cupertino.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'mapview.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bins.dart';

//https://www.youtube.com/watch?v=lNqEfnnmoHk&t=314s

final databaseReference = FirebaseFirestore.instance;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller =
      Completer(); //to ekana final telefteo check

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: IconButton(
        // icon: Icon(FontAwesomeIcons.arrowLeft), onPressed: () {}),
        title: const Text("UCY - CYPRUS - SMART BIN"), //evala const
        // actions: <Widget>[
        // IconButton(icon: Icon(FontAwesomeIcons.search), onPressed: () {}),
        // ],
      ),
      body: Stack(
        children: <Widget>[
          _googleMap(context), // dhmiourgia google map
          //mapview(context), //other file - test
          // _zoomminusfunction(), //dhmiourgia zoom in function
          // _zoomplusfunction(), //dhmiourgia zoom out function
          _buildContainer(),
          //bins(), // to container gia ta katw
        ],
      ),
    );
  }

  /*
  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0), //evala const
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            //for (var i = 0; i < 10; i++)
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
            const SizedBox(width: 10.0), //evala const
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "images/smartbin2.png",
                  //"https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  35.148241,
                  33.413619,
                  'SmartBin2'),
            ),
*/
/*            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "images/smartbin3.png",
                  // "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  35.149066,
                  33.411666,
                  "SmartBin3"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "images/smartbin4.png",
                  //"https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  35.144258,
                  33.411934,
                  "SmartBin4"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "images/smartbin5.png",
                  //"https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  35.147864,
                  33.410067,
                  "SmartBin5"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "images/smartbin6.png",

                  //"https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  35.145627,
                  33.413672,
                  "SmartBin6"),
            ),*/
  /*
          ],
        ),
      ),
    );
  }*/

  Widget _boxes(String _image, double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: () {
        toLocation(restaurantName);
        //_gotoLocation(lat, long);
        //gotolocation(lat, long);//other file - test
      },
      child: FittedBox(
        //eixe new ->to efuga // Container( child: FittedBox( htan etsi to efuga
        child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: const Color(0x802196F3), //evala const
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
                  //Container(child: Padding( to efuga
                  padding: const EdgeInsets.all(8.0),
                  child: myDetailsContainer1(restaurantName),
                ),
              ],
            )),
      ),
    );
  }

  Widget toLocation(String restaurantName) {
    double lat;
    double long;
    print('callllsssssssssssssssssssssssssssssssl');
    return StreamBuilder<QuerySnapshot>(
      stream: databaseReference.collection('smartbin').snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        print('meshhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
        final messages = snapshot.data!.docs.reversed;
        for (var message in messages) {
          final sender = message.data()['sender'];
          final lat1 = message.data()['lat'];
          final long1 = message.data()['long'];
          print('calllll');
          if (restaurantName == sender) {
            print('------------------');
            lat = lat1;
            long = long1;
            _gotoLocation(lat, long);
            print('------------------');
          }
        }
        return SizedBox.shrink();
      },
    );
    print('callllsssssssssssssssssssssssssssssssl');
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(lat, long), zoom: 15, tilt: 50.0, bearing: 45.0),
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
          //Container(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                /*child: (restaurantName == 'SmartBin1')
                  ? const Text('123')
                  : const Text('999'),*/
                // ME CASE TA ONOMATA PANW SE INT KAI EDW NA VGAZEI ONOMA KAI LOCATION ME CASE KAI EDW KAI PANW

                // Text(
                //   "4.1",
                //   style: TextStyle(
                //     color: Colors.black54,
                //     fontSize: 18.0,
                //   ),
                // ),
                ),
            // Container( //einai to container gia ta asterakia gia na valeis 4 to vazeis 4 fores gia na einai se ROW
            //   child: Icon(
            //     FontAwesomeIcons.solidStar,
            //     color: Colors.amber,
            //     size: 15.0,
            //   ),
            // ),
            //
            // Container(
            //     child: Text(
            //   "(946)",
            //   style: TextStyle(
            //     color: Colors.black54,
            //     fontSize: 18.0,
            //   ),
            // )),
          ],
        ),
        // const SizedBox(height: 5.0), //evala const
        MessagesStream(restaurantName),
/*       const Text(
          //Container(child: Text( kai evala const
          "PMD  70%",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),*/
        /* const SizedBox(height: 5.0), //evala const
        const Text(
          //Container(child: Text( kai evala const
          "Paper  50%",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),*/
      ],
    );
  }

  Widget _googleMap(BuildContext context) {
    return SizedBox(
      //eixe container kai to ekana sizedbox
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: //evala const
            const CameraPosition(
                target: LatLng(35.143605, 33.391914), zoom: 14),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          SmartBin1,
          SmartBin2,
          SmartBin3,
          SmartBin4,
          SmartBin5,
          SmartBin6,
        },
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0), //evala const
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
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
            const SizedBox(width: 10.0), //evala const
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "images/smartbin2.png",
                  //"https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  35.148241,
                  33.413619,
                  'SmartBin2'),
            ),
          ],
        ),
      ),
    );
  }
}

//End of class//

class MessagesStream extends StatelessWidget {
  const MessagesStream(this.binname);
  final String binname;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: databaseReference
          .collection('smartbin')
          // .orderBy('timestamp', descending: false)
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        final messages = snapshot.data!.docs.reversed;
        List<Column> messageWidgets = [];
        for (var message in messages) {
          final pmd = message.data()['pmd'];
          final paper = message.data()['paper'];
          //late final currentUser = loggedInUser.email;
          final time = message.data()['timestamp'];
          final sender = message.data()['sender'];
          final adress = message.data()['adress'];
          final lat = message.data()['lat'];
          final long = message.data()['long'];
          final Column messageWidget = Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Paper: $paper%',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'PMD: $pmd%',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Address: $adress',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          );

          if (binname == sender) {
            messageWidgets.add(messageWidget);
          }
        }
        return Column(
          children: messageWidgets,
        );
      },
    );
  }
}

// OUT OF CLASS
Marker SmartBin1 = Marker(
  markerId: const MarkerId('SmartBin1'), //evala const
  position: const LatLng(35.147375, 33.415861), //evala const
  infoWindow: const InfoWindow(title: 'SmartBin1'), //evala const
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
);
Marker SmartBin2 = Marker(
  markerId: const MarkerId('SmartBin2'),
  position: const LatLng(35.148241, 33.413619),
  infoWindow: const InfoWindow(title: 'SmartBin2'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker SmartBin3 = Marker(
  markerId: const MarkerId('SmartBin3'),
  position: const LatLng(35.149066, 33.411666),
  infoWindow: const InfoWindow(title: 'SmartBin3'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker SmartBin4 = Marker(
  markerId: const MarkerId('SmartBin4'),
  position: const LatLng(35.144258, 33.411934),
  infoWindow: const InfoWindow(title: 'SmartBin4'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker SmartBin5 = Marker(
  markerId: const MarkerId('SmartBin5'),
  position: const LatLng(35.147864, 33.410067),
  infoWindow: const InfoWindow(title: 'SmartBin5'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker SmartBin6 = Marker(
  markerId: const MarkerId('SmartBin6'),
  position: const LatLng(35.145627, 33.413672),
  infoWindow: const InfoWindow(title: 'SmartBin6'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
