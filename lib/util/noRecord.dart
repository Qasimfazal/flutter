import 'package:flutter/material.dart';

class NoRecordFound extends StatelessWidget {
  final String msg;
  final IconData icon;

  NoRecordFound(this.msg,this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.indigo),
          SizedBox(
            height: 5,
          ),
          Text(
            msg.isEmpty? "No Record Found!":msg,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Helvetica-Bold",
              fontSize: 15,
              color:Colors.indigo
            ),
          )
        ],
      ),
    );
  }
}
