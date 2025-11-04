import 'package:flutter/material.dart';

class VegetableStoreScreen extends StatelessWidget {
  const VegetableStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vegan Vegetable Store'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: vegetables.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    vegetables[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(vegetables[index].name),
                Text('\\\$${vegetables[index].price.toStringAsFixed(2)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Vegetable {
  final String name;
  final double price;
  final String imageUrl;

  const Vegetable({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

final List<Vegetable> vegetables = [
  const Vegetable(
    name: 'Carrot',
    price: 1.25,
    imageUrl: 'https://via.placeholder.com/150/FFC107/000000?Text=Carrot',
  ),
  const Vegetable(
    name: 'Broccoli',
    price: 2.50,
    imageUrl: 'https://via.placeholder.com/150/4CAF50/FFFFFF?Text=Broccoli',
  ),
  const Vegetable(
    name: 'Tomato',
    price: 1.75,
    imageUrl: 'https://via.placeholder.com/150/F44336/FFFFFF?Text=Tomato',
  ),
  const Vegetable(
    name: 'Spinach',
    price: 3.00,
    imageUrl: 'https://via.placeholder.com/150/8BC34A/FFFFFF?Text=Spinach',
  ),
  const Vegetable(
    name: 'Potato',
    price: 0.75,
    imageUrl: 'https://via.placeholder.com/150/9E9E9E/FFFFFF?Text=Potato',
  ),
  const Vegetable(
    name: 'Cucumber',
    price: 1.00,
    imageUrl: 'https://via.placeholder.com/150/009688/FFFFFF?Text=Cucumber',
  ),
];
