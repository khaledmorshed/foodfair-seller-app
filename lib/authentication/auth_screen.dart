import 'package:flutter/material.dart';
import 'package:foodfair_seller_app/authentication/login_screen.dart';
import 'package:foodfair_seller_app/presentation/color_manager.dart';
import 'package:foodfair_seller_app/widgets/container_decoration.dart';
import 'package:foodfair_seller_app/widgets/custom_text_form_field.dart';
import '../widgets/custom_button.dart';
import 'registration_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // TextEditingController? emailController = TextEditingController();
  // TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(top: 200),
        //height: MediaQuery.of(context).size.height,
        decoration: ContainerDecoration().decoaration(),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
                  child: Image.asset(
                    "assets/images/seller.png",
                    //scale: 2,
                    //height: MediaQuery.of(context).size.height * 0.30,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginScreen(),
                    // ElevatedButton(
                    //   child: const Text(
                    //     "Login",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     primary: Colors.cyan,
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 50, vertical: 10),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //   ),
                    //   onPressed: () {
                    //     //formValidation();
                    //   },
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      onTap: () {},
                      //icon: Icons.check_outlined,
                      text: "sign in",
                      buttonColor: ColorManager.orange4,
                      boxShadowColorTop: ColorManager.amber2,
                      boxShadowColorDown: ColorManager.blue3,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationScreen()),
                        );
                      },
                      //icon: Icons.check_outlined,
                      text: "sign up",
                      buttonColor: ColorManager.orange4,
                      boxShadowColorTop: ColorManager.amber2,
                      boxShadowColorDown: ColorManager.blue3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
