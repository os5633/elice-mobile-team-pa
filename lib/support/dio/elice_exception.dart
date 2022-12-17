class EliceException implements Exception {
  const EliceException([
    this.message,
  ]);

  final String? message;

  factory EliceException.fromCode(int? code) {
    switch (code) {
      case 401:
        return const EliceException("인증에 실패 하였습니다.");
      case 403:
        return const EliceException("인증에 실패 하였습니다.");
      case 404:
        return const EliceException("정상적인 요청이 아닙니다.");
      case 503:
        return const EliceException("유효하지 않은 요청입니다.");
      default:
        return EliceException("알 수 없는 오류입니다. 관리자에게 문의하세요.\n$code");
    }
  }
}
