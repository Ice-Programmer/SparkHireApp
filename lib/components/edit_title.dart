import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String titleName;
  final VoidCallback? onDeletePress;
  final bool needActions;
  const EditAppBar({
    super.key,
    required this.titleName,
    this.onDeletePress,
    required this.context,
    this.needActions = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        titleName,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
        ),
      ),
      actions:
          !needActions
              ? []
              : [
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: _showMoreActionSheet,
                ),
                8.horizontalSpace,
              ],
    );
  }

  void _showMoreActionSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (onDeletePress != null)
                ListTile(
                  leading: const Icon(Icons.delete_forever_rounded),
                  title: Text(AppLocalizations.of(context)!.deleteText),
                  onTap: onDeletePress,
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
