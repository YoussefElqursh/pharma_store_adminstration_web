import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/leftside.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreenRoute';

  const LoginScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            child: LeftSide(),
          ),
          Expanded(
            child: rightSide(context),
          ),
        ],
      ),
    );
  }

  Widget rightSide(BuildContext context) {
    return Stack(
      children: [
        setPhoto(
          kind: 1,
          path: 'assets/images/Card-login-background.svg',
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Container(
              height: 545,
              decoration: BoxDecoration(
                color: HexColor(white),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: HexColor(bWhite90),
                    offset: const Offset(0, 32),
                    blurRadius: 64,
                    spreadRadius: -12,
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 64.0, right: 64.0, top: 60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Log',
                              style: TextStyle(
                                color: Color(0xff23262a),
                                fontSize: 28,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: 'in',
                              style: TextStyle(
                                color: Color(0xff4a72ff),
                                fontSize: 28,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ' ',
                              style: TextStyle(
                                color: Color(0xff23262a),
                                fontSize: 28,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        style: TextStyle(
                          color: Color(0xff23262a),
                          fontSize: 28,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 56.0),
                    Text(
                      'Username',
                      style: TextStyle(
                        color: HexColor(black),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: HexColor(bWhite90),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                  color: HexColor(white70),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Password',
                      style: TextStyle(
                        color: HexColor(black),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: HexColor(bWhite90),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: HexColor(white70),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                              ),
                              border: InputBorder.none,
                              suffixIcon: const Icon(Icons.visibility_outlined),
                              suffixIconColor: HexColor(black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          navigateTo(context, 'ForgotPasswordScreenRoute');
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: HexColor(primary),
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 56.0),
                    Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor(primary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          navigateTo(context, 'HomeScreenRoute');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Set the radius here
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
