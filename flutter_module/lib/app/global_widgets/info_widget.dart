import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String infoMessage;

  const InfoWidget({
    Key? key,
    required this.infoMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.fromLTRB(12, 12, 12, 4),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1), // (x,y)
            blurRadius: 0.5,
          ),
        ],
      ),
      child: Text(
        infoMessage,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }
}
