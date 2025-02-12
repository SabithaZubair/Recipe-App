import 'dart:convert';

List<RecommentedRecipe> recommentedRecipeFromJson(String str) =>
    List<RecommentedRecipe>.from(
        json.decode(str).map((x) => RecommentedRecipe.fromJson(x)));

String recommentedRecipeToJson(List<RecommentedRecipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecommentedRecipe {
  String title;
  String ingredients;
  String servings;
  String instructions;
  String time;
  String rating;
  String image;

  RecommentedRecipe({
    required this.title,
    required this.ingredients,
    required this.servings,
    required this.instructions,
    required this.time,
    required this.rating,
    required this.image,
  });

  factory RecommentedRecipe.fromJson(Map<String, dynamic> json) =>
      RecommentedRecipe(
        title: json["title"],
        ingredients: json["ingredients"],
        servings: json["servings"],
        instructions: json["instructions"],
        time: json["time"],
        rating: json["rating"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "ingredients": ingredients,
        "servings": servings,
        "instructions": instructions,
        "time": time,
        "rating": rating,
        "image": image,
      };
}
