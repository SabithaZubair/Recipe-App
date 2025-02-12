import 'package:flutter/material.dart';

class RecipeScreen extends StatelessWidget {
  final String foodLbl;
  final String prpTime;
  final String foodRating;
  final String foodImage;
  final String ingredients;

  final String servings;
  final String directions;

  RecipeScreen(
      {required this.foodLbl,
      required this.prpTime,
      required this.foodRating,
      required this.foodImage,
      required this.ingredients,
      required this.servings,
      required this.directions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size(double.infinity, 150),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(foodImage))),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Ingredients',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Text(
              ingredients,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "Servings: $servings ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Directions',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  directions,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  customWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            foodLbl,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            children: [
              Icon(
                Icons.alarm,
                color: Colors.green,
                size: 12,
              ),
              Text(
                prpTime,
                style: TextStyle(fontSize: 12, color: Colors.black38),
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
                foodRating,
                style: TextStyle(fontSize: 12, color: Colors.black38),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.line_axis,
                color: Colors.black,
                size: 12,
              ),
              Text(
                'Easy',
                style: TextStyle(fontSize: 10, color: Colors.black38),
              ),
            ],
          )
        ],
      ),
    );
  }

//   customIngredientsList({required name, required quantities}) {
//     return Column(
//         children: List.generate(name.length, (index) {
//       return Padding(
//         padding: const EdgeInsets.all(9.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(name[index]),
//             Text(
//               quantities[index],
//               style: TextStyle(fontSize: 12.0),
//             )
//           ],
//         ),
//       );
//     }));
//   }
}
