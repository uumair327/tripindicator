import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteDetailsPage extends StatefulWidget {
  final String selectedCity;
  final String selectedCategory;
  final String selectedLocation;
  final String defaultSource;
  final String defaultDestination;

  const RouteDetailsPage({
    Key? key,
    required this.selectedCity,
    required this.selectedCategory,
    required this.selectedLocation,
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

  // Add your desired default coordinates for the GooglePlex location
  LatLng get pGooglePlex => LatLng(37.4220, -122.0841);

  @override
  void initState() {
    super.initState();
    sourceController = TextEditingController(text: widget.defaultSource);
    destinationController =
        TextEditingController(text: widget.defaultDestination);
    sourceLocation = const LatLng(
        37.7749, -122.4194); // Default coordinates for source (San Francisco)
    destinationLocation = getDestinationCoordinates(widget.selectedLocation);
  }

  LatLng getDestinationCoordinates(String location) {
    // Implement logic to fetch real destination coordinates based on the selected location
    // For simplicity, I'm returning default coordinates for demonstration
    return const LatLng(37.7749, -122.4194);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: sourceController,
              decoration: const InputDecoration(labelText: 'Source'),
              onChanged: (value) {
                setState(() {
                  // Update sourceLocation based on user input or selection
                  // You may use a location picker or another method to set the location
                  // For simplicity, I'm using default coordinates for San Francisco
                  sourceLocation = const LatLng(37.7749, -122.4194);
                });
              },
            ),
            TextField(
              controller: destinationController,
              decoration: const InputDecoration(labelText: 'Destination'),
              onChanged: (value) {
                setState(() {
                  // Update destinationLocation based on user input or selection
                  // You may use a location picker or another method to set the location
                  // For simplicity, I'm using default coordinates for San Francisco
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
                  target: pGooglePlex,
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
      position: pGooglePlex,
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
