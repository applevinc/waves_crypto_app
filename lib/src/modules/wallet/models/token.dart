class Token {
  final String name;
  final double value;
  final String icon;
  final bool isMyToken;
  final bool isSuspicious;
  final bool isHidden;

  Token({
    required this.name,
    required this.value,
    required this.icon,
    required this.isMyToken,
    required this.isHidden,
    required this.isSuspicious,
  });
}
