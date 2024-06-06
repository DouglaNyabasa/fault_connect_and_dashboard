import 'package:flutter/material.dart';

class MapKeyItem extends StatelessWidget {
  const MapKeyItem({
    super.key,
    required this.keyName,
    required this.keyDescription,
    required this.keyColor,
  });
  final String keyName;
  final String keyDescription;
  final Color keyColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                keyName,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              Text(keyDescription),
            ],
          ),
        ),
        Icon(
          Icons.circle,
          color: keyColor,
        ),
      ],
    );
  }
}
