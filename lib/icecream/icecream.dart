import 'dart:convert';

class IcecreamData {
  List<Icecream> icecreams;

  IcecreamData({
    required this.icecreams,
  });

  // Factory method to create IcecreamData from JSON
  factory IcecreamData.fromJson(Map<String, dynamic> json) {
    return IcecreamData(
      icecreams: List<Icecream>.from(
          json['icecreams'].map((x) => Icecream.fromJson(x))),
    );
  }
}

class Icecream {
  String flavor;
  String? description;
  List<String>? toppings;
  double price;
  String? image;
  List<Ingredient> ingredients;

  Icecream({
    required this.flavor,
    this.description,
    this.toppings,
    required this.price,
    this.image,
    required this.ingredients,
  });

  // Factory method to create Icecream from JSON
  factory Icecream.fromJson(Map<String, dynamic> json) {
    return Icecream(
      flavor: json['flavor'],
      description: json['description'],
      toppings:
          json['toppings'] != null ? List<String>.from(json['toppings']) : null,
      price: json['price'].toDouble(),
      image: json['image'],
      ingredients: List<Ingredient>.from(
          json['ingredients'].map((x) => Ingredient.fromJson(x))),
    );
  }
}

class Ingredient {
  String name;
  String quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });

  // Factory method to create Ingredient from JSON
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}

// Function to parse JSON data into IcecreamData
IcecreamData icecreamDataFromJson(String str) =>
    IcecreamData.fromJson(json.decode(str));
