import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class TouristAttraction {
  final String title;
  final String description;
  final String imageUrl;

  TouristAttraction({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

final List<TouristAttraction> attractions = [
  TouristAttraction(
    title: 'Explore Paris + Easy Day Trip',
    description: 'Discover the best spots in Paris on a day trip.',
    imageUrl: 'assets/efileTower.png',
  ),
  TouristAttraction(
    title: 'Paris 5-Day Tourist Recommendations',
    description: 'A complete 5-day itinerary for exploring Paris.',
    imageUrl: 'assets/efileTower2.png',
  ),
  TouristAttraction(
    title: 'Top Museums in Paris',
    description: 'Guide to the must-visit museums in Paris.',
    imageUrl: 'assets/pairsmeusem.png',
  ),
  TouristAttraction(
    title: 'Best Cafés in Paris',
    description: 'List of the best cafés to visit in Paris.',
    imageUrl: 'assets/cafe.png',
  ),
  TouristAttraction(
    title: 'Paris Evening City Tours',
    description: 'Experience Paris at night with guided tours.',
    imageUrl: 'assets/eveningtour.png',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tourist Attractions',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0)),
        title: const Text(
          "Muhammad Waqas Siddique 232441",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert,
                color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ...attractions
              .map((attraction) => buildAttractionCard(attraction, context)),
          const SizedBox(height: 20),
          const Text(
            'Video Guide',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/youtube.png', width: 100, height: 60),
              Image.asset('assets/tiktok.png', width: 100, height: 60),
            ],
          ),
          const SizedBox(height: 20),
          buildAttractionCard(
            TouristAttraction(
              title: 'An American’s Guide to Paris',
              description: 'A travel guide for Americans visiting Paris.',
              imageUrl: 'assets/eiffleTower3.png',
            ),
            context,
          ),
        ],
      ),
    );
  }

  Widget buildAttractionCard(
      TouristAttraction attraction, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                attraction.imageUrl,
                width: 100,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(attraction.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(attraction.description),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.favorite, size: 18, color: Colors.red),
                    SizedBox(width: 5),
                    Text("500"),
                    SizedBox(width: 20),
                    Icon(Icons.comment, size: 18, color: Colors.grey),
                    SizedBox(width: 5),
                    Text("Comments"),
                    SizedBox(width: 20),
                    Icon(Icons.share, size: 18, color: Colors.grey),
                  ],
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AttractionDetailScreen(attraction: attraction),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AttractionDetailScreen extends StatelessWidget {
  final TouristAttraction attraction;

  const AttractionDetailScreen({required this.attraction, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Place to visit in paris and france"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              attraction.imageUrl,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      attraction.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "Art Museum",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          backgroundColor: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      "Europe",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          backgroundColor: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Major 19th - 20th century European art collections housed in a monumental...',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.format_quote, color: Colors.grey),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'One of my favorite museums in Paris for the exhibitions...',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star)
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Ghassan Yammine - Google reviews',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/eiffleTower3.png'),
                    ),
                    title: const Text('Cathédrale Notre-Dame de Paris'),
                    subtitle: const Text('Historical Landmark'),
                    trailing: IconButton(
                      icon: const Icon(Icons.add, color: Colors.black),
                      onPressed: () {},
                    ),
                    tileColor: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.all(8.0),
                  ),
                  const SizedBox(height: 8)
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
