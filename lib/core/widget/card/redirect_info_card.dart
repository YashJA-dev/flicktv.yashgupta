import 'package:flutter/material.dart';

class RedirectInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;

  const RedirectInfoCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 14,
        children: [
          Container(
            width: 38,
            height: 38,
            child: Center(child: Image.asset(imageAsset, fit: BoxFit.cover)),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFFAAAAAA),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
