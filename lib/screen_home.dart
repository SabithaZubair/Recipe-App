import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_ui/model_class.dart';

import 'package:recipe_ui/screen_recipe.dart';
import 'package:recipe_ui/screen_search.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Icon> categoryIcon = [
    Icon(
      Icons.breakfast_dining,
      color: Colors.yellow,
    ),
    Icon(
      Icons.lunch_dining,
      color: Colors.brown,
    ),
    Icon(
      Icons.dinner_dining,
      color: Colors.red,
    ),
    Icon(
      Icons.fastfood,
      color: Colors.orange,
    ),
    Icon(
      Icons.icecream,
      color: Colors.yellow,
    )
  ];

  List<String> categoryLabel = [
    'Breakfast',
    'Lunch',
    'Dessert',
    'Noodles',
    'Fruits'
  ];

  List<String> recipefoodRating = ['4.9', '5.0'];

  late List<RecommentedRecipe> recommentedRecipes;
  late List<RecommentedRecipe> recipeOfWeek;
  late List<RecommentedRecipe> allRecipes;
  late List<RecommentedRecipe> filteredRecipes;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    String jsonString = json.encode([
      {
        "title": "Stracciatella ",
        "ingredients":
            "3 1/2 c Chicken broth; homemade|1 lb Fresh spinach; wash/trim/chop|1 Egg|1 c Grated parmesan cheese; --or--|1 c Romano cheese; freshly grated|Salt and pepper; to taste",
        "servings": "4 servings",
        "instructions":
            "Bring 1 cup of the broth to a boil. Add spinach and cook until softened but still bright green. Remove spinach with a slotted spoon and set aside. Add remaining broth to pot. Bring to a boil. Meanwhile, beat egg lightly with a fork. Beat in 1/4 cup of cheese. When broth boils pour in egg mixture, stirring constantly for a few seconds until it cooks into rags Add reserved spinach, salt and pepper. Serve immediately, passing remaining cheese. NOTES: Someone asked for this recipe a while back. I believe this soup, known as Stracciatella is synonymous with Italian Wedding Soup, however, I seem to remember from I-don't-know-where that Italian Wedding Soup is the same as this but with the addition of tiny meatballs.",
        "time": "25 min",
        "rating": "4.9",
        "image":
            "https://thecozycook.com/wp-content/uploads/2019/10/Italian-Wedding-Soup-f.jpg",
      },
      {
        "title": "Italian Wedding Soup",
        "ingredients":
            "1/2 lb Ground beef|1/2 lb Ground veal|1/4 c Italian seasoned bread crumb|1 Egg|1 tb Parsley|Salt and pepper to taste|4 c Chicken broth|2 c Spinach leaves cut into piec|1/4 c Grated Pecorino Romano chees",
        "servings": "1 Servings",
        "instructions":
            "Combine the ground meat, bread crumbs, egg, parsley, salt and pepper in a bowl. Mix well and form into tiny meat balls. Bake on a cookie sheet for 30 minutes at 350F. Meanwhile, bring broth to a boil and add spinach. Cover and boil for 5 minutes. Add the meatballs to the hot broth, bring to a simmer. Stir in the cheese and serve immediately. Rita in Scottsdale 01/02/92 01:41 am",
        "time": "45 min",
        "rating": "5.0",
        "image":
            "https://www.sandravalvassori.com/wp-content/uploads/2021/01/20210120-Capture0024-2-1.jpg",
      },
      {
        "title": "Stracciatella (Italian Wedding Soup)",
        "ingredients":
            "1 lb Fresh spinach, washed and chopped|1 Egg|1 c Parmesan cheese, * see note|Salt, to taste|Pepper, to taste",
        "servings": "6 Servings",
        "instructions":
            "Bring 1 cup of the broth to a boil. Add spinach and cook until softened but still bright green. Remove spinach with a slotted spoon and set aside. Add remaining broth to pot. Bring to a boil. Meanwhile, beat egg lightly with a fork. Beat in 1/4 cup of cheese. When broth boils pour in egg mixture, stirring constantly for a few seconds until it cooks into reags Add reserved spinach, salt and pepper. Serve immediately, passing remaining cheese.",
        "time": "15 min",
        "rating": "4.8",
        "image":
            "https://thehealthyepicurean.com/wp-content/uploads/2015/01/Italian-Wedding-Soup-1-2-scaled.jpg",
      },
    ]);
    // TODO: implement initState

    recommentedRecipes = recommentedRecipeFromJson(jsonString);

    String jsonstring = json.encode([
      {
        "title": "Beef Sandwich",
        "ingredients":
            "1 lb Fresh spinach, washed and chopped|1 Egg|1 c Parmesan cheese, * see note|Salt, to taste|Pepper, to taste",
        "servings": "6 Servings",
        "instructions":
            "Bring 1 cup of the broth to a boil. Add spinach and cook until softened but still bright green. Remove spinach with a slotted spoon and set aside. Add remaining broth to pot. Bring to a boil. Meanwhile, beat egg lightly with a fork. Beat in 1/4 cup of cheese. When broth boils pour in egg mixture, stirring constantly for a few seconds until it cooks into reags Add reserved spinach, salt and pepper. Serve immediately, passing remaining cheese.",
        "time": "15 min",
        "rating": "4.8",
        "image":
            "https://insanelygoodrecipes.com/wp-content/uploads/2022/12/Delicious-Homemade-Steak-Sandwich-with-Onions-and-Spinach.jpg",
      },
      {
        "title": "Salad Dressing",
        "ingredients":
            "1 lb Fresh spinach, washed and chopped|1 Egg|1 c Parmesan cheese, * see note|Salt, to taste|Pepper, to taste",
        "servings": "6 Servings",
        "instructions":
            "Bring 1 cup of the broth to a boil. Add spinach and cook until softened but still bright green. Remove spinach with a slotted spoon and set aside. Add remaining broth to pot. Bring to a boil. Meanwhile, beat egg lightly with a fork. Beat in 1/4 cup of cheese. When broth boils pour in egg mixture, stirring constantly for a few seconds until it cooks into reags Add reserved spinach, salt and pepper. Serve immediately, passing remaining cheese.",
        "time": "15 min",
        "rating": "4.8",
        "image":
            "https://simple-veganista.com/wp-content/uploads/2012/12/creamy-hemp-seed-salad-dressing-recipe-1.jpg"
      }
    ]);

    recipeOfWeek = recommentedRecipeFromJson(jsonstring);
    String allrecipeJson = json.encode([
      {
        "title": "Stracciatella ",
        "ingredients":
            "3 1/2 c Chicken broth; homemade|1 lb Fresh spinach; wash/trim/chop|1 Egg|1 c Grated parmesan cheese; --or--|1 c Romano cheese; freshly grated|Salt and pepper; to taste",
        "servings": "4 servings",
        "instructions":
            "Bring 1 cup of the broth to a boil. Add spinach and cook until softened but still bright green. Remove spinach with a slotted spoon and set aside. Add remaining broth to pot. Bring to a boil. Meanwhile, beat egg lightly with a fork. Beat in 1/4 cup of cheese. When broth boils pour in egg mixture, stirring constantly for a few seconds until it cooks into rags Add reserved spinach, salt and pepper. Serve immediately, passing remaining cheese. NOTES: Someone asked for this recipe a while back. I believe this soup, known as Stracciatella is synonymous with Italian Wedding Soup, however, I seem to remember from I-don't-know-where that Italian Wedding Soup is the same as this but with the addition of tiny meatballs.",
        "time": "25 min",
        "rating": "4.9",
        "image":
            "https://thecozycook.com/wp-content/uploads/2019/10/Italian-Wedding-Soup-f.jpg",
      },
      {
        "title": "Italian Wedding Soup",
        "ingredients":
            "1/2 lb Ground beef|1/2 lb Ground veal|1/4 c Italian seasoned bread crumb|1 Egg|1 tb Parsley|Salt and pepper to taste|4 c Chicken broth|2 c Spinach leaves cut into piec|1/4 c Grated Pecorino Romano chees",
        "servings": "1 Servings",
        "instructions":
            "Combine the ground meat, bread crumbs, egg, parsley, salt and pepper in a bowl. Mix well and form into tiny meat balls. Bake on a cookie sheet for 30 minutes at 350F. Meanwhile, bring broth to a boil and add spinach. Cover and boil for 5 minutes. Add the meatballs to the hot broth, bring to a simmer. Stir in the cheese and serve immediately. Rita in Scottsdale 01/02/92 01:41 am",
        "time": "45 min",
        "rating": "5.0",
        "image":
            "https://www.sandravalvassori.com/wp-content/uploads/2021/01/20210120-Capture0024-2-1.jpg",
      },
      {
        "title": "Stracciatella (Italian Wedding Soup)",
        "ingredients":
            "1 lb Fresh spinach, washed and chopped|1 Egg|1 c Parmesan cheese, * see note|Salt, to taste|Pepper, to taste",
        "servings": "6 Servings",
        "instructions":
            "Bring 1 cup of the broth to a boil. Add spinach and cook until softened but still bright green. Remove spinach with a slotted spoon and set aside. Add remaining broth to pot. Bring to a boil. Meanwhile, beat egg lightly with a fork. Beat in 1/4 cup of cheese. When broth boils pour in egg mixture, stirring constantly for a few seconds until it cooks into reags Add reserved spinach, salt and pepper. Serve immediately, passing remaining cheese.",
        "time": "15 min",
        "rating": "4.8",
        "image":
            "https://thehealthyepicurean.com/wp-content/uploads/2015/01/Italian-Wedding-Soup-1-2-scaled.jpg",
      },
      {
        "title": "Beef Sandwich",
        "ingredients":
            "1 lb Fresh spinach, washed and chopped|1 Egg|1 c Parmesan cheese, * see note|Salt, to taste|Pepper, to taste",
        "servings": "6 Servings",
        "instructions":
            "Bring 1 cup of the broth to a boil. Add spinach and cook until softened but still bright green. Remove spinach with a slotted spoon and set aside. Add remaining broth to pot. Bring to a boil. Meanwhile, beat egg lightly with a fork. Beat in 1/4 cup of cheese. When broth boils pour in egg mixture, stirring constantly for a few seconds until it cooks into reags Add reserved spinach, salt and pepper. Serve immediately, passing remaining cheese.",
        "time": "15 min",
        "rating": "4.8",
        "image":
            "https://insanelygoodrecipes.com/wp-content/uploads/2022/12/Delicious-Homemade-Steak-Sandwich-with-Onions-and-Spinach.jpg",
      },
      {
        "title": "Salad Dressing",
        "ingredients":
            "1 lb Fresh spinach, washed and chopped|1 Egg|1 c Parmesan cheese, * see note|Salt, to taste|Pepper, to taste",
        "servings": "6 Servings",
        "instructions":
            "Bring 1 cup of the broth to a boil. Add spinach and cook until softened but still bright green. Remove spinach with a slotted spoon and set aside. Add remaining broth to pot. Bring to a boil. Meanwhile, beat egg lightly with a fork. Beat in 1/4 cup of cheese. When broth boils pour in egg mixture, stirring constantly for a few seconds until it cooks into reags Add reserved spinach, salt and pepper. Serve immediately, passing remaining cheese.",
        "time": "15 min",
        "rating": "4.8",
        "image":
            "https://simple-veganista.com/wp-content/uploads/2012/12/creamy-hemp-seed-salad-dressing-recipe-1.jpg"
      },
    ]);
    allRecipes = recommentedRecipeFromJson(allrecipeJson);
    filteredRecipes = List.from(allRecipes);

    // searchController.addListener(() {
    //   setState(() {
    //     filteredRecipes = allRecipes
    //         .where((recipe) => recipe.title
    //             .toLowerCase()
    //             .contains(searchController.text.toLowerCase()))
    //         .toList();
    //   });
    // });
  }

  void searchFunctn(enteredvalue) {
    setState(() {
      if (enteredvalue == null) {
        filteredRecipes = [];
      } else {
        filteredRecipes = allRecipes
            .where((recipe) => recipe.title
                .toLowerCase()
                .startsWith(enteredvalue.toLowerCase()))
            .toList();
      }
    });
  }

  // @override
  // void dispose() {
  //   searchController.dispose();
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Hi Chriz!'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.waving_hand_rounded,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Got a tasty dish in mind?',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 300,
                          height: 45,
                          child: TextField(
                            onChanged: searchFunctn,
                            controller: searchController,
                            decoration: InputDecoration(
                                hintText: 'Search any recipes',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Icon(
                              Icons.tune_outlined,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    searchController.text.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: filteredRecipes.length,
                            itemBuilder: (BuildContext context, index) {
                              final recipe = filteredRecipes[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return RecipeScreen(
                                      foodLbl: filteredRecipes[index].title,
                                      prpTime: recipe.time,
                                      foodRating: recipe.rating,
                                      foodImage: recipe.image,
                                      ingredients: recipe.ingredients,
                                      servings: recipe.servings,
                                      directions: recipe.instructions,
                                    );
                                  }));
                                },
                                child: ListTile(
                                  leading: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(recipe.image))),
                                  ),
                                  title: Text(recipe.title),
                                  subtitle: Row(
                                    children: [
                                      Icon(
                                        Icons.alarm,
                                        color: Colors.green,
                                        size: 12,
                                      ),
                                      Text(
                                        recipe.time,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black38),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade600,
                                        size: 12,
                                      ),
                                      Text(
                                        recipe.rating,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black38),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                        : Container(),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  height: 110,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryIcon.length,
                      itemBuilder: (BuildContext context, index) {
                        return categoryItems(
                            icon: categoryIcon[index],
                            label: categoryLabel[index]);
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                customRowHeading(
                    heading: 'Recommented for you', name: 'See more'),
                Container(
                  height: 170,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommentedRecipes.length,
                      itemBuilder: (BuildContext context, index) {
                        return customFoodRecommentation(
                            directions: recommentedRecipes[index].instructions,
                            image: recommentedRecipes[index].image,
                            label: recommentedRecipes[index].title,
                            time: recommentedRecipes[index].time,
                            rating: recommentedRecipes[index].rating,
                            servings: recommentedRecipes[index].servings,
                            ingredients: recommentedRecipes[index].ingredients,
                            context: context);
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                customRowHeading(
                    heading: 'Recipes of the week', name: 'See more'),
                Container(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recipeOfWeek.length,
                      itemBuilder: (BuildContext context, index) {
                        return customRecipeFood(
                            recipefoodImage: recipeOfWeek[index].image,
                            recipefoodLabel: recipeOfWeek[index].title,
                            recipeprepTime: recipeOfWeek[index].time,
                            recipefoodRating: recipeOfWeek[index].rating,
                            Servings: recipeOfWeek[index].servings,
                            directions: recipeOfWeek[index].instructions,
                            context: context,
                            ingredients: recipeOfWeek[index].ingredients);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  categoryItems({
    required icon,
    required label,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: icon,
          ),
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }

  customFoodRecommentation(
      {required image,
      required label,
      required time,
      required rating,
      required BuildContext context,
      required servings,
      required directions,
      required ingredients}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return RecipeScreen(
            foodLbl: label,
            prpTime: time,
            foodRating: rating,
            foodImage: image,
            ingredients: ingredients,
            servings: servings,
            directions: directions,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(image)),
              ),
            ),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  Icons.alarm,
                  color: Colors.green,
                  size: 15,
                ),
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black26,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                Text(
                  rating,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black26,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  customRowHeading({required heading, required name}) {
    return Row(
      children: [
        Text(
          heading,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          width: 80,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  customRecipeFood({
    required recipefoodImage,
    required recipefoodLabel,
    required recipeprepTime,
    required recipefoodRating,
    required Servings,
    required directions,
    required ingredients,
    required BuildContext context,
  }) {
    // List<String> ingredients;
    // List<String> quantities;

    // Example: Assigning different ingredients based on the label
    // if (recipefoodLabel == 'Beef Sandwich') {
    //   ingredients = [
    //     'Chicken broth',
    //     'Fresh Spinach',
    //     'Egg',
    //     'Grated Parmesan',
    //     'Salt',
    //     'Pepper'
    //   ];
    //   quantities = ['3 1/2 cups', '1 lb', '1', '1 cup', 'To taste', 'To taste'];
    // } else {
    //   ingredients = ['Chicken broth', 'Pasta', 'Greens', 'Meatballs'];
    //   quantities = ['4 cups', '1/2 lb', '1 lb', '10 pcs'];
    // }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return RecipeScreen(
            foodLbl: recipefoodLabel,
            prpTime: recipeprepTime,
            foodRating: recipefoodRating,
            foodImage: recipefoodImage,
            ingredients: ingredients,
            servings: Servings,
            directions: directions,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(recipefoodImage)),
              ),
            ),
            Text(
              recipefoodLabel,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(
                  Icons.alarm,
                  color: Colors.green,
                  size: 15,
                ),
                Text(
                  recipeprepTime,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black26,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                Text(
                  recipefoodRating,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black26,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  customBottomNavigationBar({required icon, required label}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
          child: Column(
            children: [icon, label],
          ),
        ),
      ],
    );
  }
}
