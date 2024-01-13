import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteDetailsPage extends StatefulWidget {
  final String defaultSource;
  final String defaultDestination;
  final String selectedCity;
  final String selectedCategory;

  const RouteDetailsPage({
    Key? key,
    required this.defaultSource,
    required this.defaultDestination,
    required this.selectedCity,
    required this.selectedCategory,
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
    sourceLocation = const LatLng(37.7749, -122.4194);
    destinationLocation = const LatLng(37.7749, -122.4194);
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
            Text('Selected City: ${widget.selectedCity}'),
            Text('Selected Category: ${widget.selectedCategory}'),
            TextField(
              controller: sourceController,
              decoration: const InputDecoration(labelText: 'Source'),
              onChanged: (value) {
                setState(() {
                  sourceLocation = const LatLng(37.7749, -122.4194);
                });
              },
            ),
            TextField(
              controller: destinationController,
              decoration: const InputDecoration(labelText: 'Destination'),
              onChanged: (value) {
                setState(() {
                  destinationLocation = const LatLng(37.7749, -122.4194);
                });
              },
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 200.0,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.7749, -122.4194),
                  zoom: 13,
                ),
                markers: _createMarkers(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _fetchRoutesAndPrices();
              },
              child: const Text('Get Routes'),
            ),
          ],
        ),
      ),
    );
  }

  Set<Marker> _createMarkers() {
    Set<Marker> markers = {};
    markers.add(Marker(
      markerId: const MarkerId('sourceMarker'),
      position: sourceLocation!,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      infoWindow: const InfoWindow(title: 'Source'),
    ));
    markers.add(Marker(
      markerId: const MarkerId('destinationMarker'),
      position: destinationLocation!,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: const InfoWindow(title: 'Destination'),
    ));
    markers.add(Marker(
      markerId: const MarkerId('_currentLocation'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(37.7749, -122.4194),
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
