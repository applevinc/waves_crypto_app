import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:waves_crypto_app/src/modules/wallet/controllers/tokens_controller.dart';
import 'package:waves_crypto_app/src/modules/wallet/models/token.dart';
import 'package:waves_crypto_app/src/modules/wallet/widgets/search_textfield.dart';
import 'package:waves_crypto_app/src/modules/wallet/widgets/token_tile.dart';
import 'package:waves_crypto_app/src/shared/styles/colors.dart';
import 'package:waves_crypto_app/src/shared/styles/spacing.dart';
import 'package:waves_crypto_app/src/shared/widgets/empty_screen.dart';
import 'package:waves_crypto_app/src/shared/widgets/tiles/custom_expansion_tile.dart';

class TokensTabView extends StatelessWidget {
  const TokensTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TokensController>(builder: (context, controller, _) {
      if (controller.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.tokens.isEmpty) {
        return const EmptyScreen();
      }

      final tokens = controller.tokens;
      return Padding(
        padding: EdgeInsets.only(
          top: 16.h,
          left: AppPadding.horizontal,
          right: AppPadding.horizontal,
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const _SearchSection(),
            SliverToBoxAdapter(
              child: _TokensListView(tokens, length: 3),
            ),
            const _HiddenTokensSection(),
            const _SuspiciousTokensSection(),
          ],
        ),
      );
    });
  }
}

class _SearchSection extends StatelessWidget {
  const _SearchSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: 16.h),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: SearchWidget(
                onChanged: (query) {},
                onClose: () {},
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.swap_vert,
                color: AppColors.grey,
                size: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HiddenTokensSection extends StatelessWidget {
  const _HiddenTokensSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<TokensController>(
        builder: (context, controller, _) {
          if (controller.hiddenTokens.isEmpty) {
            return const SizedBox.shrink();
          }

          final tokens = controller.hiddenTokens;
          return _TokensExpansionTile(
            label: 'Hidden tokens(${tokens.length})',
            tokens: tokens,
          );
        },
      ),
    );
  }
}

class _SuspiciousTokensSection extends StatelessWidget {
  const _SuspiciousTokensSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<TokensController>(
        builder: (context, controller, _) {
          if (controller.suspiciousTokens.isEmpty) {
            return const SizedBox.shrink();
          }

          final tokens = controller.suspiciousTokens;
          return _TokensExpansionTile(
            label: 'Suspicious tokens(${tokens.length})',
            tokens: tokens,
          );
        },
      ),
    );
  }
}

class _TokensExpansionTile extends StatelessWidget {
  const _TokensExpansionTile({
    Key? key,
    required this.label,
    required this.tokens,
  }) : super(key: key);

  final String label;
  final List<Token> tokens;

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      label: label,
      children: [
        _TokensListView(tokens, tileWidth: 300.w),
      ],
    );
  }
}

class _TokensListView extends StatelessWidget {
  const _TokensListView(this.tokens, {Key? key, this.length, this.tileWidth})
      : super(key: key);

  final List<Token> tokens;
  final int? length;
  final double? tileWidth;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length ?? tokens.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final token = tokens[index];
        return TokenTile(token, width: tileWidth);
      },
    );
  }
}
