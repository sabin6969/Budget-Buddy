import 'package:budgetbuddy/constants/app_image_path.dart';
import 'package:budgetbuddy/constants/app_strings.dart';
import 'package:budgetbuddy/constants/route_names.dart';
import 'package:budgetbuddy/main.dart';
import 'package:budgetbuddy/views/boading/boading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoadingView extends StatefulWidget {
  const BoadingView({super.key});

  @override
  State<BoadingView> createState() => _BoadingViewState();
}

class _BoadingViewState extends State<BoadingView> {
  final PageController _controller = PageController();
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: size.height * 0.1),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  value == 2 ? _isLastPage = true : _isLastPage = false;
                  setState(() {});
                },
                controller: _controller,
                children: const [
                  BoadingContainerWidget(
                    imagePath: AppImagePath.handHoldingMoney,
                    title: AppStrings.boadingPageOneTitle,
                    subTitle: AppStrings.boadingPageOneSubtitle,
                  ),
                  BoadingContainerWidget(
                    imagePath: AppImagePath.moneyFlow,
                    title: AppStrings.boadingPageTwoTitle,
                    subTitle: AppStrings.boadingPageTwoSubtitle,
                  ),
                  BoadingContainerWidget(
                    imagePath: AppImagePath.plan,
                    title: AppStrings.boadingPageThreeTitle,
                    subTitle: AppStrings.boadingPageThreeSubtitle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _isLastPage
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: size.height * 0.037,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xFF7F3DFF),
                      ),
                      fixedSize: MaterialStatePropertyAll(
                        Size(
                          size.width * 0.9,
                          size.height * 0.07,
                        ),
                      ),
                      shape: const MaterialStatePropertyAll(
                        StadiumBorder(),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RouteNames.loginView);
                    },
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 18.w,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                )
              ],
            )
          : SizedBox(
              height: size.height * 0.15,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // navigate to last page when pressed on skip
                      _controller.jumpToPage(3);
                    },
                    child: Text(
                      "Skip",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      onDotClicked: (index) => _controller.jumpToPage(index),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Text(
                      "Next",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
