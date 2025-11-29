import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class RegisterLine extends StatelessWidget {
  const RegisterLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.registerLine,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        8.horizontalSpace,
        InkWell(
          onTap: () => {
            context.push('/register')
          },
          child: Text(
            AppLocalizations.of(context)!.registerName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
