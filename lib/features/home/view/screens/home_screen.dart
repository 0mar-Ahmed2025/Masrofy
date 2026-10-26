import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy/core/extensions/build_context.dart';
import 'package:masrofy/core/extensions/widget_extension.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/widgets/custom_app_scaffold.dart';
import 'package:masrofy/features/home/view/widgets/home_app_bar.dart';
import 'package:masrofy/features/home/view/widgets/overview_section.dart';
import 'package:masrofy/features/home/view/widgets/quick_tools.dart';
import 'package:masrofy/features/home/view/widgets/summery_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isDark: context.isDarkMode,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeAppBar(),
            AppSizes.l.verticalSpace,
            const SummeryCard(),
            AppSizes.l.verticalSpace,
            const QuickTools(),
            AppSizes.l.verticalSpace,
            const OverviewSection(),
          ],
        ),
      ).paddingAll(AppSizes.screenPaddingAll),
    );
  }
}
