import 'package:ACE/constant/colors.dart';
import 'package:flutter/material.dart';

class Grades extends StatefulWidget {
  const Grades({Key? key}) : super(key: key);

  @override
  State<Grades> createState() => _GradesState();
}

class _GradesState extends State<Grades> {
  List<Map<String, dynamic>> _subjectList = [
    {'code': 'ITE 115', 'grade': '95'},
    {'code': 'ITE 300', 'grade': '95'},
    {'code': 'ITE 302', 'grade': '95'},
    {'code': 'ITE 298', 'grade': '95'},
    {'code': 'ITE 304', 'grade': '95'},
    {'code': 'ITE 303', 'grade': '95'},
    {'code': 'ITE 031', 'grade': '95'},
  ];

  List<String> _gradeList = ['P1', 'P2', 'P3'];

  String _selectedGrade = 'P1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.accentBlack,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            alignment: Alignment.center,
            height: 410,
            width: 360,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(1),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: DataTable(
              border: TableBorder.all(
                color: Colors.grey,
                width: 1.0,
              ),

              //dataRowHeight: 60.0, // set the height of the rows
              columns: [
                DataColumn(
                  label: Text(
                    'SUBJECT CODE',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                DataColumn(
                  label: DropdownButton<String>(
                    value: _selectedGrade,
                    items: _gradeList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGrade = value!;
                      });
                    },
                  ),
                ),
              ],
              rows: _subjectList.map(
                (subject) {
                  return DataRow(cells: [
                    DataCell(Text(subject['code'])),
                    DataCell(
                      TextField(
                        controller:
                            TextEditingController(text: subject['grade']),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onSubmitted: (value) {
                          setState(() {
                            subject['grade'] = value;
                          });
                        },
                      ),
                    ),
                  ]);
                },
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
