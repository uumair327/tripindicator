import 'package:flutter/material.dart';

import 'LocationSelectionPage.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String selectedCity;

  const CategoryDetailsPage({
    Key? key,
    required this.selectedCity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$selectedCity Details'),
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
                buildStyledButton(context, 'Beaches'),
                buildStyledButton(context, 'Hill Station'),
                buildStyledButton(context, 'Waterfalls'),
                buildStyledButton(context, 'Forts'),
                buildStyledButton(context, 'Monsoon Treks'),
                buildStyledButton(context, 'Sanctuaries'),
                buildStyledButton(context, 'Caves'),
                buildStyledButton(context, 'Jungle'),
                buildStyledButton(context, 'Safari'),
                buildStyledButton(context, 'Shrines or temples'),
                buildStyledButton(context, 'Dams'),
                buildStyledButton(context, 'Lakes'),
                buildStyledButton(context, 'Cottages With Pool'),
                buildStyledButton(context, 'Farmhouse'),
                buildStyledButton(context, 'Fishing Rivers'),
                buildStyledButton(context, 'Resorts'),
                buildStyledButton(context, 'Cities and Villages To Visit'),
                buildStyledButton(context, 'Western Railway Heritage Gallery'),
                // ... other buttons
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
        navigateToLocationSelection(context, label);
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

  void navigateToLocationSelection(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationSelectionPage(
          selectedCity: selectedCity,
          selectedCategory: category,
        ),
      ),
    );
  }
}
