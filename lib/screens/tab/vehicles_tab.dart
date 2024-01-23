import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smarttra_web/widgets/text_widget.dart';

class VehiclesTab extends StatefulWidget {
  const VehiclesTab({super.key});

  @override
  State<VehiclesTab> createState() => _VehiclesTabState();
}

class _VehiclesTabState extends State<VehiclesTab> {
  @override
  void initState() {
    // TODO: implement initState
    getRecords();

    determinePosition();

    Geolocator.getCurrentPosition().then((position) {
      setState(() {
        lat = position.latitude;
        long = position.longitude;
        hasloaded = true;
      });
    }).catchError((error) {
      print('Error getting location: $error');
    });
    super.initState();
  }

  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> markers = {};

  double lat = 0;
  double long = 0;

  getRecords() {
    FirebaseFirestore.instance
        .collection('Records')
        .get()
        .then((QuerySnapshot querySnapshot) async {
      for (var doc in querySnapshot.docs) {
        setState(() {
          markers.add(Marker(
            markerId: MarkerId(doc.id),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(doc['lat'], doc['long']),
          ));
        });
      }
    });
  }

  bool hasloaded = false;

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14,
    );
    return hasloaded
        ? Card(
            child: SizedBox(
              width: 1000,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Dashboard Overview',
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Bold',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Records')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                print('error');
                                return const Center(child: Text('Error'));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.black,
                                  )),
                                );
                              }

                              final data = snapshot.requireData;
                              return Card(
                                child: SizedBox(
                                  width: 175,
                                  height: 125,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextWidget(
                                        text: 'All vehicles',
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextWidget(
                                        text: '${data.docs.length}',
                                        fontSize: 50,
                                        color: Colors.black,
                                        fontFamily: 'Bold',
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Records')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                print('error');
                                return const Center(child: Text('Error'));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.black,
                                  )),
                                );
                              }

                              final data = snapshot.requireData;
                              return Card(
                                child: SizedBox(
                                  width: 175,
                                  height: 125,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextWidget(
                                        text: 'On Trip',
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextWidget(
                                        text: '${data.docs.length}',
                                        fontSize: 50,
                                        color: Colors.black,
                                        fontFamily: 'Bold',
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Records')
                                .where('day', isEqualTo: DateTime.now().day)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                print('error');
                                return const Center(child: Text('Error'));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.black,
                                  )),
                                );
                              }

                              final data = snapshot.requireData;
                              return Card(
                                child: SizedBox(
                                  width: 175,
                                  height: 125,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextWidget(
                                        text: 'Idling',
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextWidget(
                                        text: '${data.docs.length}',
                                        fontSize: 50,
                                        color: Colors.black,
                                        fontFamily: 'Bold',
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Records')
                                .where('day', isEqualTo: DateTime.now().day)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                print('error');
                                return const Center(child: Text('Error'));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.black,
                                  )),
                                );
                              }

                              final data = snapshot.requireData;
                              return Card(
                                child: SizedBox(
                                  width: 175,
                                  height: 125,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextWidget(
                                        text: 'Parking',
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextWidget(
                                        text: '${data.docs.length}',
                                        fontSize: 50,
                                        color: Colors.black,
                                        fontFamily: 'Bold',
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 480,
                      child: GoogleMap(
                        // markers: Set<Marker>.of(_markers),
                        markers: markers,
                        myLocationEnabled: true,
                        zoomControlsEnabled: false,
                        mapType: MapType.normal,

                        onMapCreated: _onMapCreated,
                        initialCameraPosition: initialCameraPosition,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
