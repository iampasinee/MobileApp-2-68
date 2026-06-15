import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Moneybox extends StatelessWidget {
  String title = "";
  double amount;
  double sizeconHeight;
  double borderRadius;
  Color colorSet;

  Moneybox(
    this.title,
    this.amount,
    this.sizeconHeight,
    this.borderRadius,
    this.colorSet,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
      decoration: BoxDecoration(
        color: colorSet,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      height: sizeconHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              '${NumberFormat("#,###.###").format(amount)}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
