import 'package:budgetbuddy/view_models/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final TextEditingController budgetController = TextEditingController();

  @override
  void dispose() {
    budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SettingsViewModel settingsViewModel = Provider.of(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.currency_rupee,
                  size: 22.w,
                ),
                onTap: () {
                  settingsViewModel.setMonthyBudgetDialog(
                    context,
                    budgetController,
                  );
                },
                title: Text(
                  "Set Monthly Budget",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16.w,
                      ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              AboutListTile(
                applicationVersion: "1.0.1",
                applicationName: "Budget Buddy",
                aboutBoxChildren: [
                  Text(
                    "Made with ❤️ with Flutter",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 16.w,
                        ),
                  )
                ],
                icon: Icon(
                  Icons.info,
                  size: 22.w,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTile(
                leading: Icon(
                  Icons.help,
                  size: 22.w,
                ),
                onTap: () {},
                title: Text(
                  "Help",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16.w,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
