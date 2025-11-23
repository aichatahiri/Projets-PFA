import 'package:flutter/material.dart';

class DriverHeader extends StatelessWidget {
  const DriverHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4361ee), Color(0xFF7209b7)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.local_shipping, color: Colors.white),
            ),
            const SizedBox(width: 12),
            const Text(
              'BTP Optim',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ],
        ),
      ],
    );
  }
}