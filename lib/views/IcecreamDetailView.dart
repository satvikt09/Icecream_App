import 'package:app/icecream/icecream.dart';
import 'package:app/providers/cart_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class IcecreamDetailView extends StatelessWidget {
  const IcecreamDetailView({super.key, required this.icecream});

  final Icecream icecream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(icecream.flavor),
        elevation: 0.0,
        backgroundColor: Colors.orange, // Match the orange app bar color
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ice cream image
              Row(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: CachedNetworkImageProvider(
                      icecream.image!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),

              // Ice cream flavor and price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      icecream.flavor,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '₹${icecream.price.toString()}', // Display price in ₹
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),

              // Ice cream description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  icecream.description ?? '', // Use description if available
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 16.0),

              // Toppings section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Toppings',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 10),

              // Dynamically show toppings as Chips
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap(
                  spacing: 10.0,
                  children: icecream.toppings != null
                      ? icecream.toppings!
                          .map((topping) => Chip(label: Text(topping)))
                          .toList()
                      : [], // Display nothing if no toppings
                ),
              ),
              const SizedBox(height: 16.0),

              // Ingredients section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 10),

              // Box-like layout for ingredients
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors
                        .grey[100], // Light background for ingredients box
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: icecream.ingredients
                        .map(
                          (ingredient) => Column(
                            children: [
                              ListTile(
                                title: Text(ingredient.name),
                                subtitle: Text('QTY - ${ingredient.quantity}'),
                              ),
                              const Divider(),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(icecream);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${icecream.flavor} added to cart!'),
                      ),
                    );
                  },
                  child: const Text('Add to Cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
