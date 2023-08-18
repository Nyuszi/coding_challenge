import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoResultPlaceholder extends StatelessWidget {
  const NoResultPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: SvgPicture.asset(
            'assets/no_result.svg',
            semanticsLabel: 'no_result',
          ),
        ),
        const Text(
          'No result',
          style: TextStyle(
            fontFamily: 'inter',
            color: Colors.grey
          ),
        )
      ],
    );
  }
}
