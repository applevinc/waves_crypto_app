import 'package:waves_crypto_app/src/modules/wallet/models/token.dart';
import 'package:waves_crypto_app/src/modules/wallet/services/interfaces/token_service.dart';
import 'package:waves_crypto_app/src/shared/controllers/base_controller.dart';
import 'package:waves_crypto_app/src/shared/models/failure.dart';

class TokensController extends BaseController {
  final TokenService _tokenService;

  TokensController({required TokenService tokenService}) : _tokenService = tokenService;

  List<Token> _tokens = [];
  List<Token> get tokens => _tokens;
  List<Token> _hiddenTokens = [];
  List<Token> get hiddenTokens => _hiddenTokens;
  List<Token> _suspiciousTokens = [];
  List<Token> get suspiciousTokens => _suspiciousTokens;

  Future<void> getTokens() async {
    try {
      setIsLoading(true);
      _tokens = await _tokenService.getTokens();
      _hiddenTokens = _tokens.where((element) => element.isHidden).toList();
      _suspiciousTokens = _tokens.where((element) => element.isSuspicious).toList();
      setIsLoading(false);
    } on Failure {
      setIsLoading(false);
      rethrow;
    }
  }
}
