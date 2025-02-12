import 'package:flutter/material.dart';

import 'package:readmore/readmore.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({super.key});

  List<Icon> recipeIcon = [
    Icon(Icons.food_bank),
    Icon(Icons.oil_barrel),
    Icon(Icons.lunch_dining),
    Icon(Icons.dinner_dining),
    Icon(Icons.breakfast_dining),
  ];
  List<Widget> recipetitle = [
    Text('Spaghetti'),
    Text('Olive Oil'),
    Text('Red Pepper Flakes'),
    Text('Parsley'),
    Text('Onion'),
  ];

  List<Widget> recilpetrailing = [
    Text('225g'),
    Text('60g'),
    Text('1/2 tsp'),
    Text('10g'),
    Text('4 cloves'),
  ];

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
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx_NSBGrTqQRNr6r1SmpwFbeI3IEDu0SIcxBJRnQ74hFytlRKLC_r4g7JkoSa1uj3LWUc&usqp=CAU'))),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customWidget(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ReadMoreText(
                'Spaghetti aglio e olio is a simple yet delicious italian pasta dish. Its made with spaghetti noodles,garlic,redchillies,freshcream,chicken,vegetables',
                trimExpandedText: 'show less',
                trimCollapsedText: 'More',
                moreStyle: TextStyle(color: Colors.green.shade600),
                style: TextStyle(color: Colors.black45),
                trimMode: TrimMode.Line,
                trimLength: 240,
                isExpandable: true,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Ingredients',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                  itemCount: recipeIcon.length,
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      leading: recipeIcon[index],
                      title: recipetitle[index],
                      trailing: recilpetrailing[index],
                    );
                  }),
            ),
            Text(
              'Directions',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  '1. Fill a large pot,Traditional spaghetti aglio e olio is made with fresh peperoncini (red hot chile peppers) that are commonly found throughout Italy. But since they are harder to find in other countries, I have written this recipe using dried crushed red pepper flakes, which we will simmer in the olive oil to bring out their best flavor.But since they are harder to find in other countries, I have written this recipe using dried crushed red pepper flakes, which we will simmer in the olive oil to bring out their best flavor.But since they are harder to find in other countries, I have written this recipe using dried crushed red pepper flakes, which we will simmer in the olive oil to bring out their best flavor.',
                  style: TextStyle(color: Colors.black45),
                ),
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 30,
      //   width: 60,
      //   color: Colors.green,
      // ),
    );
  }

  customWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Spaghetti Oglio',
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
              '20 mins',
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
              '4.9',
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
    );
  }
}
