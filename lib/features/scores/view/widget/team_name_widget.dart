import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamNameWidget extends StatelessWidget {
  final String data;
  const TeamNameWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
