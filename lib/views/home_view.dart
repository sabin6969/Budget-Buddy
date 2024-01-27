import 'package:budgetbuddy/constants/firebase_services.dart';
import 'package:budgetbuddy/constants/route_names.dart';
import 'package:budgetbuddy/main.dart';
import 'package:budgetbuddy/view_models/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<CircularMenuState> key = GlobalKey<CircularMenuState>();
  late HomeViewModel _homeViewModel;

  @override
  Widget build(BuildContext context) {
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    _homeViewModel.getSelfData();
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            return IconButton(
              onPressed: value.isLoading
                  ? null
                  : () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.profileView,
                        arguments: FirebaseServies.me,
                      );
                    },
              icon: value.isLoading
                  ? const Icon(
                      Icons.person,
                      color: Colors.white,
                    )
                  : FirebaseServies.me.profileImageUrl == null
                      ? Icon(
                          Icons.person,
                          size: 26.w,
                        )
                      : CircleAvatar(
                          radius: 26.w,
                          backgroundImage: NetworkImage(
                            FirebaseServies.me.profileImageUrl!,
                          ),
                        ),
            );
          },
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
      body: Consumer<HomeViewModel>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const LinearProgressIndicator();
          }
          return const Center(
            child: Text("Loaded"),
          );
        },
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
