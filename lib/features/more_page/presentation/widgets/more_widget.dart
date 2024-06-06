import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:fasn_ecommerce/features/more_page/presentation/widgets/settings_widget.dart';
import 'package:flutter/material.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({
    super.key,
    required this.icon,
    required this.title,
    this.isMain,
    required this.onTap,
    this.isSetting,
    this.settingsIsShow,
    this.settingsIsShowOnTap,
  });
  final IconData icon;
  final String title;
  final bool? isMain;
  final VoidCallback onTap;
  final bool? isSetting;
  final bool? settingsIsShow;
  final VoidCallback? settingsIsShowOnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isMain ?? false ? Colors.transparent : AppColors.violateColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.white,
                  size: isMain ?? false ? 36 : 32,
                ),
                15.wSize,
                Text(
                  title,
                  style:
                      isMain ?? false ? AppStyles.style24 : AppStyles.style20,
                ),
                const Spacer(),
                if (isSetting ?? false)
                  GestureDetector(
                    onTap: settingsIsShowOnTap,
                    child: Icon(
                      settingsIsShow ?? false
                          ? Icons.keyboard_arrow_down_outlined
                          : Icons.keyboard_arrow_right_outlined,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
              ],
            ),
            if (settingsIsShow ?? false) ...{const SettingWidget()}
          ],
        ),
      ),
    );
  }
}
