import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pharma_store_administration_web/models/data_table.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({super.key});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {

  int numberOfPages = 10;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    var pages = List.generate(numberOfPages, (index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: DataTable(
        columnSpacing: 41.5,
        dataRowMaxHeight: 65,
        decoration: BoxDecoration(
            border: Border.all(color: HexColor(bWhite90)),
            borderRadius: BorderRadius.circular(16)),
        border: TableBorder.all(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12)),
            color: HexColor(bWhite90),
            style: BorderStyle.none),
        headingTextStyle: const TextStyle(
          color: Color(0xff42526d),
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        headingRowColor: const MaterialStatePropertyAll(Color(0xfffbfafb)),
        columns: [
          const DataColumn(label: Text('ID')),
          const DataColumn(label: Text('Photo')),
          DataColumn(
            label: Row(
              children: [
                const Text('Name'),
                const SizedBox(width: 10),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sort_rounded)),
              ],
            ),
          ),
          DataColumn(
            label: Row(
              children: [
                const Text('Category'),
                const SizedBox(width: 10),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sort_rounded)),
              ],
            ),
          ),
          DataColumn(
            label: Row(
              children: [
                const Text('Quantity'),
                const SizedBox(width: 10),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sort_rounded)),
              ],
            ),
          ),
          DataColumn(
            label: Row(
              children: [
                const Text('Public Price'),
                const SizedBox(width: 10),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sort_rounded)),
              ],
            ),
          ),
          DataColumn(
            label: Row(
              children: [
                const Text('Monthly Sales'),
                const SizedBox(width: 10),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sort_rounded)),
              ],
            ),
          ),
        ],
        rows: List.generate(
            demoData.length, (index) => _dataRow(demoData[index])),
      ),
    ));

    return Column(
      children: [
        pages[currentPage],
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            children: [
              const Text(
                '5 of 50 product ',
                style: TextStyle(
                  color: Color(0xFF6B788E),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 500,
                child: NumberPaginator(
                  config: NumberPaginatorUIConfig(
                    buttonShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    buttonSelectedBackgroundColor: HexColor(primary),
                  ),
                  numberPages: numberOfPages,
                  onPageChange: (index){
                    setState(() {
                      currentPage=index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  DataRow _dataRow(Data data) {
    Color? bColor;
    Color? fColor;
    switch( data.state){
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
        DataCell(Text('${data.id}')),
        DataCell(Text(data.from)),
        DataCell(Text(data.to)),
        DataCell(Text(data.dateTime)),
        DataCell(
          Container(
            width: 73,
            height: 26,
            decoration: BoxDecoration(
              color: bColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child:
            Center(
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
          Row(
            children: [
              const Spacer(),
              data.moreIcon,
            ],
          ),
        ),
        const DataCell(Text('')),
      ],
    );
  }

}
