import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/models/data_table.dart';
import 'package:pharma_store_administration_web/modules/7-order_module/order_screen.dart';
import 'package:pharma_store_administration_web/shared/components/widget/back_screen_header.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackScreenHeader(
          backScreenName: 'Orders',
          goBack: () {
            Navigator.push(context, OrderScreen.route());
          },
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
                        'Order Details',
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
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 70.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 30.0),
                                              child: Text(
                                                'ID:',
                                                style: TextStyle(
                                                  color: Color(0xFF60656E),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 35.0),
                                              child: Text(
                                                'Date:',
                                                style: TextStyle(
                                                  color: Color(0xFF60656E),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 85.0),
                                              child: Text(
                                                'From:',
                                                style: TextStyle(
                                                  color: Color(0xFF60656E),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Address:',
                                              style: TextStyle(
                                                color: Color(0xFF60656E),
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 70.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 30.0),
                                              child: Text(
                                                '#01254',
                                                style: TextStyle(
                                                  color: Color(0xFF23262A),
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 30.0),
                                              child: Text(
                                                '25-8-2020',
                                                style: TextStyle(
                                                  color: Color(0xFF23262A),
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 30.0),
                                              child: Text(
                                                'Avano Pharma\nIbnsina\nEl Motahadah',
                                                style: TextStyle(
                                                  color: Color(0xFF23262A),
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 30.0),
                                              child: Text(
                                                '089 Kutch Green Apt. 448',
                                                style: TextStyle(
                                                  color: Color(0xFF23262A),
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30, width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 70.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 30.0),
                                              child: Text(
                                                'State:',
                                                style: TextStyle(
                                                  color: Color(0xFF60656E),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(bottom: 35.0),
                                              child: Text(
                                                'Time:',
                                                style: TextStyle(
                                                  color: Color(0xFF60656E),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'To:',
                                              style: TextStyle(
                                                color: Color(0xFF60656E),
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 70.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(bottom: 30.0),
                                              child: Container(
                                                width: 110,
                                                height: 28,
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 2),
                                                decoration: ShapeDecoration(
                                                  color: const Color(0xFFECFDF3),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(50),
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Delivered',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF009781),
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(bottom: 30.0),
                                              child: Text(
                                                '10:30 AM',
                                                style: TextStyle(
                                                  color: Color(0xFF23262A),
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(bottom: 30.0),
                                              child: Text(
                                                'El Nahas',
                                                style: TextStyle(
                                                  color: Color(0xFF23262A),
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          const Divider(
                            height: 1,
                            color: Color(0xFFDDE1EB),
                          ),
                          const SizedBox(height: 40),
                          DataTable(
                            columnSpacing:
                                (MediaQuery.of(context).size.width - 240) / 16,
                            dataRowMaxHeight: 48,
                            headingTextStyle: const TextStyle(
                              color: Color(0xFF23262A),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                            headingRowColor: const MaterialStatePropertyAll(
                                Color(0xffffffff)),
                            columns: const [
                              DataColumn(label: Text('Product')),
                              DataColumn(label: Text('Store')),
                              DataColumn(
                                label: Text('Public Price'),
                              ),
                              DataColumn(
                                label: Text('Quantity'),
                              ),
                              DataColumn(
                                label: Text('Price after Discount'),
                              ),
                              DataColumn(
                                label: Text('Product Total'),
                              ),
                            ],
                            rows: List.generate(demoData.length,
                                (index) => _dataRow(demoData[index])),
                          ),
                          const SizedBox(height: 35.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 430,
                                height: 150,
                                decoration: const BoxDecoration(color: Colors.white),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 260,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 50,
                                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              border: Border(
                                                bottom: BorderSide(width: 1, color: Color(0xFFEAECF0)),
                                              ),
                                            ),
                                            child: const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Total Before Discount ',
                                                      style: TextStyle(
                                                        color: Color(0xFF23262A),
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 50,
                                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(width: 1, color: Color(0xFFEAECF0)),
                                              ),
                                            ),
                                            child: const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Total Discount ',
                                                  style: TextStyle(
                                                    color: Color(0xFF23262A),
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 50,
                                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(width: 1, color: Color(0xFFEAECF0)),
                                              ),
                                            ),
                                            child: const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Total After Discount',
                                                  style: TextStyle(
                                                    color: Color(0xFF23262A),
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 170,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 50,
                                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(width: 1, color: Color(0xFFEAECF0)),
                                              ),
                                            ),
                                            child: const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'EGP 5000.00',
                                                  style: TextStyle(
                                                    color: Color(0xFF23262A),
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 50,
                                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(width: 1, color: Color(0xFFEAECF0)),
                                              ),
                                            ),
                                            child: const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'EGP 500.00 ',
                                                        style: TextStyle(
                                                          color: Color(0xFF23262A),
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '(6%)',
                                                        style: TextStyle(
                                                          color: Color(0xFF23262A),
                                                          fontSize: 14,
                                                          fontFamily: 'Poppins',
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 50,
                                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(width: 1, color: Color(0xFFEAECF0)),
                                              ),
                                            ),
                                            child: const Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'EGP 4500.00',
                                                  style: TextStyle(
                                                    color: Color(0xFF23262A),
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
          ),
        ),
      ],
    );
  }

  DataRow _dataRow(Data data) {
    Color? bColor;
    Color? fColor;
    switch (data.state) {
      case 'Delivered':
        bColor = HexColor('#ECFDF3');
        fColor = HexColor('#009881');
      case 'On Hold':
        bColor = HexColor('#FFFADF');
        fColor = HexColor('#ECA600');
      case 'On Way':
        bColor = HexColor('#E9F3FF');
        fColor = HexColor('#4A72FF');
    }
    return DataRow(
      cells: [
        DataCell(
          Text(
            '${data.id}',
            style: const TextStyle(
              color: Color(0xFF23262A),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        DataCell(
          Text(
            data.from,
            style: const TextStyle(
              color: Color(0xFF23262A),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        DataCell(
          Text(
            data.to,
            style: const TextStyle(
              color: Color(0xFF23262A),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        DataCell(
          Text(
            data.dateTime,
            style: const TextStyle(
              color: Color(0xFF23262A),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        DataCell(
          Container(
            width: 73,
            height: 26,
            decoration: BoxDecoration(
              color: bColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                data.state,
                style: TextStyle(
                  color: fColor,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'View Profile',
                onTap: () {},
                child: const Text('View Profile'), // Call function here
              ),
            ],
          ),
        ),
      ],
    );
  }
}
