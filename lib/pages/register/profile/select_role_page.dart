import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/components/custom_select_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectRolePage extends StatefulWidget {
  const SelectRolePage({super.key});

  @override
  SelectRolePageState createState() => SelectRolePageState();
}

class SelectRolePageState extends State<SelectRolePage> {
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    final bool isButtonEnabled = _selectedRole != null;

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.switchRoleHeaderText,
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),

            8.verticalSpace,

            Text(
              AppLocalizations.of(context)!.switchRoleSubTitleText,
              style: TextStyle(
                fontSize: 15.sp,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
                height: 1.4,
              ),
            ),

            40.verticalSpace,

            CustomSelectCard(
              title: AppLocalizations.of(context)!.employeeCardTitle,
              description: AppLocalizations.of(context)!.employeeCardSubText,
              icon: Icons.work_outline,
              isSelected: _selectedRole == 'employee',
              onTap: () {
                setState(() {
                  _selectedRole = 'employee';
                });
              },
            ),

            CustomSelectCard(
              title: AppLocalizations.of(context)!.employerCardTitle,
              description: AppLocalizations.of(context)!.employerCardSubText,
              icon: Icons.people_outline,
              isSelected: _selectedRole == 'employer',
              onTap: () {
                setState(() {
                  _selectedRole = 'employer';
                });
              },
            ),

            20.verticalSpace,

            CustomButton(
              onPressed: () => {context.go("/login/mail")},
              title: AppLocalizations.of(context)!.nextStep,
              textColor: Theme.of(context).colorScheme.onPrimary,
              btnWidth: double.infinity,
              btnHeight: 60.w,
              fontSize: 18.sp,
              borderRadius: 12.w,
              backgroundColor: Theme.of(context).colorScheme.primary,
              isShadow: false,
              disable: !isButtonEnabled,
              disableSplash: true,
            ),
          ],
        ),
      ),
    );
  }
}
