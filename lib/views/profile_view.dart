import 'package:budgetbuddy/constants/app_image_path.dart';
import 'package:budgetbuddy/constants/firebase_services.dart';
import 'package:budgetbuddy/main.dart';
import 'package:budgetbuddy/models/user.dart';
import 'package:budgetbuddy/view_models/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  final UserModel? me;
  const ProfileView({
    super.key,
    this.me,
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final ProfileViewModel profileViewModel =
        Provider.of<ProfileViewModel>(context);
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Card(
                elevation: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.w,
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60.w,
                        backgroundImage: widget.me!.profileImageUrl == null
                            ? const AssetImage(
                                AppImagePath.defaultAvatar,
                              )
                            : NetworkImage(
                                widget.me!.profileImageUrl!,
                              ) as ImageProvider,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        FirebaseServies.firebaseAuth.currentUser!.email!,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 16.w,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10.w,
                  ),
                ),
                shadowColor: Colors.black,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: Column(
                    children: [
                      TextFormField(
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 14.w,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        initialValue: widget.me!.displayName,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            CupertinoIcons.person_alt_circle,
                            size: 26.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 14.w,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                        maxLines: null,
                        initialValue: widget.me!.description,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            CupertinoIcons.info,
                            size: 26.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        leading: Icon(
                          Icons.upgrade,
                          size: 26.w,
                        ),
                        onTap: () {},
                        title: Text(
                          "Export Data",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 14.w,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                        ),
                        subtitle: Text(
                          "Get data into your local machine",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12.w,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                        ),
                      ),
                      Divider(
                        thickness: 2.w,
                      ),
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        leading: Icon(
                          Icons.logout_outlined,
                          size: 26.w,
                        ),
                        onTap: () {
                          profileViewModel.signOut(context);
                        },
                        title: Text(
                          "Logout",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 14.w,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                        ),
                        subtitle: Text(
                          "Logout from this device",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12.w,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                        ),
                      ),
                    ],
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
