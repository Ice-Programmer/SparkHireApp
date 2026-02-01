import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_input.dart';
import 'package:spark_hire_app/components/custom_map_input.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/model/candidate/get_current_candidate.dart';
import 'package:spark_hire_app/pages/geo/geo_edit_page.dart';
import 'package:spark_hire_app/pages/personal/components/edit_save_btn.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContractEditPage extends StatefulWidget {
  final ContractInfo contractInfo;
  const ContractEditPage({super.key, required this.contractInfo});

  @override
  State<ContractEditPage> createState() => _ContractEditPageState();
}

class _ContractEditPageState extends State<ContractEditPage> {
  List<Widget> _buildContractEditForm() {
    return <Widget>[
      Column(
        children: [
          CustomMapInput(
            title: AppLocalizations.of(context)!.addressText,
            backgroundColor: Theme.of(context).colorScheme.inverseSurface,
            defaultValue: widget.contractInfo.geoInfo.address,
            hintText: AppLocalizations.of(context)!.addressHintText,
            height: 50.h,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => GeoEditPage(
                        geoDetailInfo: widget.contractInfo.geoInfo,
                      ),
                ),
              );
            },
          ),

          20.verticalSpace,

          CustomInput(
            height: 50.h,
            backgroundColor: Theme.of(context).colorScheme.inverseSurface,
            hintText: AppLocalizations.of(context)!.phoneNumberHintText,
            inputType: TextInputType.phone,
            onChanged: (value) {},
            title: AppLocalizations.of(context)!.phoneNumberText,
            defaultValue: widget.contractInfo.phone,
          ),

          20.verticalSpace,

          CustomInput(
            height: 50.h,
            backgroundColor: Theme.of(context).colorScheme.inverseSurface,
            onChanged: (value) {},
            title: AppLocalizations.of(context)!.emailText,
            defaultValue: widget.contractInfo.phone,
            enabled: false,
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissWrapper(
      child: Scaffold(
        appBar: EditAppBar(
          titleName: AppLocalizations.of(context)!.summaryText,
        ),
        bottomNavigationBar: EditSaveBtn(onEdit: () => {}),
        body: SafeArea(
          minimum: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: 10.h,
          ),
          child: SingleChildScrollView(
            child: Column(children: [..._buildContractEditForm()]),
          ),
        ),
      ),
    );
  }
}
