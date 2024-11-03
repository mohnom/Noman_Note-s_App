import 'package:flutter/material.dart';


class TiteNotesWidget extends StatelessWidget {
  const TiteNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Notes",
          style: TextStyle(fontSize: 30),
        ),
        Row(
          children: [
            const Text(" Items"),
            IconButton(
                onPressed: () async {},
                icon: const Icon(Icons.swipe_down_alt_outlined))
          ],
        )
      ],
    );
  }
}
