import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ll_test/core/src/widgets/loading_indicator_widget.dart';
import 'package:ll_test/features/auth/presentation/controller/login_controller.dart';
import 'package:ll_test/features/movies/presentation/screens/movies_screen.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  final userNameTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: LoadingIndicatorWidget())
            : Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    SizedBox(height: .33.sh),
                    TextField(
                      controller: userNameTEC,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: passwordTEC,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'password',
                      ),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      child: const Text('Login'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                      ),
                      onPressed: () => controller.login(
                        userName: userNameTEC.text,
                        password: passwordTEC.text,
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(16),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () => Get.offAll(MoviesScreen()),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
