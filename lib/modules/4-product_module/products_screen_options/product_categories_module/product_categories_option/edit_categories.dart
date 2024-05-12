import 'package:flutter/material.dart';
import 'package:pharma_store_administration_web/modules/4-product_module/products_screen_options/product_categories_module/product_categories_option/confirm_categories.dart';

class EditCategories extends StatelessWidget {
  const EditCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
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
                padding: const EdgeInsets.only(
                    left: 25, top: 15, right: 25, bottom: 10.0),
                child: Row(
                  children: [
                    const Text(
                      'New Category',
                      style: TextStyle(
                        color: Color(0xFF23262A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
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
                padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
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
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: Color(0xFFDC2626),
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
                    TextFormField(
                      decoration: InputDecoration(
                          constraints: const BoxConstraints(maxHeight: 35),
                          hintText: 'Enter name',
                          hintStyle: const TextStyle(
                            color: Color(0xFFB2BAC6),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: const BorderSide(
                                color: Color(0xFFDDE1EB),
                                strokeAlign: BorderSide.strokeAlignCenter,
                                width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: const BorderSide(
                                color: Color(0xFFDDE1EB),
                                strokeAlign: BorderSide.strokeAlignCenter,
                                width: 1),
                          )),
                      initialValue: 'Liquid',
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
                    TextFormField(
                      minLines: 1,
                      maxLines: 10,
                      decoration: InputDecoration(
                          constraints: const BoxConstraints(minHeight: 35),
                          hintText: 'Enter Description',
                          hintStyle: const TextStyle(
                            color: Color(0xFFB2BAC6),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: const BorderSide(
                                color: Color(0xFFDDE1EB),
                                strokeAlign: BorderSide.strokeAlignCenter,
                                width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                            borderSide: const BorderSide(
                                color: Color(0xFFDDE1EB),
                                strokeAlign: BorderSide.strokeAlignCenter,
                                width: 1),
                          )),
                      initialValue:
                          'Liquid medicines are most commonly used by patients who have difficulties swallowing tablets and capsules such as children and the elderly.',
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 71,
                          height: 36,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5F6FA),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: MaterialButton(
                            height: 36,
                            minWidth: 71,
                            onPressed: () {},
                            child: const Text(
                              'Discard ',
                              style: TextStyle(
                                color: Color(0xFF60656E),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 113,
                          height: 35,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF4A71FF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: MaterialButton(
                            height: 35,
                            minWidth: 113,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => const ConfirmCategories(),
                              );
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Save Changes ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
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
