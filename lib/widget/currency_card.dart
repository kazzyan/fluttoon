import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
  });

  final _black = const Color(0xff11f2123);
  final _white = const Color(0xFFffffff);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? _white : _black,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: isInverted ? _black : _white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    amount,
                    style: TextStyle(
                      color: isInverted ? _black : _white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    code,
                    style: TextStyle(
                      color: isInverted ? _black : _white.withOpacity(.8),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Transform.scale(
            scale: 2.2,
            child: Transform.translate(
              offset: const Offset(-5, 12),
              child: Icon(
                icon,
                color: isInverted ? _black : _white,
                size: 88,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
