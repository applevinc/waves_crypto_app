import 'package:waves_crypto_app/src/modules/wallet/models/token.dart';

abstract class TokenService {
  Future<List<Token>> getTokens();
}
