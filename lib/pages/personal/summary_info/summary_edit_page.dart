import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_multiline_input.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/pages/personal/candidate_info_vm.dart';
import 'package:spark_hire_app/pages/personal/components/edit_save_btn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SummaryEditPage extends StatefulWidget {
  final CandidateViewModel viewModel;
  const SummaryEditPage({super.key, required this.viewModel});

  @override
  State<SummaryEditPage> createState() => _SummaryEditPageState();
}

class _SummaryEditPageState extends State<SummaryEditPage> {
  late String _profile;

  @override
  void initState() {
    super.initState();
    _profile = widget.viewModel.profile ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissWrapper(
      child: Scaffold(
        appBar: EditAppBar(titleName: AppLocalizations.of(context)!.summaryText),
        bottomNavigationBar: EditSaveBtn(
          onEdit: () async {
            await widget.viewModel.editCandidateProfile(_profile);
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        ),
        body: SafeArea(
          minimum: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            bottom: 10.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomMultilineInput(
                  initialValue: widget.viewModel.profile,
                  title: AppLocalizations.of(context)!.summaryEditText,
                  height: MediaQuery.of(context).size.height * 0.6,
                  maxLength: 600,
                  onChanged: (value) {
                    _profile = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
