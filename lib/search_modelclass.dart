import 'dart:convert';

List<SearchRecipe> searchRecipeFromJson(String str) => List<SearchRecipe>.from(
    json.decode(str).map((x) => SearchRecipe.fromJson(x)));

String searchRecipeToJson(List<SearchRecipe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchRecipe {
  String title;
  String time;
  String rating;
  String image;

  SearchRecipe({
    required this.title,
    required this.time,
    required this.rating,
    required this.image,
  });

  factory SearchRecipe.fromJson(Map<String, dynamic> json) => SearchRecipe(
        title: json["title"],
        time: json["time"],
        rating: json["rating"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "time": time,
        "rating": rating,
        "image": image,
      };
}
