import 'package:flutter/material.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';
import 'package:pharma_store_administration_web/shared/components/widget/back_screen_header.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BackScreenHeader(
          backScreenName: 'Products',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFDDE1EB),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 30.0, top: 25.0, bottom: 25.0),
                      child: Text(
                        'Edit Product',
                        style: TextStyle(
                          color: Color(0xFF23262A),
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Color(0xFFDDE1EB),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Product Image',
                                  style: TextStyle(
                                    color: Color(0xFF23262A),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '*',
                                  style: TextStyle(
                                    color: Color(0xFFDC2626),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    width: 85,
                                    height: 85,
                                    margin: const EdgeInsets.only(
                                        top: 6, right: 6, bottom: 6),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1.50,
                                            color: Color(0xFFDDE1EB)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    child: Center(
                                      child: setPhoto(
                                          kind: 1,
                                          path: 'assets/images/Frame.svg',
                                          width: 40,
                                          height: 30),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: ClipOval(
                                      child: Container(
                                        width: 22,
                                        height: 22,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: const Color(0xFFDDE1EB),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.edit,
                                          color: Color(0xFFDDE1EB),
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: ClipOval(
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color(0xFFDDE1EB),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.edit,
                                      color: Color(0xFFDDE1EB),
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6.0),
                          const Text(
                            'Upload product image, allowed file types: png, jpg, jpeg.',
                            style: TextStyle(
                              color: Color(0xFFABADAE),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Wrap(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Product Name',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                            color: Color(0xFFDC2626),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    initialValue: 'Colchicine',
                                    style: const TextStyle(
                                      color: Color(0xFF23262A),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      constraints: const BoxConstraints(
                                          maxWidth: 344.75, maxHeight: 42),
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
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFDDE1EB),
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Category',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                            color: Color(0xFFDC2626),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    initialValue: 'Tablet',
                                    style: const TextStyle(
                                      color: Color(0xFF23262A),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      constraints: const BoxConstraints(
                                          maxWidth: 344.75, maxHeight: 42),
                                      hintText: 'Select category',
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
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFDDE1EB),
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Quantity Per Package',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                            color: Color(0xFFDC2626),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    initialValue: '30 Tab',
                                    style: const TextStyle(
                                      color: Color(0xFF23262A),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      constraints: const BoxConstraints(
                                          maxWidth: 344.75, maxHeight: 42),
                                      hintText: 'e.g., 30 tablets',
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
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFDDE1EB),
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Wrap(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Public Price',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                            color: Color(0xFFDC2626),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    initialValue: 'EGP 19.99',
                                    style: const TextStyle(
                                      color: Color(0xFF23262A),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      constraints: const BoxConstraints(
                                          maxWidth: 524.625, maxHeight: 42),
                                      hintText: 'e.g., EGP 19.99',
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
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFDDE1EB),
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Manufacturer Company',
                                          style: TextStyle(
                                            color: Color(0xFF23262A),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                            color: Color(0xFFDC2626),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  TextFormField(
                                    initialValue: 'Pharco',
                                    style: const TextStyle(
                                      color: Color(0xFF23262A),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      constraints: const BoxConstraints(
                                          maxWidth: 524.625, maxHeight: 42),
                                      hintText: 'Enter manufacturer name',
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
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFDDE1EB),
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Drug Class',
                                      style: TextStyle(
                                        color: Color(0xFF23262A),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Color(0xFFDC2626),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                        color: Color(0xFF23262A),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextFormField(
                                    initialValue: 'Analgesics',
                                    style: const TextStyle(
                                      color: Color(0xFF23262A),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      constraints: const BoxConstraints(
                                          maxWidth: double.infinity,
                                          maxHeight: 42),
                                      hintText: 'e.g., Analgesics',
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
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFDDE1EB),
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 7.0),
                                    child: Container(
                                      width: 28,
                                      height: 28,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFF5F6FA),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
                                          size: 16,
                                          color: Color(0xFFB1B9C5),
                                        ),
                                        style: ButtonStyle(
                                          shape: WidgetStatePropertyAll(
                                            ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          ),
                                          padding:
                                              const WidgetStatePropertyAll(
                                            EdgeInsets.all(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Active Ingredients',
                                      style: TextStyle(
                                        color: Color(0xFF23262A),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Color(0xFFDC2626),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  TextFormField(
                                    initialValue: 'Ibuprofen',
                                    style: const TextStyle(
                                      color: Color(0xFF23262A),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: InputDecoration(
                                      constraints: const BoxConstraints(
                                          maxWidth: double.infinity,
                                          maxHeight: 42),
                                      hintText: 'e.g., Ibuprofen',
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
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                        borderSide: const BorderSide(
                                            color: Color(0xFFDDE1EB),
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            width: 1.5),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 7.0),
                                    child: Container(
                                      width: 28,
                                      height: 28,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFF5F6FA),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
                                          size: 16,
                                          color: Color(0xFFB1B9C5),
                                        ),
                                        style: ButtonStyle(
                                          shape: WidgetStatePropertyAll(
                                            ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                          ),
                                          padding:
                                              const WidgetStatePropertyAll(
                                            EdgeInsets.all(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 83,
                                height: 42,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF5F6FA),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                child: MaterialButton(
                                  height: 42,
                                  minWidth: 83,
                                  onPressed: () {},
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Color(0xFF60656E),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 75,
                                height: 42,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF4A71FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                child: MaterialButton(
                                  height: 42,
                                  minWidth: 75,
                                  onPressed: () {},
                                  child: const Text(
                                    'Save',
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
                        ],
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
