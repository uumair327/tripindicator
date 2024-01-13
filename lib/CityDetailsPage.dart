import 'package:flutter/material.dart';

class CityDetailsPage extends StatelessWidget {
  final String selectedCity;

  const CityDetailsPage({Key? key, required this.selectedCity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$selectedCity Details'),
        backgroundColor: Colors.blue, // Use blue color for the app bar
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white
              ], // Use white gradient for the body
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildElevatedButton(context, 'Beaches'),
                buildElevatedButton(context, 'Hill Station'),
                buildElevatedButton(context, 'Waterfalls'),
                buildElevatedButton(context, 'Forts'),
                // Add more buttons for other categories
                // ...
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context, String label) {
    return ElevatedButton(
      onPressed: () {
        navigateToCategoryPage(context, label);
      },
      child: Text(
        label,
        style: const TextStyle(color: Colors.black), // Black text color
      ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.blue.withOpacity(0.8); // Change color on hover
            }
            return Colors.white; // Default color
          },
        ),
      ),
    );
  }

  void navigateToCategoryPage(BuildContext context, String category) {
    // Navigate to the next page based on the selected category
    Navigator.pushNamed(context, '/categoryDetails',
        arguments: {'city': selectedCity, 'category': category});
  }
}
