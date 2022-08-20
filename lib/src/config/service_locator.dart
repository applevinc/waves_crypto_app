import 'package:get_it/get_it.dart';
import 'package:waves_crypto_app/src/modules/wallet/controllers/tokens_controller.dart';
import 'package:waves_crypto_app/src/modules/wallet/services/fakes/fake_token_service_impl.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  // controllers
  serviceLocator
      .registerFactory(() => TokensController(tokenService: FakeTokenServiceImpl()));
}
