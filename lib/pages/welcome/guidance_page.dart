import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/common/assets.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/providers/locale_provider.dart';

/// 引导页数据模型
class OnboardingItem {
  final String title;
  final String subtitle;
  final String imagePath;

  OnboardingItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}

class GuidancePage extends StatefulWidget {
  const GuidancePage({super.key});

  @override
  State<GuidancePage> createState() => _GuidancePageState();
}

class _GuidancePageState extends State<GuidancePage> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            _buildTopButtons(context),

            Expanded(child: _buildCarouselSlider()),

            _buildPageIndicator(),

            100.verticalSpace,

            _buildNavigationButton(context),

            40.verticalSpace,
          ],
        ),
      ),
    );
  }

  List<OnboardingItem> _buildOnboardingData(BuildContext context) {
    return [
      OnboardingItem(
        title: AppLocalizations.of(context)!.guidanceTitle_1,
        subtitle: AppLocalizations.of(context)!.guidanceSubTitle_1,
        imagePath: Assets.assetsImageGuidanceGuidance1,
      ),
      OnboardingItem(
        title: AppLocalizations.of(context)!.guidanceTitle_2,
        subtitle: AppLocalizations.of(context)!.guidanceSubTitle_2,
        imagePath: Assets.assetsImageGuidanceGuidance2,
      ),
      OnboardingItem(
        title: AppLocalizations.of(context)!.guidanceTitle_3,
        subtitle: AppLocalizations.of(context)!.guidanceSubTitle_3,
        imagePath: Assets.assetsImageGuidanceGuidance3,
      ),
    ];
  }

  Widget _buildTopButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton(
            child: Row(
              children: [
                Icon(
                  Icons.language_rounded,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20.sp,
                ),
                Text(
                  " - ${AppLocalizations.of(context)!.languageName}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            onPressed: () {
              _showLanguageModalSheet(context);
            },
          ),

          TextButton(
            onPressed: () {
              context.go("/login");
            },
            child: Text(
              AppLocalizations.of(context)!.skip,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: double.infinity,
        viewportFraction: 1.0,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
      items:
          _buildOnboardingData(
            context,
          ).map((item) => _buildSlide(item)).toList(),
    );
  }

  Widget _buildSlide(OnboardingItem item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              item.imagePath,
              fit: BoxFit.contain,
              height: 250.h,
            ),
          ),
        ),

        Expanded(
          flex: 4,
          child: Column(
            children: [
              40.verticalSpace,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              20.verticalSpace,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Text(
                  item.subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.55),
                    height: 1.8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          _buildOnboardingData(context).asMap().entries.map((entry) {
            final bool isSelected = _current == entry.key;
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.w,
                height: 10.w,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.3),
                  boxShadow:
                      isSelected
                          ? [
                            BoxShadow(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.8),
                              spreadRadius: 4.0,
                            ),
                            BoxShadow(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.3),
                              spreadRadius: 8.0,
                            ),
                          ]
                          : null,
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildNavigationButton(BuildContext context) {
    if (_current == _buildOnboardingData(context).length - 1) {
      return CustomButton(
        onPressed: () => {context.go("/login")},
        title: AppLocalizations.of(context)!.start,
        textColor: Theme.of(context).colorScheme.onPrimary,
        btnWidth: MediaQuery.of(context).size.width * 0.8,
        btnHeight: 64.w,
        fontSize: 18.sp,
        borderRadius: 12.w,
        backgroundColor: Theme.of(context).colorScheme.primary,
        isShadow: false,
      );
    } else {
      return CustomButton(
        onPressed: () {
          if (_current < _buildOnboardingData(context).length - 1) {
            _controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        },
        textColor: Theme.of(context).colorScheme.onPrimary,
        btnWidth: 64.w,
        btnHeight: 64.w,
        fontSize: 20.sp,
        icon: Icons.arrow_forward,
        backgroundColor: Theme.of(context).colorScheme.primary,
        borderRadius: 32.w,
        isShadow: false,
      );
    }
  }

  void _showLanguageModalSheet(BuildContext context) {
    final localeProvider = context.read<LocaleProvider>();
    showMaterialModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      builder:
          (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                child: Text(
                  AppLocalizations.of(context)!.selectLanguage,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ...languageItems.map((language) {
                final bool isSelected =
                    localeProvider.locale.languageCode ==
                    language.locale.languageCode;
                return ListTile(
                  title: Row(
                    children: [
                      _buildFlag(language.flag),
                      20.horizontalSpace,
                      Text(language.text),
                    ],
                  ),
                  onTap: () => localeProvider.setLocale(language.locale),
                  trailing:
                      isSelected
                          ? Icon(
                            Icons.check,
                            color: Theme.of(context).colorScheme.primary,
                          )
                          : null,
                );
              }),

              50.verticalSpace,
            ],
          ),
    );
  }

  Widget _buildFlag(String flag) {
    return Container(
      width: 34.sp,
      height: 30.sp,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      child: SvgPicture.asset(
        flag,
        package: "country_icons",
        fit: BoxFit.contain,
      ),
    );
  }
}
