import 'package:flutter/material.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/color.dart';

class GamesTimingScreen extends StatelessWidget {
  const GamesTimingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Materialcolor.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "GAMES TIMING",
          centerTitle: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Materialcolor.greyColor.shade300,
                        offset: const Offset(1, 1))
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: size.width,
                      decoration: const BoxDecoration(
                        color: Materialcolor.thirdColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: const Align(child: Text("Table 1")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                        columnWidths: {
                          0: const FlexColumnWidth(
                              1), // Width of the first column (First Name)
                          1: const FlexColumnWidth(
                              1), // Width of the second column (Start Time)
                          2: const FlexColumnWidth(
                              1), // Width of the third column (End Time)
                        },
                        border: TableBorder.all(
                            color: Colors.black), // Border style for the table

                        children: [
                          const TableRow(
                            decoration: BoxDecoration(
                              color: Colors.blue, // Background color of the row
                            ),
                            children: [
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'First Name',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'Start Time',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text(
                                    'End Time',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey[300], // Background color of the row
                            ),
                            children: [
                              const TableCell(
                                child: Center(
                                  child: Text('John'),
                                ),
                              ),
                              const TableCell(
                                child: Center(
                                  child: Text('09:00 AM'),
                                ),
                              ),
                              const TableCell(
                                child: Center(
                                  child: Text('05:00 PM'),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey[400], // Background color of the row
                            ),
                            children: [
                              const TableCell(
                                child: Center(
                                  child: Text('Jane'),
                                ),
                              ),
                              const TableCell(
                                child: Center(
                                  child: Text('10:00 AM'),
                                ),
                              ),
                              const TableCell(
                                child: Center(
                                  child: Text('06:00 PM'),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey[300], // Background color of the row
                            ),
                            children: [
                              const TableCell(
                                child: Center(
                                  child: Text('John'),
                                ),
                              ),
                              const TableCell(
                                child: Center(
                                  child: Text('09:00 AM'),
                                ),
                              ),
                              const TableCell(
                                child: Center(
                                  child: Text('05:00 PM'),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey[400], // Background color of the row
                            ),
                            children: [
                              const TableCell(
                                child: Center(
                                  child: Text('Jane'),
                                ),
                              ),
                              const TableCell(
                                child: Center(
                                  child: Text('10:00 AM'),
                                ),
                              ),
                              const TableCell(
                                child: Center(
                                  child: Text('06:00 PM'),
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
            const SizedBox(
              height: 100,
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Materialcolor.thirdColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: const Align(
                        child: Text(
                      "GAME NAME A",
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      columnWidths: {
                        0: const FlexColumnWidth(
                            1), // Width of the first column (First Name)
                        1: const FlexColumnWidth(
                            1), // Width of the second column (Start Time)
                        2: const FlexColumnWidth(
                            1), // Width of the third column (End Time)
                      },
                      border: TableBorder.all(
                          color: Colors.black), // Border style for the table

                      children: [
                        const TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blue, // Background color of the row
                          ),
                          children: [
                            TableCell(
                              child: Center(
                                child: Text(
                                  'First Name',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  'Start Time',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Center(
                                child: Text(
                                  'End Time',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[300], // Background color of the row
                          ),
                          children: [
                            const TableCell(
                              child: Center(
                                child: Text('John'),
                              ),
                            ),
                            const TableCell(
                              child: Center(
                                child: Text('09:00 AM'),
                              ),
                            ),
                            const TableCell(
                              child: Center(
                                child: Text('05:00 PM'),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            color:
                                Colors.grey[400], // Background color of the row
                          ),
                          children: [
                            const TableCell(
                              child: Center(
                                child: Text('Jane'),
                              ),
                            ),
                            const TableCell(
                              child: Center(
                                child: Text('10:00 AM'),
                              ),
                            ),
                            const TableCell(
                              child: Center(
                                child: Text('06:00 PM'),
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
          ],
        ),
      ),
    );
  }
}
