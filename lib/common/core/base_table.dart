import 'package:flutter/material.dart';

class BaseTable extends StatelessWidget {
  final List<TableRow>? header;
  TableBorder? headerBorder;
  final List<TableRow>? body;
  final bool? isExpand;
  TableBorder? bodyBorder;
  final Map<int, TableColumnWidth>? columnWidths;
  final ScrollPhysics? physics;

  BaseTable(
      {Key? key,
      this.header,
      this.headerBorder,
      this.body,
      this.isExpand,
      this.bodyBorder,
      this.columnWidths,
      this.physics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bodyBorder ??= const TableBorder(
        horizontalInside: BorderSide(width: 0.5, color: Colors.grey),
        verticalInside: BorderSide(width: 0.5, color: Colors.grey));
    Widget view;
    ScrollController horizontalController = ScrollController();
    ScrollController horizontalHeaderController = ScrollController();
    horizontalController.addListener(() {
      horizontalHeaderController.jumpTo(horizontalController.offset);
    });
    if (isExpand ?? true) {
      view = Expanded(
        child: Scrollbar(
          controller: horizontalController,
          isAlwaysShown: true,
          scrollbarOrientation: ScrollbarOrientation.bottom,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: horizontalController,
            child: SingleChildScrollView(
              controller: ScrollController(),
              scrollDirection: Axis.vertical,
              child: Container(
                constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                child: Table(
                    border: bodyBorder,
                    // defaultColumnWidth: FixedColumnWidth(MediaQuery.of(context).size.width / 4),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: columnWidths,
                    children: body ?? []),
              ),
            ),
          ),
        ),
      );
    } else {
      view = Table(border: bodyBorder, columnWidths: columnWidths, children: body ?? []);
    }
    return Column(
      children: [
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: horizontalHeaderController,
            physics: const NeverScrollableScrollPhysics(),
            child: Table(columnWidths: columnWidths, border: headerBorder, children: header ?? [])),
        view
      ],
    );
  }
}
