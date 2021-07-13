import '../models/categories.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';

class Data {
  static final CATEGORIES = [
    Category(
      id: 'c1',
      title: 'Italian',
      color: Colors.purple,
    ),
    Category(
      id: 'c2',
      title: 'Quick & Easy',
      color: Colors.red,
    ),
    Category(
      id: 'c3',
      title: 'Hamburgers',
      color: Colors.orange,
    ),
    Category(
      id: 'c4',
      title: 'German',
      color: Colors.amber,
    ),
    Category(
      id: 'c5',
      title: 'Light & Lovely',
      color: Colors.blue,
    ),
    Category(
      id: 'c6',
      title: 'Exotic',
      color: Colors.green,
    ),
    Category(
      id: 'c7',
      title: 'Breakfast',
      color: Colors.lightBlue,
    ),
    Category(
      id: 'c8',
      title: 'Asian',
      color: Colors.lightGreen,
    ),
    Category(
      id: 'c9',
      title: 'French',
      color: Colors.pink,
    ),
    Category(
      id: 'c10',
      title: 'Summer',
      color: Colors.teal,
    ),
  ];


  static final MEALS = [
    Meal(
      id: 'm1',
      categoriesId: [
        'c1',
        'c2',
      ],
      title: 'Spaghetti with Tomato Sauce',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
      ingredients: [
        '4 Tomatoes',
        '1 Tablespoon of Olive Oil',
        '1 Onion',
        '250g Spaghetti',
        'Spices',
        'Cheese (optional)'
      ],
      isSugarFree: false,
      isVegan: true,
    ),
    Meal(
      id: 'm2',
      categoriesId: [
        'c2',
      ],
      title: 'Toast Hawaii',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
      ingredients: [
        '1 Slice White Bread',
        '1 Slice Ham',
        '1 Slice Pineapple',
        '1-2 Slices of Cheese',
        'Butter'
      ],
      isSugarFree: false,
      isVegan: false,
    ),
    Meal(
      id: 'm3',
      categoriesId: [
        'c2',
        'c3',
      ],
      title: 'Classic Hamburger',
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
      ingredients: [
        '300g Cattle Hack',
        '1 Tomato',
        '1 Cucumber',
        '1 Onion',
        'Ketchup',
        '2 Burger Buns'
      ],
      isSugarFree: false,
      isVegan: false,
    ),
    Meal(
      id: 'm4',
      categoriesId: [
        'c4',
      ],
      title: 'Wiener Schnitzel',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
      ingredients: [
        '8 Veal Cutlets',
        '4 Eggs',
        '200g Bread Crumbs',
        '100g Flour',
        '300ml Butter',
        '100g Vegetable Oil',
        'Salt',
        'Lemon Slices'
      ],
      isSugarFree: false,
      isVegan: false,
    ),
    Meal(
      id: 'm5',
      categoriesId: [
        'c2'
            'c5',
        'c10',
      ],
      title: 'Salad with Smoked Salmon',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
      ingredients: [
        'Arugula',
        'Lamb\'s Lettuce',
        'Parsley',
        'Fennel',
        '200g Smoked Salmon',
        'Mustard',
        'Balsamic Vinegar',
        'Olive Oil',
        'Salt and Pepper'
      ],
      isSugarFree: true,
      isVegan: false,
    ),
    Meal(
      id: 'm6',
      categoriesId: [
        'c6',
        'c10',
      ],
      title: 'Delicious Orange Mousse',
      imageUrl:
          'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
      ingredients: [
        '4 Sheets of Gelatine',
        '150ml Orange Juice',
        '80g Sugar',
        '300g Yoghurt',
        '200g Cream',
        'Orange Peel',
      ],
      isSugarFree: true,
      isVegan: false,
    ),
    Meal(
      id: 'm7',
      categoriesId: [
        'c7',
      ],
      title: 'Pancakes',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
      ingredients: [
        '1 1/2 Cups all-purpose Flour',
        '3 1/2 Teaspoons Baking Powder',
        '1 Teaspoon Salt',
        '1 Tablespoon White Sugar',
        '1 1/4 cups Milk',
        '1 Egg',
        '3 Tablespoons Butter, melted',
      ],
      isSugarFree: true,
      isVegan: false,
    ),
    Meal(
      id: 'm8',
      categoriesId: [
        'c8',
      ],
      title: 'Creamy Indian Chicken Curry',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
      ingredients: [
        '4 Chicken Breasts',
        '1 Onion',
        '2 Cloves of Garlic',
        '1 Piece of Ginger',
        '4 Tablespoons Almonds',
        '1 Teaspoon Cayenne Pepper',
        '500ml Coconut Milk',
      ],
      isSugarFree: true,
      isVegan: false,
    ),
    Meal(
      id: 'm9',
      categoriesId: [
        'c9',
      ],
      title: 'Chocolate Souffle',
      imageUrl:
          'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
      ingredients: [
        '1 Teaspoon melted Butter',
        '2 Tablespoons white Sugar',
        '2 Ounces 70% dark Chocolate, broken into pieces',
        '1 Tablespoon Butter',
        '1 Tablespoon all-purpose Flour',
        '4 1/3 tablespoons cold Milk',
        '1 Pinch Salt',
        '1 Pinch Cayenne Pepper',
        '1 Large Egg Yolk',
        '2 Large Egg Whites',
        '1 Pinch Cream of Tartar',
        '1 Tablespoon white Sugar',
      ],
      isSugarFree: true,
      isVegan: false,
    ),
    Meal(
      id: 'm10',
      categoriesId: [
        'c2',
        'c5',
        'c10',
      ],
      title: 'Asparagus Salad with Cherry Tomatoes',
      imageUrl:
          'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
      ingredients: [
        'White and Green Asparagus',
        '30g Pine Nuts',
        '300g Cherry Tomatoes',
        'Salad',
        'Salt, Pepper and Olive Oil'
      ],
      isSugarFree: true,
      isVegan: true,
    ),
  ];
}
