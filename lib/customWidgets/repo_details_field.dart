import 'package:flutter/material.dart';

class RepositoryDetailsField extends StatelessWidget {

  final String label;
  final String value;

  RepositoryDetailsField({this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              letterSpacing: 2.0,
              color: Colors.grey
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          value,
          style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 24.0,
          ),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
