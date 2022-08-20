import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waves_crypto_app/src/config/service_locator.dart';
import 'package:waves_crypto_app/src/modules/wallet/controllers/tokens_controller.dart';

class ProvidersWrapper extends StatelessWidget {
  const ProvidersWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => serviceLocator<TokensController>()),
      ],
      child: child,
    );
  }
}
