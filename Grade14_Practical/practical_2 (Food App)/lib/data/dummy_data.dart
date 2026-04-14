import 'package:flutter/material.dart';
import 'package:practical_2/model/dish_model.dart';
import 'package:practical_2/model/restaurant_model.dart';

List<RestaurantModel> dummyRestaurant = [

  RestaurantModel(
    id: 1,
    title: "The Gourmet Kitchen",
    subtitle: "Italian • Pasta • Salads • \$2.99 delivery",
    deliveryTime: "25-35 min",
    country: "Italy",
    imgPath: "assets/restaurants/1.png",
    rate: 4.5,
    dishes: [
      DishModel(
        id: 1,
        title: "Fried Calamari",
        subtitle: "Crispy fried calamari served with lemon",
        imgPath: "assets/dishes/1.png",
        price: 7.99,
      ),
      DishModel(
        id: 2,
        title: "Bruschetta",
        subtitle: "Toasted bread with tomatoes and basil",
        imgPath: "assets/dishes/2.png",
        price: 5.49,
      ),
      DishModel(
        id: 3,
        title: "Caprese Salad",
        subtitle: "Tomatoes with mozzarella and fresh basil",
        imgPath: "assets/dishes/3.png",
        price: 6.25,
      ),
    ],
  ),
  RestaurantModel(
    id: 2,
    title: "Sushi Central",
    subtitle: "Japanese • Sushi • Rolls • Free delivery",
    deliveryTime: "30-40 min",
    country: "Japan",
    imgPath: "assets/restaurants/2.png",
    rate: 4.8,
    dishes: [
      DishModel(
        id: 4,
        title: "Creamy Pasta",
        subtitle: "Creamy pasta with herbs and cheese",
        imgPath: "assets/dishes/4.png",
        price: 8.99,
      ),
      DishModel(
        id: 5,
        title: "Grilled Chicken",
        subtitle: "Juicy grilled chicken with vegetables",
        imgPath: "assets/dishes/5.png",
        price: 9.49,
      ),
      DishModel(
        id: 6,
        title: "Grilled Steak",
        subtitle: "Steak served with vegetables and sauce",
        imgPath: "assets/dishes/6.png",
        price: 12.99,
      ),
    ],
  ),
  RestaurantModel(
    id: 3,
    title: "Burger Bliss",
    subtitle: "American • Burgers • Fries • \$1.99 delivery",
    deliveryTime: "20-30 min",
    country: "USA",
    imgPath: "assets/restaurants/3.png",
    rate: 4.6,
    dishes: [
      DishModel(
        id: 7,
        title: "Berry Pancakes",
        subtitle: "Pancakes with syrup and fresh berries",
        imgPath: "assets/dishes/7.png",
        price: 5.99,
      ),
      DishModel(
        id: 8,
        title: "Healthy Salad Bowl",
        subtitle: "Fresh salad with avocado and veggies",
        imgPath: "assets/dishes/8.png",
        price: 7.25,
      ),
      DishModel(
        id: 9,
        title: "Seafood Plate",
        subtitle: "Shrimp and fish with lemon butter sauce",
        imgPath: "assets/dishes/9.png",
        price: 13.99,
      ),
    ],
  ),

];

List<List<dynamic>> foodTypes = [
  ["All", Icons.tune],
  ["Pizza", Icons.local_pizza],
  ["Sushi", Icons.ramen_dining],
  ["Burger", Icons.lunch_dining],
];

List<String> categories = [
  "Appetzers",
  "Pizza",
  "Pasta",
  "Dessert",
];