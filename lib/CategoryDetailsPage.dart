import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class CategoryDetailsPage extends StatefulWidget {
  final String selectedCity;
  final String selectedCategory;

  const CategoryDetailsPage({
    Key? key,
    required this.selectedCity,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  _CategoryDetailsPageState createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  late Future<String> categoryDetails;

  @override
  void initState() {
    super.initState();
    categoryDetails = fetchCategoryDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('${widget.selectedCity} - ${widget.selectedCategory} Details'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
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
          child: FutureBuilder<String>(
            future: categoryDetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Details for ${widget.selectedCategory} in ${widget.selectedCity}:',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      snapshot.data!,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<String> fetchCategoryDetails() async {
    const apiKey =
        '4aa6c59cf39a024505a6cc7d81a410c7'; // Replace with your actual API key
    const apiUrl =
        'https://example.com/api/category-details'; // Replace with your API endpoint

    final response = await http.get(
      Uri.parse(
          '$apiUrl?city=${widget.selectedCity}&category=${widget.selectedCategory}&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['details'];
    } else {
      throw Exception('Failed to load category details');
    }
  }
}
