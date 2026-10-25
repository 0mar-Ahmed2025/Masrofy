import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy/core/extensions/build_context.dart';
import 'package:masrofy/core/extensions/widget_extension.dart';
import 'package:masrofy/core/themes/app_colors.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy/features/auth/view/widgets/auth_button.dart';
import 'package:masrofy/features/auth/view/widgets/auth_logo.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return AppScaffold(
      isDark: isDark,
      child: Column(
        children: [
          Spacer(flex: 1),
          AppLogo(),
          AppSizes.l.verticalSpace,
          Text(
            "مصروفي",
            style: context.textTheme.displayLarge!.copyWith(
              color: isDark ? AppColors.white : AppColors.primary,
            ),
          ),
          AppSizes.l.verticalSpace,
          Text(
            "مرحبا بك مجددا في مصروفي",
            style: context.textTheme.titleSmall!.copyWith(
              color: isDark ? AppColors.white : AppColors.primary,
            ),
          ),
          AppSizes.l.verticalSpace,
          Text(
            "أدر مصروفاتك وديونك وأهدافك المالية في مكان واحد",
            style: context.textTheme.titleSmall!.copyWith(
              color: isDark ? AppColors.grey100 : AppColors.primary,
            ),
          ),
          AppSizes.xxxl.verticalSpace,
          AuthBtn().paddingHorizontal(AppSizes.m),
          Spacer(),
        ],
      ),
    );
  }
}
