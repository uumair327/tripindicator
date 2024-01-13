import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Navigator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> cities = ['Mumbai', 'Nashik', 'Thane', 'Pune'];
  String selectedCity = '';
  List<TransportOption> transportOptions = [];

  List<TransportOption>? get fetchedOptions => null;

  Future<void> fetchTransportOptions(String destination) async {
    // Replace with API calls to fetch transport options and fares
    // based on destination and current location
    // ...
    setState(() {
      transportOptions = fetchedOptions!;
    });
  }

  void selectCity(String city) {
    setState(() {
      selectedCity = city;
      // Call your function to fetch transport options for the selected city
      fetchTransportOptions(city);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png', // Replace with your logo asset path
              height: 100,
              width: 100,
            ),
            const SizedBox(width: 8),
            Text(selectedCity.isNotEmpty
                ? 'Selected City: $selectedCity'
                : 'City Navigator'),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Choose a City',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => selectCity(cities[index]),
                  child: Card(
                    color: selectedCity == cities[index] ? Colors.blue : null,
                    child: Center(
                      child: Text(
                        cities[index],
                        style: TextStyle(
                          color: selectedCity == cities[index]
                              ? Colors.white
                              : Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (selectedCity.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: transportOptions.length,
                itemBuilder: (context, index) {
                  TransportOption option = transportOptions[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(option.icon),
                      title: Text(option.name),
                      subtitle: Text('Estimated Fare: ₹${option.fare}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.info),
                        onPressed: () {
                          // Show more details about the option
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class TransportOption {
  final String name;
  final IconData icon;
  final String fare;
  // ... other details like travel time, route, etc.

  TransportOption({
    required this.name,
    required this.icon,
    required this.fare,
  });
}
