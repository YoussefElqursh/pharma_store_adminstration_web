import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/my_icons_icons.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({super.key, required this.screenName});

  final String screenName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        border: Border.all(
          color: HexColor(bWhite90),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              screenName,
              style: TextStyle(
                color: HexColor(black),
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                  onPressed: (){},
                  icon: const Icon(MyIcons.notification),
                ),
                const SizedBox(width: 25),
                ClipOval(
                  child: Container(
                    width: 45,
                    height: 45,
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
