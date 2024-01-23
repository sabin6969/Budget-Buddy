import 'package:budgetbuddy/main.dart';
import 'package:budgetbuddy/utils/custom_auth_button.dart';
import 'package:budgetbuddy/view_models/add_expense_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddExpenseView extends StatefulWidget {
  const AddExpenseView({super.key});

  @override
  State<AddExpenseView> createState() => _AddExpenseViewState();
}

class _AddExpenseViewState extends State<AddExpenseView> {
  @override
  Widget build(BuildContext context) {
    final AddExpenseViewModel addExpenseViewModel = Provider.of(context);
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Expense",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 16.w,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height * 0.9,
          child: Stack(
            children: [
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      "How Much ?",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 24.w,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Consumer<AddExpenseViewModel>(
                      builder: (context, value, child) {
                        return Text(
                          "Rs ${value.getEnteredAmount}",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 23.w,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.35),
                child: Container(
                  height: size.height - size.height * 0.35,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        30.w,
                      ),
                      topRight: Radius.circular(
                        30.w,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value == "") {
                              addExpenseViewModel.changeAmount(0);
                            } else {
                              addExpenseViewModel.changeAmount(
                                int.tryParse(value) ?? 0,
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextFormField(),
                        SizedBox(
                          height: 30.h,
                        ),
                        CustomAuthButton(
                          buttonName: "Continue",
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
