import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VegetableStoreScreen extends StatefulWidget {
  const VegetableStoreScreen({super.key});

  @override
  State<VegetableStoreScreen> createState() => _VegetableStoreScreenState();
}

class _VegetableStoreScreenState extends State<VegetableStoreScreen> {
  List<Vegetable> _vegetables = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchVegetables();
  }

  Future<void> _fetchVegetables() async {
    final futures = List.generate(
      10,
      (_) => http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/random.php')),
    );

    final responses = await Future.wait(futures);
    final random = Random();
    final newVegetables = <Vegetable>[];

    for (final response in responses) {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['meals'] != null) {
          final meal = data['meals'][0];
          newVegetables.add(Vegetable(
            name: meal['strMeal'],
            price: 1 + random.nextDouble() * 4, // Random price between 1 and 5
            imageUrl: meal['strMealThumb'],
          ));
        }
      }
    }

    if (mounted) {
      setState(() {
        _vegetables = newVegetables;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vegan Vegetable Store'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _vegetables.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          _vegetables[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(_vegetables[index].name),
                      Text('\$${_vegetables[index].price.toStringAsFixed(2)}'),
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
