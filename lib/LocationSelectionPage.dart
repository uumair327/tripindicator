import 'package:flutter/material.dart';

import 'RouteDetailsPage.dart';

class LocationSelectionPage extends StatelessWidget {
  final String selectedCity;
  final String selectedCategory;

  const LocationSelectionPage({
    Key? key,
    required this.selectedCity,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You can dynamically fetch locations based on the selectedCategory here
    List<String> locations = getLocationsForCategory(selectedCategory);

    return Scaffold(
      appBar: AppBar(
        title: Text('Select $selectedCategory'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (String location in locations)
                  buildStyledButton(context, location),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton buildStyledButton(BuildContext context, String label) {
    return ElevatedButton(
      onPressed: () {
        navigateToRouteDetails(context, label);
      },
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.blue.withOpacity(0.8);
            }
            return Colors.white;
          },
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  void navigateToRouteDetails(BuildContext context, String selectedLocation) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RouteDetailsPage(
          selectedCity: selectedCity,
          selectedCategory: selectedCategory,
          selectedLocation: selectedLocation,
          defaultSource: 'YourPicnicSpot',
          defaultDestination: '',
        ),
      ),
    );
  }

  List<String> getLocationsForCategory(String category) {
    // Implement logic to fetch locations for the selected category
    // You can use a database, an API, or any other method to get locations
    // For simplicity, I'll provide a hardcoded list for demonstration
    switch (category) {
      case 'Beaches':
        return ['Beach 1', 'Beach 2', 'Beach 3'];
      case 'Hill Station':
        return ['Hill Station 1', 'Hill Station 2', 'Hill Station 3'];
      // ... add cases for other categories
      default:
        return [];
    }
  }
}
