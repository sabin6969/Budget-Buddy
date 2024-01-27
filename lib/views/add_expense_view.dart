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
  DateTime now = DateTime.now();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _titleNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();
  final FocusNode _amountNode = FocusNode();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    _titleNode.dispose();
    _amountNode.dispose();
    _descriptionNode.dispose();
    super.dispose();
  }

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
          height: size.height * 0.85,
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
                padding: EdgeInsets.only(top: size.height * 0.25),
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
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            onFieldSubmitted: (value) => FocusScope.of(context)
                                .requestFocus(_descriptionNode),
                            focusNode: _titleNode,
                            validator: (value) => value!.trim().isEmpty
                                ? "This field is required"
                                : null,
                            controller: _titleController,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 14.w,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(
                              labelText: "Enter expense title",
                              prefixIcon: Icon(
                                Icons.title_rounded,
                                size: 22.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            onFieldSubmitted: (value) => FocusScope.of(context)
                                .requestFocus(_amountNode),
                            focusNode: _descriptionNode,
                            validator: (value) => value!.trim().isEmpty
                                ? "This field is required"
                                : null,
                            controller: _descriptionController,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 14.w,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(
                              labelText: "Enter expense description",
                              prefixIcon: Icon(
                                Icons.description,
                                size: 22.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            focusNode: _amountNode,
                            validator: (value) => value!.trim().isEmpty
                                ? "This field is required"
                                : null,
                            controller: _amountController,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontSize: 14.w,
                                  fontWeight: FontWeight.w500,
                                ),
                            decoration: InputDecoration(
                              labelText: "Enter spent amount",
                              prefixIcon: Icon(
                                Icons.currency_rupee,
                                size: 22.w,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              if (value == "") {
                                addExpenseViewModel.changeAmount(0);
                              } else {
                                addExpenseViewModel.changeAmount(
                                  num.tryParse(value) ?? 0,
                                );
                              }
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Consumer<AddExpenseViewModel>(
                            builder: (context, value, child) {
                              return MaterialButton(
                                elevation: 0,
                                color: Colors.red,
                                height: size.height * 0.07,
                                minWidth: size.width,
                                shape: const StadiumBorder(),
                                onPressed: () {
                                  addExpenseViewModel.pickDate(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      addExpenseViewModel.getFormatedDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                            fontSize: 14.w,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    Icon(
                                      Icons.date_range,
                                      size: 22.w,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomAuthButton(
                            buttonName: "Add Expense",
                            onPressed: () {
                              if (_globalKey.currentState!.validate()) {}
                            },
                          )
                        ],
                      ),
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
