// Simplified Either class
abstract class Either<L, R> {
  const Either();

  factory Either.left(L value) = Left<L, R>;
  factory Either.right(R value) = Right<L, R>;

  bool get isLeft;
  bool get isRight;

  L get left;
  R get right;

  void either(void Function(L value) onLeft, void Function(R value) onRight);
}

class Left<L, R> implements Either<L, R> {
  final L value;

  const Left(this.value);

  @override
  bool get isLeft => true;

  @override
  bool get isRight => false;

  @override
  L get left => value;

  @override
  R get right => throw StateError("There is no right value in Left.");

  @override
  void either(void Function(L value) onLeft, void Function(R value) onRight) {
    onLeft(value);
  }
}

class Right<L, R> implements Either<L, R> {
  final R value;

  const Right(this.value);

  @override
  bool get isLeft => false;

  @override
  bool get isRight => true;

  @override
  L get left => throw StateError("There is no left value in Right.");

  @override
  R get right => value;

  @override
  void either(void Function(L value) onLeft, void Function(R value) onRight) {
    onRight(value);
  }
}
