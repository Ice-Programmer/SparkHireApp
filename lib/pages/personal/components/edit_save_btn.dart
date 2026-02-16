import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditSaveBtn extends StatelessWidget {
  final VoidCallback? onEdit;
  final bool disable;

  const EditSaveBtn({super.key, required this.onEdit, this.disable = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 36.h),
      child: CustomButton(
        onPressed: onEdit,
        title: AppLocalizations.of(context)!.save,
        textColor: Theme.of(context).colorScheme.onPrimary,
        btnWidth: double.infinity,
        btnHeight: 50.w,
        fontSize: 18.sp,
        borderRadius: 30.w,
        backgroundColor: Theme.of(context).colorScheme.primary,
        disable: disable,
      ),
    );
  }
}
