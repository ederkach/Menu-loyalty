import 'package:flutter/material.dart';

class LeadingIconAppBar extends StatelessWidget {
  const LeadingIconAppBar({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          iconData,
        ),
      ),
    );
  }
}
