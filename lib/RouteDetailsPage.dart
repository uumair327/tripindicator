import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteDetailsPage extends StatefulWidget {
  final String defaultSource;
  final String defaultDestination;

  const RouteDetailsPage({
    Key? key,
    required this.defaultSource,
    required this.defaultDestination,
  }) : super(key: key);

  @override
  _RouteDetailsPageState createState() => _RouteDetailsPageState();
}

class _RouteDetailsPageState extends State<RouteDetailsPage> {
  late GoogleMapController mapController;
  late TextEditingController sourceController;
  late TextEditingController destinationController;
  LatLng? sourceLocation;
  LatLng? destinationLocation;

  @override
  void initState() {
    super.initState();
    sourceController = TextEditingController(text: widget.defaultSource);
    destinationController =
        TextEditingController(text: widget.defaultDestination);
    sourceLocation = LatLng(
        37.7749, -122.4194); // Default coordinates for source (San Francisco)
    destinationLocation = LatLng(37.7749,
        -122.4194); // Default coordinates for destination (San Francisco)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: sourceController,
              decoration: InputDecoration(labelText: 'Source'),
              onChanged: (value) {
                setState(() {
                  // Update sourceLocation based on user input or selection
                  // You may use a location picker or another method to set the location
                  // For simplicity, I'm using default coordinates for San Francisco
                  sourceLocation = LatLng(37.7749, -122.4194);
                });
              },
            ),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(labelText: 'Destination'),
              onChanged: (value) {
                setState(() {
                  // Update destinationLocation based on user input or selection
                  // You may use a location picker or another method to set the location
                  // For simplicity, I'm using default coordinates for San Francisco
                  destinationLocation = LatLng(37.7749, -122.4194);
                });
              },
            ),
            SizedBox(height: 16.0),
            Container(
              height: 200.0,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: sourceLocation!,
                  zoom: 12.0,
                ),
                markers: _createMarkers(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _fetchRoutesAndPrices();
              },
              child: Text('Get Routes'),
            ),
          ],
        ),
      ),
    );
  }

  Set<Marker> _createMarkers() {
    Set<Marker> markers = {};
    markers.add(Marker(
      markerId: MarkerId('sourceMarker'),
      position: sourceLocation!,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: InfoWindow(title: 'Source'),
    ));
    markers.add(Marker(
      markerId: MarkerId('destinationMarker'),
      position: destinationLocation!,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(title: 'Destination'),
    ));
    return markers;
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _fetchRoutesAndPrices() {
    // Implement logic to fetch routes and prices
    // Update UI accordingly
    // ...
  }
}
