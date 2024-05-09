import 'package:flutter/material.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';

class ConfirmCategories extends StatelessWidget {
  const ConfirmCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child:Container(
        width: 350,
        height: 317,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 30,
              offset: Offset(0, 10),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              setPhoto(kind: 1, path: 'assets/images/verified.svg', width: 60, height: 60),
              const SizedBox(height: 30),
              const Text(
                'Changes Saved! ',
                style: TextStyle(
                  color: Color(0xFF23262A),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Your changes saved successfully.',
                style: TextStyle(
                  color: Color(0xFF23262A),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(height: 35),
              Container(
                width: 65,
                height: 35,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF4A71FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                ),
                child: MaterialButton(
                  height: 35,
                  minWidth: 60,
                  onPressed: (){},
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
