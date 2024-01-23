import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smarttra_web/widgets/text_widget.dart';

class VehiclesTab extends StatefulWidget {
  const VehiclesTab({super.key});

  @override
  State<VehiclesTab> createState() => _VehiclesTabState();
}

class _VehiclesTabState extends State<VehiclesTab> {
  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
      target: LatLng(8.1479, 125.1321),
      zoom: 14,
    );
    return Card(
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
                  Card(
                    child: SizedBox(
                      width: 175,
                      height: 125,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            text: '4',
                            fontSize: 50,
                            color: Colors.black,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: 175,
                      height: 125,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            text: '4',
                            fontSize: 50,
                            color: Colors.black,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: 175,
                      height: 125,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            text: '4',
                            fontSize: 50,
                            color: Colors.black,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: SizedBox(
                      width: 175,
                      height: 125,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            text: '4',
                            fontSize: 50,
                            color: Colors.black,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 480,
                child: GoogleMap(
                  // markers: Set<Marker>.of(_markers),
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
    );
  }
}
