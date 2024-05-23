import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:pharma_store_administration_web/models/category_data_table.dart';
import 'package:pharma_store_administration_web/modules/2-product_module/product_tab/products_screen_options/product_categories_module/product_categories_option/edit_categories.dart';
import 'package:pharma_store_administration_web/modules/2-product_module/product_tab/products_screen_options/product_categories_module/product_categories_option/view_categories.dart';
import 'package:pharma_store_administration_web/shared/style/colors.dart';

class CategoryTable extends StatefulWidget {
  final List<CategoryData> data; // List of PharmacyData

  const CategoryTable({super.key, required this.data});

  @override
  State<CategoryTable> createState() => _CategoryTableState();
}

class _CategoryTableState extends State<CategoryTable> {
  late List<CategoryData> filterData;

  int rowsPerPage = 10;
  int currentPage = 0;
  bool sortAscending = true;

  @override
  void initState() {
    super.initState();
    filterData = widget.data;
  }

  @override
  void didUpdateWidget(CategoryTable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      filterData = widget.data;
    }
  }

  void _openViewCategoriesScreen() {
    showDialog(
      context: context,
      builder: (context) => const ViewCategories(),
    );
  }

  void _openEditCategoriesScreen() {
    showDialog(
      context: context,
      builder: (context) => const EditCategories(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (filterData.isEmpty) {
      return const Center(
        child: Text('No data available'),
      );
    }

    int numberOfPages = (filterData.length / rowsPerPage).ceil();
    var pages = List.generate(
      numberOfPages,
      (index) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowHeight: 44,
          dataRowMaxHeight: 72,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFFAFBFB)),
              borderRadius: BorderRadius.circular(16)),
          border: TableBorder.all(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              color: const Color(0xFFFAFBFB),
              style: BorderStyle.none),
          headingTextStyle: const TextStyle(
            color: Color(0xff42526d),
            fontSize: 10,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          headingRowColor: const MaterialStatePropertyAll(Color(0xfffbfafb)),
          columns: [
            const DataColumn(
              label: Text('ID'),
            ),
            DataColumn(
              onSort: (columnIndex, ascending) {
                setState(() {
                  sortAscending = !sortAscending;
                  if (sortAscending) {
                    filterData.sort((a, b) => a.name.compareTo(b.name));
                  } else {
                    filterData.sort((a, b) => b.name.compareTo(a.name));
                  }
                });
              },

              label: const Row(
                children: [
                  Text('Name'),
                  SizedBox(width: 10),
                  Icon(Icons.sort)
                ],
              ),
            ),
            const DataColumn(
              label: Text('Description'),
            ),
            const DataColumn(
              label: Text(''),
            ),
          ],
          rows: List.generate(
            rowsPerPage,
                (index) {
              int dataIndex = currentPage * rowsPerPage + index;
              if (dataIndex >= filterData.length) {
                return null;
              }
              return _dataRow(filterData[dataIndex]);
            },
          ).whereType<DataRow>().toList(),
        ),
      ),
    );

    return Column(
      children: [
        pages[currentPage],
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Row(
            children: [
               Text(
                'Showing ${currentPage * rowsPerPage + 1} to ${(currentPage + 1) * rowsPerPage} of ${filterData.length} entries',
                style: const TextStyle(
                  color: Color(0xFF6B788E),
                  fontSize: 10,
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
                  onPageChange: (index) {
                    setState(() {
                      currentPage = index;
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

  DataRow _dataRow(CategoryData data) {
    return DataRow(
      cells: [
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.015,
            child: Text(
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
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.125,
            child: Text(
              data.name,
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Text(
              data.description,
              style: const TextStyle(
                color: Color(0xFF23262A),
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.075,
            child: Row(
              children: [
                const Spacer(),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem<String>(
                      value: 'View',
                      onTap: _openViewCategoriesScreen,
                      child: const Text('View'), // Call function here
                    ),
                    PopupMenuItem<String>(
                      value: 'Edit',
                      onTap: _openEditCategoriesScreen,
                      child: const Text('Edit'), // Call function here
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
