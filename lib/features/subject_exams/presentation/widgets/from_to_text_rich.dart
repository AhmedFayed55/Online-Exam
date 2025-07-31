import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/font_weight.dart';

class FromToTextRich extends StatelessWidget {
  const FromToTextRich({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "From:  ",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          TextSpan(
            text: "1.00   ",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: AppFontWeight.medium,
            ),
          ),
          TextSpan(
            text: "To:  ",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          TextSpan(
            text: "6.00",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontWeight: AppFontWeight.medium,
            ),
          ),
        ],
      ),
    );
  }
}
