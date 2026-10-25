import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/themes/theme_mode_provider.dart';
import 'package:masrofy/core/widgets/custom_buttons.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('appTitle'.tr()),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeModeProvider.notifier).toggleThemeMode();
            },
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.screenPadding),
          child: Column(
            children: [
              Text(
                'description'.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: AppSizes.xl),
              CustomButton(
                text: 'changeLanguage'.tr(),
                onPressed: () {
                  context.setLocale(
                    context.locale.languageCode == 'en'
                        ? const Locale('ar')
                        : const Locale('en'),
                  );
                },
              ),
              SizedBox(height: AppSizes.xl),
            ],
          ),
        ),
      ),
    );
  }
}
