import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_ui/model_class.dart';

class RecipeSearchController extends GetxController {
  var allRecipes = <RecommentedRecipe>[].obs;
  var filteredRecipes = <RecommentedRecipe>[].obs;
  var searchController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadRecipes();
  }

  void loadRecipes() {
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
    allRecipes.value = recommentedRecipeFromJson(allrecipeJson);
    filteredRecipes.value = List.from(allRecipes);
  }

  void searchFunctn(enteredvalue) {
    if (enteredvalue.isEmpty) {
      filteredRecipes.value = [];
    } else {
      filteredRecipes.value = allRecipes
          .where((recipe) =>
              recipe.title.toLowerCase().startsWith(enteredvalue.toLowerCase()))
          .toList();
    }
  }
}
