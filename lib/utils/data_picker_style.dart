import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataPicker extends StatefulWidget {
  DateTime dateTime;
  DateTime enddateTime = DateTime(2025);
  String lable;

  DataPicker({this.dateTime, this.lable, this.enddateTime});
  @override
  _DataPickerState createState() => _DataPickerState();
}

class _DataPickerState extends State<DataPicker> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(), //add(Duration(days: 1)),
          firstDate:
              widget.dateTime, // DateTime(2000), //add(Duration(days: 1)),
          lastDate:
              widget.enddateTime, // DateTime(2025), //.add(Duration(days: 90)),
          //  initialDate: widget.dateTime,
          // firstDate: DateTime(2020),
          // lastDate: widget.dateTime,
        ).then((data) {
          setState(() {
            widget.dateTime = data;
          });
        });
      },
      child: Container(
        height: size.height * 0.09,
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.orange[800]),
            borderRadius: BorderRadius.circular(
              15.0,
            )),
        child: Center(
          child: ListTile(
            title: Text(
              widget.dateTime == null
                  ? new DateFormat("dd/MM/yyyy", "ar")
                      .format(widget.dateTime = DateTime.now())
                      .toString()
                  : new DateFormat("dd/MM/yyyy", "ar").format(widget.dateTime),
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold),
            ),
            // subtitle: Text(
            //   '${widget.lable}',
            //   style: TextStyle(color: Colors.orange),
            //   textAlign: TextAlign.right,
            //   //textWidthBasis: TextWidthBasis.longestLine,
            // ),
            trailing: Column(
              children: [
                Icon(
                  Icons.date_range,
                  color: Colors.orange,
                ),
                Text(
                  '${widget.lable}',
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                  //textWidthBasis: TextWidthBasis.longestLine,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
