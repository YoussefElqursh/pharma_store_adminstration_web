import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/leftside.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = 'ForgotPasswordScreenRoute';

  const ForgotPasswordScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ForgotPasswordScreen(),
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
                    Text(
                      'Forgot password',
                      style: TextStyle(
                        color: HexColor(black),
                        fontSize: 28,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'We need to verify your identity.',
                      style: TextStyle(
                        color: HexColor(black),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Enter a phone number to get a text message with a verification code.',
                      style: TextStyle(
                        color: HexColor(black),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 70.0),
                    Text(
                      'Phone number',
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            '+20',
                            style: TextStyle(
                              color: HexColor(black),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 56,
                            width: 2,
                            margin: const EdgeInsets.only(
                              left: 15,
                            ),
                            decoration: BoxDecoration(
                              color: HexColor(bWhite90),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  hintText: '999-9999-999',
                                  hintStyle: TextStyle(
                                    color: HexColor(white70),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                  ),
                                  border: InputBorder.none),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 88),
                    Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor(primary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          navigateTo(context, 'OTPScreenRoute');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Set the radius here
                        ),
                        child: const Text(
                          'Send',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          navigateTo(context, 'LoginScreenRoute');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: HexColor(primary),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Back to login page',
                              style: TextStyle(
                                color: HexColor(primary),
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
