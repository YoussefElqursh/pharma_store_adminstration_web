import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class LeftSide extends StatelessWidget {
  const LeftSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120.0, top: 185.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          setPhoto(kind: 1, path: 'assets/images/Logo-app.svg'),
          Text(
            'Welcome to\nPharma Store\nAdministration\nArea.',
            style: TextStyle(
              color: HexColor(black),
              fontSize: 48,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
