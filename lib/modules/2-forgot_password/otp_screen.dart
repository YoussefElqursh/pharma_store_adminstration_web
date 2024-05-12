import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/leftside.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class OTPScreen extends StatelessWidget {
  static const String routeName = 'OTPScreenRoute';

  const OTPScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const OTPScreen(),
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
                    const EdgeInsets.only(left: 64.0, right: 64.0, top: 50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Verify phone number ',
                      style: TextStyle(
                        color: HexColor(black),
                        fontSize: 28,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Confirm your identity.',
                      style: TextStyle(
                        color: HexColor(black),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'We sent a verification code to 012**75. Please check your mobile device and enter the code.',
                      style: TextStyle(
                        color: HexColor(black),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 60.0),
                    Text(
                      'Verification code',
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
                              hintText: '999-999',
                              hintStyle: TextStyle(
                                color: HexColor(white70),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: HexColor(primary),
                                // Adjust color as needed
                                width: 1.0, // Adjust width as needed
                              ),
                            ),
                          ),
                          child: Text(
                            'Resend code',
                            style: TextStyle(
                              color: HexColor(primary),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor(primary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          navigateTo(context, 'ResetPasswordScreenRoute');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Set the radius here
                        ),
                        child: const Text(
                          'Verify',
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
