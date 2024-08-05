import 'package:flutter/material.dart';

class MuteButton extends StatelessWidget {
  const MuteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mic_none_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          const Text(
            "Mute",
            // '10:00',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
