import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:waves_crypto_app/src/modules/wallet/controllers/tokens_controller.dart';
import 'package:waves_crypto_app/src/modules/wallet/screens/bottosheets/my_address_bottomsheet.dart';
import 'package:waves_crypto_app/src/modules/wallet/screens/leasing_tabview.dart';
import 'package:waves_crypto_app/src/modules/wallet/screens/tokens_tabview.dart';
import 'package:waves_crypto_app/src/modules/wallet/widgets/balance_switch.dart';
import 'package:waves_crypto_app/src/modules/wallet/widgets/wallet_card.dart';
import 'package:waves_crypto_app/src/shared/models/failure.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/spacing.dart';
import 'package:waves_crypto_app/src/shared/styles/text.dart';
import 'package:waves_crypto_app/src/shared/widgets/appbars/custom_appbar.dart';
import 'package:waves_crypto_app/src/shared/widgets/appbars/custom_tabbar.dart';
import 'package:waves_crypto_app/src/shared/widgets/appbars/sliver_appbar_delegate.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _getTokens();
    });
  }

  void _getTokens() async {
    final controller = context.read<TokensController>();
    if (controller.tokens.isEmpty) {
      try {
        await controller.getTokens();
      } on Failure {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffF8FAFB),
        appBar: CustomAppBar(
          leading: IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: AppColors.textDefault,
              size: 20.sp,
            ),
            onPressed: () {},
          ),
          actions: [
            Container(
              height: 30.h,
              width: 30.h,
              decoration: const BoxDecoration(
                color: AppColors.textDefault,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person_outline,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
          ],
        ),
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverPadding(
                padding: AppPadding.symetricHorizontalOnly,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wallet',
                        style: AppText.bold500(context).copyWith(
                          fontSize: 12.sp,
                          color: AppColors.grey,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text(
                            'Mobile Team',
                            style: AppText.bold900(context).copyWith(
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.unfold_more_outlined,
                            color: AppColors.grey,
                            size: 15.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const _CardsSection(),
              const _TabsSection(),
            ];
          },
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              TokensTabView(),
              LeasingTabView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardsSection extends StatelessWidget {
  const _CardsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: SizedBox(
          height: 120.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.horizontal,
              vertical: 16.h,
            ),
            physics: const BouncingScrollPhysics(),
            children: [
              WalletCard(
                icon: icon(Icons.qr_code, color: Colors.white),
                label: 'Your address',
                labelColor: Colors.white,
                backgroundColor: Colors.blue,
                onTap: () {
                  myAddressBottomSheet(context);
                },
              ),
              WalletCard(
                icon: icon(Icons.person_outlined),
                label: 'Aliases',
              ),
              const BalanceSwitch(),
              WalletCard(
                icon: icon(Icons.close_fullscreen),
                label: 'Receipts',
              )
            ],
          ),
        ),
      ),
    );
  }

  Icon icon(IconData icon, {Color? color}) {
    return Icon(
      icon,
      color: color ?? AppColors.textDefault,
      size: 20.sp,
    );
  }
}

class _TabsSection extends StatelessWidget {
  const _TabsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 25.h,
        maxHeight: 25.h,
        child: Container(
          color: const Color(0xffF8FAFB),
          child: const CustomTabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Tokens'),
              Tab(text: 'Leasing'),
            ],
          ),
        ),
      ),
    );
  }
}
