import 'package:flutter/material.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;

  const MyMessageCard({
    super.key,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    Brightness currentBrightness = Theme.of(context).brightness;

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.9,
        ),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(0.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          color: currentBrightness == Brightness.light
              ? const Color.fromRGBO(187, 240, 195, 1)
              : const Color.fromRGBO(8, 105, 87, 0.992),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.05,
                  left: MediaQuery.of(context).size.width * 0.02,
                  right: MediaQuery.of(context).size.width * 0.06,
                  top: MediaQuery.of(context).size.width * 0.02,
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 16,
                    color: currentBrightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 12,
                        color: currentBrightness == Brightness.light
                            ? Colors.grey.shade800
                            : Colors.white70,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.done_all_rounded,
                      size: 20,
                      color: currentBrightness == Brightness.light
                          ? Colors.grey.shade700
                          : Colors.white70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
