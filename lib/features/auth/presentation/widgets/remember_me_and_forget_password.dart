import 'package:flutter/material.dart';
import '../../../../core/l10n/translations/app_localizations.dart';

class RememberMeAndForgetPassword extends StatelessWidget {
  const RememberMeAndForgetPassword({
    super.key,
    required this.isRemember,
    required this.onChanged,
  });

  final bool isRemember;
  final void Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: isRemember, onChanged: onChanged),
            Text(
              AppLocalizations.of(context)!.remember_me,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(fontSize: 13),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            //todo: navigate to forget pass screen
          },
          child: Text(
            '${AppLocalizations.of(context)!.forget_password}?',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
