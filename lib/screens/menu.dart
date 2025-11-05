import 'package:flutter/material.dart';
import 'package:football_news/widgets/news_card.dart';
import 'package:football_news/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // Fix 1: Added missing semicolons ';'
  final String nama = "Hillary Elizabeth"; //nama
  final String npm = "2406407266"; //npm
  final String kelas = "D"; //kelas

  final List<ItemHomepage> items = [
    ItemHomepage("See Football News", Icons.newspaper),
    ItemHomepage("Add News", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];

  // Fix 2: Added the required 'build' method for a StatelessWidget.
  @override
  Widget build(BuildContext context) {
    // A basic layout to display your widgets.
    return Scaffold(
      appBar: AppBar(
      // Judul aplikasi "Football News" dengan teks putih dan tebal.
        title: const Text(
          'Football News',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
    // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
    backgroundColor: Theme.of(context).colorScheme.primary,
  ),
  drawer: LeftDrawer(),
      body: SingleChildScrollView(
        // Use SingleChildScrollView to prevent overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section for InfoCards
              const Text(
                "Student Info",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              // Row to hold the info cards horizontally
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: "Name", content: nama),
                  InfoCard(title: "NPM", content: npm),
                  InfoCard(title: "Class", content: kelas),
                ],
              ),
              const SizedBox(height: 24.0),
              const Divider(), // A visual separator
              const SizedBox(height: 16.0),

              // Section for ItemCards (using GridView)
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemCard(items[index]);
                },
                shrinkWrap: true, // Needed inside a Column
                physics: const NeverScrollableScrollPhysics(), // Stops GridView from scrolling independently
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  // Kartu informasi yang menampilkan title dan content.

  final String title; // Judul kartu.
  final String content; // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Membuat kotak kartu dengan bayangan dibawahnya.
      elevation: 2.0,
      child: Container(
        // Mengatur ukuran dan jarak di dalam kartu.
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}