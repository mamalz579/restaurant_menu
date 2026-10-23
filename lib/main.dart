import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const MenuPage(),
    );
  }
}

// The screen: a top bar + a scrolling list of 3 cards
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        // The orange gradient behind the title
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, Colors.orange],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          FoodCard(name: 'Vegetable Pizza'),
          FoodCard(name: 'Chicken Pizza'),
          FoodCard(name: 'Cheese Pizza'),
        ],
      ),
    );
  }
}

// One food card. Write it once and reuse it 3 times.
class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // The lighter square on the left (the picture goes here)
            Container(
              width: 70,
              height: 70,
              alignment: Alignment.center,
              color: Colors.orange.shade300,
              child: const Icon(
                Icons.local_pizza,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            // The food name
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
