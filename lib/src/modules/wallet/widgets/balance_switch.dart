import 'package:flutter/material.dart';
import 'package:waves_crypto_app/src/modules/wallet/widgets/wallet_card.dart';
import 'package:waves_crypto_app/src/shared/widgets/custom_switch.dart';

class BalanceSwitch extends StatefulWidget {
  const BalanceSwitch({
    Key? key,
  }) : super(key: key);

  @override
  State<BalanceSwitch> createState() => _BalanceSwitchState();
}

class _BalanceSwitchState extends State<BalanceSwitch> {
  bool _showBalance = true;

  void _onToggle(bool value) {
    setState(() {
      _showBalance = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WalletCard(
      icon: CustomSwitch(
        value: _showBalance,
        onToggle: _onToggle,
      ),
      label: 'Balance',
    );
  }
}
