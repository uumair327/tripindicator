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
                ElevatedButton(
                  onPressed: () {
                    navigateToCategoryPage(context, 'Beaches');
                  },
                  child: const Text(
                    'Beaches',
                    style: TextStyle(color: Colors.black), // Black text color
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    primary: Colors.white, // Use white color for the button
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    navigateToCategoryPage(context, 'Hill Station');
                  },
                  child: const Text(
                    'Hill Station',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    primary: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    navigateToCategoryPage(context, 'Waterfalls');
                  },
                  child: const Text(
                    'Waterfalls',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    primary: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    navigateToCategoryPage(context, 'Forts');
                  },
                  child: const Text(
                    'Forts',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    primary: Colors.white,
                  ),
                ),
                // Add more buttons for other categories
                // ...
              ],
            ),
          ),
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
