import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/leftside.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class SuccessPasswordScreen extends StatelessWidget {
  static const String routeName = 'SuccessPasswordScreenRoute';

  const SuccessPasswordScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SuccessPasswordScreen(),
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
                    const EdgeInsets.only(left: 64.0, right: 64.0, top: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    setPhoto(kind: 1, path: 'assets/images/verified.svg'),
                    const SizedBox(height: 30),
                    Text(
                      'Successful password reset!',
                      style: TextStyle(
                        color: HexColor(black),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'You can now use your new password to log in to your account.',
                      style: TextStyle(
                        color: HexColor(black),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 105),
                    Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: HexColor(primary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          navigateTo(context, 'LoginScreenRoute');
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
