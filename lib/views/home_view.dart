import 'package:budgetbuddy/constants/route_names.dart';
import 'package:budgetbuddy/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_menu/circular_menu.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<CircularMenuState> key = GlobalKey<CircularMenuState>();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.bell,
              size: 25.w,
            ),
          )
        ],
      ),
      floatingActionButton: CircularMenu(
        toggleButtonSize: size.width * 0.09,
        radius: 100,
        toggleButtonColor: Colors.purple,
        toggleButtonBoxShadow: const [
          BoxShadow(),
        ],
        startingAngleInRadian: 1.25 * 3.14,
        endingAngleInRadian: 1.75 * 3.14,
        key: key,
        items: [
          CircularMenuItem(
            boxShadow: const [BoxShadow()],
            icon: Icons.add,
            onTap: () {
              Navigator.pushNamed(context, RouteNames.addExpenseView);
            },
            color: Colors.green,
            iconColor: Colors.white,
          ),
          CircularMenuItem(
            boxShadow: const [BoxShadow()],
            icon: Icons.pie_chart,
            onTap: () {},
            color: Colors.orange,
            iconColor: Colors.white,
          ),
          CircularMenuItem(
            boxShadow: const [
              BoxShadow(),
            ],
            icon: Icons.picture_as_pdf,
            onTap: () {},
            color: Colors.deepPurple,
            iconColor: Colors.white,
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
