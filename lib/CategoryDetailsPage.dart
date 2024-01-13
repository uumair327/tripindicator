import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Details for ${widget.selectedCategory} in ${widget.selectedCity}:',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      snapshot.data!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
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
        'https://outpost.mapmyindia.com/api/security/oauth/token?grant_type=client_credentials&client_id=96dHZVzsAuvf5wbBfJhiNCAvJQKTv5YcP8wmMNLOMD1buNYOykOg4sqvywNZ21rzGVQGkmpzk580aWvsxvaFkw==&client_secret=lrFxI-iSEg8rCBF28zRZqrFzvMNvqIWPtlJ2OeSfQEfQudKlG__LjpVRRSdVYmNWOARpRCiMW4KauDsCxBkmrIruPjQ61pAs';
    final apiUrl =
        'https://atlas.mapmyindia.com/api/places/geocode?address=${widget.selectedCategory}&api_key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final details = decodedData['suggestedLocations'][0]['placeAddress'];
      return details;
    } else {
      throw Exception('Failed to load category details');
    }
  }
}
