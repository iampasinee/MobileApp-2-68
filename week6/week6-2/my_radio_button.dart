import 'package:flutter/material.dart';
import 'form.dart';

enum ProductTypeEnum { Downloadable, Deliverable, OnShop, Reserver }

class MyRadioButton extends StatelessWidget {
  MyRadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.selectProductType,
    required this.onChanged,
  });

  final String title;
  final ProductTypeEnum value;
  final ProductTypeEnum? selectProductType;
  final Function(ProductTypeEnum?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile(
        title: Text(title),
        value: value,
        groupValue: selectProductType,
        dense: true,
        contentPadding: EdgeInsets.all(0),
        onChanged: onChanged,
      ),
    );
  }
}
