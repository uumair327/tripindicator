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
    List<String> locations =
        getLocationsForCategory(selectedCategory, selectedCity);

    return Scaffold(
      appBar: AppBar(
        title: Text('Select $selectedCategory in $selectedCity'),
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

  List<String> getLocationsForCategory(String category, String city) {
    // Implement logic to fetch locations for the selected category and city
    // You can use a database, an API, or any other method to get locations
    // For simplicity, I'll provide a hardcoded list for demonstration

    // Assuming you have different locations for each city
    switch (city) {
      case 'Mumbai':
        switch (category) {
          case 'Beaches':
            return ['Juhu', 'Arnala Beach', 'Kelwe- Bordi'];
          case 'Hill Station':
            return ['Matheran', 'Lonavala', 'Mahabaleshwar'];
          // ... add cases for other categories in Mumbai
          default:
            return [];
        }
      case 'Nashik':
        switch (category) {
          case 'Beaches':
            return ['Nashik Beach 1', 'Nashik Beach 2', 'Nashik Beach 3'];
          case 'Hill Station':
            return ['Nashik Hill 1', 'Nashik Hill 2', 'Nashik Hill 3'];
          // ... add cases for other categories in Nashik
          default:
            return [];
        }
      // ... add cases for other cities
      default:
        return [];
    }
  }
}
