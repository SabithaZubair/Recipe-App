import 'package:flutter/material.dart';

class ScreenSave extends StatelessWidget {
  const ScreenSave({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: Size(double.infinity, 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Saved',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search saved recipes',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            )),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              customRowHeading(heading: 'Your Collections', name: 'See more'),
              customfoodpictures(
                  image1:
                      'https://www.justonecookbook.com/wp-content/uploads/2020/04/Ebi-Fry-Fried-Shrimp-1185-I-1-500x500.jpg',
                  image2:
                      'https://www.tessadomesticdiva.com/wp-content/uploads/2011/04/breakfast-salad-14-500x500.jpg',
                  image3:
                      'https://i.ytimg.com/vi/0kE8wDwWI1s/maxresdefault.jpg',
                  text: '39+ recipes'),
              customRowHeading(heading: 'Desserts', name: 'See more'),
              customfoodpictures(
                  image1:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYTiidqbcclhH2zPiWX4XZSwOfuX6crh66mg&s',
                  image2:
                      'https://cdn.pixabay.com/photo/2023/04/15/11/58/donuts-7927510_640.jpg',
                  image3:
                      'https://www.bhg.com/thmb/iL-5Q6gGjmXkxCKqEovughTLQAo=/3000x0/filters:no_upscale():strip_icc()/how-to-bake-how-to-make-cupcakes-hero-01-12c03f3eff374d569b0565bff7d9e597.jpg',
                  text: '17+ recipes'),
              customRowHeading(heading: 'Seafood', name: 'See more'),
              customfoodpictures(
                  image1:
                      'https://www.themediterraneandish.com/wp-content/uploads/2024/02/Egyptian-Fish-Sandwich-10.jpg',
                  image2:
                      'https://images.kosher.com/details.slide/f/a/fash_fish_salad_shutterstock_150059453.jpg',
                  image3:
                      'https://www.ketocookingwins.com/wp-content/uploads/2020/10/salmon-with-lemon-sauce-plated-5.webp',
                  text: '39 recipes'),
              customRowHeading(heading: 'Desserts', name: 'See more'),
              customfoodpictures(
                  image1:
                      'https://www.justonecookbook.com/wp-content/uploads/2020/04/Ebi-Fry-Fried-Shrimp-1185-I-1-500x500.jpg',
                  image2:
                      'https://www.westpark.ie/content/uploads/2019/08/Untitled1.png',
                  image3:
                      'https://i.ytimg.com/vi/0kE8wDwWI1s/maxresdefault.jpg',
                  text: '39+ recipes'),
            ],
          ),
        ));
  }

  customRowHeading({required heading, required name}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Row(
        children: [
          Text(
            heading,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            width: 100,
          ),
          Text(
            name,
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  customfoodpictures(
      {required image1, required image2, required image3, required text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(image1)),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 72.5,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(image2)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 72.5,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(image3)),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
