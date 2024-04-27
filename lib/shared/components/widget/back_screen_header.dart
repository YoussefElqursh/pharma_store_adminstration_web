import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/my_icons_icons.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class BackScreenHeader extends StatelessWidget {
   const BackScreenHeader(
       {super.key, required this.backScreenName,required this.goBack}
       );

 final String backScreenName;
   final void Function() goBack; // No return type
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
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: IconButton(
                onPressed:goBack,
                icon:setPhoto(kind: 1,path: "assets/images/Arrow_alt_lright_alt.svg"),
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                color: HexColor(black),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              child: Text(backScreenName),

            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
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

      ),
    );
  }

}
