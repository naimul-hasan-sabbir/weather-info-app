import "package:flutter/material.dart";

class AdditionalInfoItem extends StatelessWidget {
  final IconData icon;
  const AdditionalInfoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          icon,
          size: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text("Humidity"),
        SizedBox(
          height: 8,
        ),
        Text(
          "91",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
