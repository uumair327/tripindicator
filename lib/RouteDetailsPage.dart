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

  @override
  void initState() {
    super.initState();
    sourceController = TextEditingController(text: widget.defaultSource);
    destinationController =
        TextEditingController(text: widget.defaultDestination);
    sourceLocation = getDestinationCoordinates(widget.selectedLocation);
    destinationLocation = getBeachCoordinates('Juhu Beach');
  }

  LatLng getDestinationCoordinates(String location) {
    switch (widget.selectedCategory) {
      case 'Beaches':
        return getBeachCoordinates(location);
      case 'Hill Station':
        return getHillStationCoordinates(location);
      default:
        return const LatLng(0, 0);
    }
  }

  LatLng getBeachCoordinates(String location) {
    switch (location) {
      case 'Juhu Beach':
        return const LatLng(19.1075, 72.8263);
      case 'Arnala Beach':
        return const LatLng(19.4522, 72.7479);
      case 'Kelwe- Bordi':
        return const LatLng(19.6113, 72.7299);
      default:
        return const LatLng(0, 0);
    }
  }

  LatLng getHillStationCoordinates(String location) {
    switch (location) {
      case 'Matheran':
        return const LatLng(18.9865, 73.2656);
      case 'Lonavala':
        return const LatLng(18.7549, 73.4057);
      case 'Mahabaleshwar':
        return const LatLng(17.9239, 73.6584);
      default:
        return const LatLng(0, 0);
    }
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
                  sourceLocation = const LatLng(37.7749, -122.4194);
                });
              },
            ),
            TextField(
              controller: destinationController,
              decoration: const InputDecoration(labelText: 'Juhu'),
              onChanged: (value) {
                setState(() {
                  destinationLocation = getBeachCoordinates(value);
                });
              },
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 200.0,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: sourceLocation ?? LatLng(0, 0),
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
            const SizedBox(height: 16.0),
            _buildRouteDescription(
              'Route 1',
              [
                'Train (Central Railway): Kalyan to Dadar',
                'Train (Western Railway): Dadar to Santacruz',
                'Bus (BEST): Santacruz to Juhu Beach',
              ],
            ),
            // Add additional routes if needed...
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
      infoWindow: InfoWindow(title: widget.selectedLocation),
    ));
    markers.add(Marker(
      markerId: const MarkerId('_currentLocation'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourceLocation ?? LatLng(0, 0),
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

  Widget _buildRouteDescription(String routeName, List<String> steps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          routeName,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        for (String step in steps)
          Text(
            '• $step',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
