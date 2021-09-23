import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback callback;

  const GridButton({
    Key? key,
    required this.icon,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 60,
        height: 60,
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
        child: icon,
      ),
      onTap: callback,
    );
  }
}
