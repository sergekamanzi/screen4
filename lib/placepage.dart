
import 'package:flutter/material.dart';


class PlacesPage extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;


  PlacesPage({required this.onThemeChanged});


  @override
  _PlacesPageState createState() => _PlacesPageState();
}


class _PlacesPageState extends State<PlacesPage> {
  int _currentIndex = 1; // Set default to the places page
  bool isDarkTheme = false; // Default to light theme
  List<bool> likedPlaces = []; // List to track liked places


  @override
  void initState() {
    super.initState();
    // Initialize the likedPlaces list with false for each place
    likedPlaces = List<bool>.filled(25, false); // Adjust 25 based on total number of places
  }


  @override
  Widget build(BuildContext context) {
    final textColor = isDarkTheme ? Colors.white : Colors.black;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 95, 75),
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo3.png', // Path to your logo image
          width: 100,
          height: 50,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Explore Categories',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF007BFF),
                      fontFamily: 'Arial',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Places to Visit by Category',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF04B177),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Mountains Category
                  buildCategory('Mountains', [
                    buildPlace(8, 'assets/images/mount1.jpg', 'Mt. Kalisimbi', textColor, 'Karisimbi Volcano is the highest of the Virunga. The highest peak of Karisimbi Volcano.'),
                    buildPlace(9, 'assets/images/mount2.jpg', 'Sabyinyo Mountains', textColor, 'Mount Sabyinyo is the oldest of all the Virunga massif volcanoes.'),
                    buildPlace(10, 'assets/images/mount3.jpg', 'Bisoke Peak', textColor, 'Mt. Bisoke is one of the eight volcanoes in the Virunga mountains range of the Albertine Rift.'),
                    buildPlace(11, 'assets/images/mount4.jpg', 'Huye Peak', textColor, 'Detailed information about Huye Peak'),
                    buildPlace(12, 'assets/images/mount5.jpg', 'Nyiragongo Peak', textColor, 'Mount Nyiragongo is an active stratovolcano with an elevation of 3,470 m.'),
                  ], textColor),


                  // Memorial Sites Category
                  buildCategory('Memorial Sites', [
                    buildPlace(13, 'assets/images/site1.jpg', 'Nyamata Genocide Memorial', textColor, 'The Nyamata Genocide Memorial was desacralized by the Roman Catholic.'),
                    buildPlace(14, 'assets/images/site2.jpeg', 'Murambi Genocide Memorial', textColor, 'The Murambi Genocide Memorial was created on 21st April 1995.'),
                    buildPlace(15, 'assets/images/site3.jpeg', 'Gisozi Genocide Memorial', textColor, 'Some 250,000 Tutsis were killed in Kigali during the genocide.'),
                    buildPlace(16, 'assets/images/site4.jpg', 'Bisesero Genocide Memorial', textColor, 'The Bisesero Genocide Memorial is about 25 km from Kibuye .'),
                  ], textColor),


                  // National Parks Category
                  buildCategory('National Parks', [
                    buildPlace(17, 'assets/images/park1.jpg', 'Akagera National Park', textColor, 'Akagera has an inspiring conservation story as it is now home to lions and rhinos.'),
                    buildPlace(18, 'assets/images/park2.jpg', 'Nyungwe National Park', textColor, 'One of the oldest rainforests in Africa, Nyungwe is rich in biodiversity.'),
                    buildPlace(19, 'assets/images/park3.jpg', 'Gishwati National Park', textColor, 'Spectacular trees, rushing waterfalls, and lush forest.'),
                  ], textColor),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 18, 103, 70),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Navigation logic can be added here if needed
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/discover.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/more.png',
              width: 24,
              height: 24,
            ),
            label: '',
          ),
        ],
      ),
    );
  }


  Widget buildCategory(String categoryName, List<Widget> places, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF006E52),
          ),
        ),
        SizedBox(height: 10),
        Column(children: places),
        SizedBox(height: 30),
      ],
    );
  }


  Widget buildPlace(int index, String imagePath, String title, Color textColor, String description) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(imagePath),
                  SizedBox(height: 10),
                  Text(description),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  likedPlaces[index] = !likedPlaces[index]; // Toggle liked state
                });
              },
              child: Image.asset(
                likedPlaces[index]
                    ? 'assets/images/red.png' // Path to filled heart image
                    : 'assets/images/heart.png', // Path to empty heart image
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


