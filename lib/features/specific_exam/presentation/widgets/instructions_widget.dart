import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helpers/spacing.dart';

import '../../../../core/utils/font_weight.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 24, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Instructions",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          verticalSpace(13),
          const InstructionsTexts(),
          const InstructionsTexts(),
          const InstructionsTexts(),
          const InstructionsTexts(),
        ],
      ),
    );
  }
}

class InstructionsTexts extends StatelessWidget {
  const InstructionsTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "• Lorem ipsum dolor sit amet consectetur.",
      style: Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(fontWeight: AppFontWeight.medium),
    );
  }
}
