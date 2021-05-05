import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_app_1/constants.dart';
import 'package:sample_app_1/screens/details_screen.dart';
import 'package:sample_app_1/widgets/bottom_nav_bar.dart';
import 'package:sample_app_1/widgets/category_card.dart';
import 'package:sample_app_1/widgets/search_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farm_snap',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFF455A64),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFF455A64),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .99,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      children: <Widget>[
                        CategoryCard(
                          title: "TOMATO",
                          svgSrc: "assets/images/TT1.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "TOMATO",
                          svgSrc: "assets/images/TT2.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "TOMATO",
                          svgSrc: "assets/images/TT3.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "TOMATO",
                          svgSrc: "assets/images/TT4.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "TOMATO",
                          svgSrc: "assets/images/TT5.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "TOMATO",
                          svgSrc: "assets/images/TT6.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
