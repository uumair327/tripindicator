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
        switch (city) {
          case 'Mumbai':
            switch (category) {
              case 'Beaches':
                return [
                  'Juhu Beach',
                  'Arnala Beach',
                  'Kelwe- Bordi',
                  'Madh Island - Aksa',
                  'Marve and Gorai and Manori',
                  'Arnala beach',
                  'Kelwe - Bordi',
                  'Mandwa and Kihim',
                  'Alibag- Kihim-Kashid-Mandwa-Varsoli- Nandgaon',
                  'Dahanu',
                  'Diveagar beach',
                  'Harihareshwar',
                  'Hedvi Beach - Guhagar',
                  'Ganapatipule',
                  'Velneshwar',
                  'Vengurla Malvan',
                  'Tarkarli',
                  'HarshaVardhan - Mahad',
                  'Are-Ware Beach',
                  'Ganeshgule Beach',
                  'Samindar Beach - Rajapur',
                  'Damman - Davika - Vapi',
                ];
              case 'Hill Station':
                return [
                  'Matheran',
                  'Lonavala',
                  'Mahabaleshwar',
                  'Bhandardara',
                  'Jawhar',
                  'Panchgani',
                  'Mahabaleshwar',
                  'Panhala',
                  'Toranmal',
                  'Amboli - Sawantwadi',
                  'Chikhaldara',
                ];
              case 'Waterfalls':
                return [
                  'Dudhsagar Waterfall',
                  'Bhivpuri Waterfall',
                  'Kune Falls',
                  'Umbrella/ Randha',
                  'Dabosa Waterfalls',
                  'Pallu Waterfalls',
                  'Malshej Ghats',
                  'Tiger Valley',
                  'Zenith Falls',
                  'Bhivpuri Falls',
                  'Bhilavle Waterfalls',
                  'Khargahr Falls',
                  'Palaspe Dam/Nishiland',
                  'Sagar Falls',
                  'Chinvoti/Mahableshwar',
                ];
              case 'Forts':
                return [
                  'Raigad Fort',
                  'Pratapgad Fort',
                  'Sinhagad Fort',
                  'Vasai',
                  'Lohagarh',
                  'Kolaba',
                  'Murud-Janjira Fort',
                  'Sinhagad',
                  'Shivneri',
                  'Tryambak or Brahmagath',
                  'Mandangad Fort',
                  'Raigarh',
                  'Purandar',
                  'Pratapgarh',
                  'Suvarnadurg',
                  'Samara-Ajinkyatara',
                  'Ahmednagar',
                  'Sindhudurg',
                  'Devgiri',
                  'Panhala',
                  'Vijaydurg',
                  'Gawilgarh',
                  'Mahur',
                  'Pauni',
                  'Chandrapur',
                  'Karnalla Fort',
                  'Rajgad Fort',
                  'Koraigad Fort',
                ];
              case 'Monsoon Treks':
                return [
                  'Rajmachi Trek',
                  'Kalsubai Trek',
                  'Harishchandragad Trek',
                  'Mount Kalsubai',
                  'MTDC/ Golden Rest',
                  'Malshej Ghats',
                  'Vishranti / Woods',
                  'Ayur Life',
                  'Pinewoods Farms',
                  'Satya Farms',
                  'Tunnel Top',
                  'Mount View',
                  'Tudor Retreat',
                  'Hans Adventure',
                  'Pui Dam',
                  'Mulshi Lake',
                  'Grambhi Falls',
                  'Farmlife',
                  'Sagar-Pen',
                  'Mahableshwar',
                  'Valley view Cottage',
                  'Raigad Ropeway',
                  'Amboli Ghat',
                  'Balang Farms',
                  'Sajjan / Drushet',
                ];
              case 'Sanctuaries':
                return [
                  'Sanjay Gandhi National Park',
                  'Dajipur',
                  'Chikhaldara',
                  'Tipeshwar',
                  'Bor Dam',
                  'The Pench National Park',
                  'Tadoba National Park',
                  'Nagzira',
                  'Navegaon',
                  'Bhamragarh',
                  'Chaprala',
                ];
              case 'Caves':
                return [
                  'Elephanta',
                  'Ellora',
                  'Pitalkhora',
                  'Ajanta',
                  'Lonad Caves - Bhiwandi',
                  'Bedse - Bhaja -Karla',
                  'Palton- Kondana Caves - Pune or Karjat',
                  'Kuna Caves - Roha',
                  'Tilsa Caves - Wada',
                ];
              case 'Jungle':
                return [
                  'Melghat Forest - Aravati',
                  'Gautela Forest - Aurangabad',
                  'National Park - Borivili',
                  'Murud Forest - Kashid',
                  'Dajipur Forest - Kolaphur',
                  'Tiger Path - Mahablesar',
                  'Tiger Reserve - Panhala',
                  'Amboli Ghats - Ratnagiri',
                  'Dadra Nagar Haveli - Silvassa',
                  'Vigramgad - Wada',
                ];
              case 'Safari':
                return [
                  'Tadoba Safari',
                  'Pench Safari',
                  'Dajipur Bison Sanctuary Safari'
                ];
              case 'Shrines or temples':
                return [
                  'Haji Ali',
                  'Titwala',
                  'Khopoli',
                  'Dehu',
                  'Alandi',
                  'Anwar Temple',
                  'Nashik',
                  'Trimbakeshwar',
                  'Jejuri',
                  'Bhimashankar',
                  'Shirdi',
                  'Meherabad',
                  'Khuldabad',
                  'Mahalaxmi Kolhapur',
                  'Sindkhed Raja',
                  'Shegaon',
                  'Nanded',
                  'Wardha',
                  'Durgadevi Temple - Guhagar',
                  'Ashtavinayak',
                ];
              case 'Dams':
                return [
                  'Shantisagar',
                  'Bharve Dam',
                  'Wilson Dam',
                  'Karjat-Farmlife',
                  'Pui Dam',
                  'Bhushi - Valvan Dam',
                  'Farm Life',
                ];
              case 'Lakes':
                return [
                  'Lonar crater lake - Buldhana',
                  'Aruthur Lake - Bhandara',
                  'Mulshi Lake - Lonavla',
                  'Tungarli Lake - Lonavla',
                  'Venna Lake - Mahableshwar',
                  'Tansa lake - Manaor',
                  'Vaitrana Lake - Manor',
                  'Charlotte Lake - Matheran',
                  'Pond House - Neral',
                  'Devekop Lake - Palghar',
                  'Gadeshwar lake - Panvel',
                  'Harishgiri Lake - Shahad',
                ];
              case 'Cottages With Pool':
                return [
                  'Shanti Sagar - Ambarnath',
                  'Manisha - Mud Island',
                  'Sagufauli - Murbad',
                  'Kosdauikar - Panvel',
                  'Raigad Resorts AC - Panvel',
                  'Private Cottage - Virar',
                ];
              case 'Farmhouse':
                return [
                  'Close',
                  'Mello Adventure - Karjat',
                  'Pinewoods- Dr.Hegde - Karjat',
                  'Rivergate - Karjat',
                  'River Touch - Karjat',
                  'Tudor Retreat - Khopoli',
                  'Omkar Farms - Murbad',
                  'ShagunaPond House - Neral',
                  'FarmLife - Neral',
                  'Raigad Resorts - Panvel',
                  'Harishgiri Lake Resort - Shahad',
                  'Vishwasrao Farms - Titwala',
                  'Balang Farms - Virar',
                  'Kalyani Village - Virar',
                  'Satya farms- karjat',
                ];
              case 'Fishing Rivers':
                return [
                  'Ulhas River - Ambarnath',
                  'Khadavli - Kalyan',
                  'Rivergate / River Touch - Karjat',
                  'Farmlife- Sanaman - Neral',
                  'Nandavan - Ulhasnagar',
                  'Kalyani Village - Virar',
                ];
              case 'Resorts':
                return [
                  'Alibaug Sea View Resort',
                  'Big Splash - Alibaug',
                  'Cottage with Pool - Ambarnath',
                  'Shanti Sagar - Ambarnath',
                  'Vishwasrao Farms - Ambivili',
                  'Rainy Resort - Badlapur',
                  'Sun Bath - Badlapur',
                  'Anandvan-MTDC - Bhandra',
                  'Children Camp site - Bhiwandi',
                  'Husanna Wadi - Bhiwandi',
                  'River View - Chipluin',
                  'Abishek Beach - Ganptipule',
                  'Golden Resorts - Igatpuri',
                  'Manas - Igatpuri',
                  'Ashwin - Igatpuri',
                  'Sunset Resort - Jawahar',
                  'Riverwind - Kalyan',
                  'Ashirward Farms - Karjat',
                  'Ayur Village - Karjat',
                  'Modi Resorts - Karjat',
                  'Pinewoods Farms - Karjat',
                  'Prakurti Farms - Karjat',
                  'River Gate - Karjat',
                  'Roma Gardens - Karjat',
                  'Satya Farms - Karjat',
                  'Sohum Resorts - Karjat',
                  'Suman Farms - Karjat',
                  'Mello Adventure - Karjat',
                  'Prakurti - Kashid',
                  'Sandpiper - Kashid',
                  'Bide Resorts - Khandala',
                  'Cloud 9 - Khandala',
                  'Kumar Resorts - Khandala',
                  'Sai Inn-Pvt Cottages - Khim',
                  'Aayush Resorts - Khopoli',
                  'Durushet - Khopoli',
                  'Sajan - Khopoli',
                  'Jai Hills Resorts - Khopoli',
                  'Mount View - Khopoli',
                  'NishiLand - Khopoli',
                  'Raigad Resorts - Khopoli',
                  'Tunnel Top - Khopoli',
                  'Uncles Kitchen - Khopoli',
                  'White House - Khopoli',
                  'Yudor Retreat - Khopoli',
                  'Doctors Farms - Kolad',
                  'Hans Adventure-Piu - Kolad',
                  'Lion Den - Lonavla',
                  'Upper Deck - Lonavla',
                  'Flamingo - Malshej',
                  'Countryside - Mandwa',
                  'Onkar Farms - Murbad',
                  'Sadafuli Farms - Murbad',
                  'Petron Highway - Nagothane',
                  'Farm Life - Neral',
                  'Pond House - Neral',
                  'River Touch Farms - Neral',
                  'Summer Hill - Neral',
                  'Forest House - Panvel',
                  'Kamath Daba - Panvel',
                  'Rishi - Panvel',
                  'Woods - Panvel',
                  'Shalom Resorts - Panvel',
                  'Vishranti Resorts - Panvel',
                  'Raigad Ropeway - Raigad',
                  'Harshgiri - Shahad',
                  'Shangrila - Shahad',
                  'Suraj Waterpark - Thane',
                  'Tikujiniwadi - Thane',
                  'Yeeor Hills - Thane',
                  'Golden Valley - Thane God',
                  'Ammu River Resort - Ulhasnagar',
                  'Sagar Kinara - Varsoli',
                  'Anand - Arnala',
                  'C Beach - Arnala',
                  'Royal Garden - Godhbunder',
                  'Farrys Beach Resort - Gorai',
                  'Silent Hill Resort - Manor',
                  'Silvermiles - Manor',
                  'Domnica-Manoribel - Manori',
                  'Esselworld Water K - Marve',
                  'Green Village - Marve',
                  'Bagca - Marve',
                  'Ballirina Beach view - MudhIsland',
                  'Amrutbaug - Mudisland',
                  'Cottage - MudIsland',
                  'Saina Resorts - Mudlsland',
                  'Pali Beach Resort - Uttan',
                  'U.Tang - Uttan',
                  'Maxwell - Uttan',
                  'Ultimate Paradise - Uttan',
                  'K.T Hills - Vasai',
                  'Balang Farms - Virar',
                  'Cottage with S.Pool - Virar',
                  'Island Club - Virar',
                  'Kalyani Village - Virar',
                  'Krishna Gardens - Virar',
                  'Pawan Resorts - Virar',
                  'Sajan Tree Top - Wada',
                ];
              case 'Cities and Villages To Visit':
                return [
                  'Mumbai',
                  'Pune ',
                  'Nashik',
                  'Dapoli ',
                  'Aurangabad',
                  'Kolhapur',
                  'Nanded',
                ];
              case 'Western Railway Heritage Gallery':
                return [
                  'Heritage Gallery 1',
                  'Heritage Gallery 2',
                  'Heritage Gallery 3'
                ];
              // ... add cases for other categories in Mumbai
              default:
                return [];
            }
          // ... add cases for other cities
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
      case 'Thane':
        switch (category) {
          case 'Beaches':
            return ['Nashik Beach 1', 'Nashik Beach 2', 'Nashik Beach 3'];
          case 'Hill Station':
            return ['Nashik Hill 1', 'Nashik Hill 2', 'Nashik Hill 3'];
          // ... add cases for other categories in Nashik
          default:
            return [];
        }
      case 'Pune':
        switch (category) {
          case 'Beaches':
            return ['Nashik Beach 1', 'Nashik Beach 2', 'Nashik Beach 3'];
          case 'Hill Station':
            return ['Nashik Hill 1', 'Nashik Hill 2', 'Nashik Hill 3'];
          // ... add cases for other categories in Nashik
          default:
            return [];
        }

      default:
        return [];
    }
  }
}
