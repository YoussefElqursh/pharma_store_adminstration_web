import 'package:flutter/material.dart';

class ViewCategories extends StatelessWidget {
  const ViewCategories({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:25, top: 15, right: 25,bottom: 10.0),
                child: Row(
                  children: [
                    const Text(
                      'View Category',
                      style: TextStyle(
                        color: Color(0xFF23262A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(Icons.exit_to_app_sharp),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                color: Color(0xFFDDE1EB),
              ),
              Padding(
                padding: const EdgeInsets.only(left:25, top: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Name',
                            style: TextStyle(
                              color: Color(0xFF23262A),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Liquid',
                      style: TextStyle(
                        color: Color(0xFF6B788E),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.10,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Description',
                      style: TextStyle(
                        color: Color(0xFF23262A),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.14,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Liquid medicines are most commonly used by patients who have difficulties swallowing tablets and capsules such as children and the elderly.',
                      style: TextStyle(
                        color: Color(0xFF6B788E),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                            minWidth: 65,
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
                    )
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
