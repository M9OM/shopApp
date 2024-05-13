import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stylish/controller/auth_controller.dart';
import 'package:stylish/core/common/constants/assets_constants.dart';
import 'package:stylish/core/common/constants/size_constants.dart';
import 'package:stylish/view/screens/auth/login/login_screen.dart';
import 'package:stylish/view/screens/profile/components/card_setting.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../models/setting.dart';
import 'components/header_profile.dart'; // Adjust the import path as needed

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Stream<User?> _userStream;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _userStream = FirebaseAuth.instance.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      progressIndicator: const CircularProgressIndicator(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderProfile(),
            StreamBuilder<User?>(
              stream: _userStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // عرض مؤشر التحميل أثناء تحميل بيانات المستخدم
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  // إذا حدث خطأ أثناء جلب بيانات المستخدم
                  return Center(child: Text('حدث خطأ: ${snapshot.error}'));
                } else {
                  final user = snapshot.data;
                  if (user == null) {
                    // إذا لم يكن المستخدم مسجل الدخول
                    return CardSetting(
                      icon: AssetsConstants.personSvg,
                      title: 'تسجيل الدخول',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    );
                  } else {
                    // إذا كان المستخدم مسجل الدخول
                    return Column(
                      children: [
                        CardSetting(
                          icon: AssetsConstants.personSvg,
                          title: user.email ?? '',
                          subtitle: '',
                          onTap: () {},
                        ),
                        CardSetting(
                          icon: AssetsConstants.logOutSvg,
                          title: 'تسجيل خروج',
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            await AuthController().signOut();
                            setState(() {
                              loading = false;
                            });
                          },
                        ),
                        CardSetting(
                          icon: AssetsConstants.trashSvg,
                          title: 'تعطيل الحساب',
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            await AuthController().deleteAccount(context);
                            setState(() {
                              loading = false;
                            });
                          },
                        ),
                      ],
                    );
                  }
                }
              },
            ),
            // باقي عناصر واجهة المستخدم التي لا تتطلب تهيئة المستخدم
            const SizedBox(height: 40),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Text(
            //     'الاعدادات العامة',
            //     style: Theme.of(context).textTheme.titleLarge,
            //   ),
            // ),
            // const SizedBox(height: 10),
            // Column(
            //   children: List.generate(
            //     settingsItems.length,
            //     (index) => CardSetting(
            //       icon: settingsItems[index].icon,
            //       title: settingsItems[index].title,
            //       onTap: () {
            //         // Handle onTap action
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
