import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrofy/core/themes/app_sizes.dart';
import 'package:masrofy/core/themes/app_theme.dart';
import 'package:masrofy/core/themes/theme_mode_provider.dart';
import 'package:masrofy/core/widgets/custom_buttons.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Masrofy',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,

            themeMode: themeMode,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

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
            ],
          ),
        ),
      ),
    );
  }
}
