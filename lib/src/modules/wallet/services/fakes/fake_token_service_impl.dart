import 'package:waves_crypto_app/src/modules/wallet/models/token.dart';
import 'package:waves_crypto_app/src/modules/wallet/services/interfaces/token_service.dart';
import 'package:waves_crypto_app/src/shared/assets/images.dart';

class FakeTokenServiceImpl implements TokenService {
  final delay = const Duration(seconds: 2);

  @override
  Future<List<Token>> getTokens() async {
    await Future.delayed(delay);
    return _tokens;
  }
}

final _tokens = [
  Token(
    name: 'Waves',
    value: 5.0054,
    icon: AppImages.token1,
    isMyToken: false,
    isHidden: false,
    isSuspicious: false,
  ),
  Token(
    name: 'Pigeon',
    value: 1444.04556321,
    icon: AppImages.token2,
    isMyToken: true,
    isHidden: false,
    isSuspicious: false,
  ),
  Token(
    name: 'US Dollar',
    value: 199.24,
    icon: AppImages.token3,
    isMyToken: false,
    isHidden: false,
    isSuspicious: false,
  ),
  Token(
    name: 'Token A',
    value: 895.0054,
    icon: AppImages.token3,
    isMyToken: false,
    isHidden: true,
    isSuspicious: false,
  ),
  Token(
    name: 'Token B',
    value: 205.0054,
    icon: AppImages.token3,
    isMyToken: false,
    isHidden: true,
    isSuspicious: false,
  ),
  Token(
    name: 'Token C',
    value: 275.0054,
    icon: AppImages.token3,
    isMyToken: false,
    isHidden: false,
    isSuspicious: true,
  ),
  Token(
    name: 'Token D',
    value: 305.0054,
    icon: AppImages.token3,
    isMyToken: false,
    isHidden: true,
    isSuspicious: true,
  ),
  Token(
    name: 'Token E',
    value: 237.0054,
    icon: AppImages.token3,
    isMyToken: false,
    isHidden: true,
    isSuspicious: true,
  ),
];
