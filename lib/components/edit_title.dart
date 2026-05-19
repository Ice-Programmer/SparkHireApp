import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleName;
  final VoidCallback? onDeletePress;
  final bool needActions;
  final bool centerTitle;
  const EditAppBar({
    super.key,
    required this.titleName,
    this.onDeletePress,
    this.needActions = false,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
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
                  onPressed: () => _showMoreActionSheet(context),
                ),
                8.horizontalSpace,
              ],
    );
  }

  void _showMoreActionSheet(BuildContext context) {
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
                  onTap: () {
                    onDeletePress!();
                    Navigator.pop(context);
                  },
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
