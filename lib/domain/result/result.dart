import 'package:flutter/widgets.dart';

class Result<R> {
  const Result();

  static Result<T> success<T>({@required T data}) => Success<T>(data: data);

  static Result<Null> error({dynamic exception}) => Error(throwable: exception);

  static Result<Null> loading() => Loading();

  bool succeeded() {
    if (this is Success) {
      final success = this as Success<R>;
      return success.data != null;
    }
    return false;
  }

  bool isLoading() {
    return this is Loading;
  }

  bool errored() {
    return this is Error;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Result && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class Success<T> extends Result<T> {
  const Success({@required this.data});

  final T data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Success &&
          runtimeType == other.runtimeType &&
          data == other.data;

  @override
  int get hashCode => super.hashCode ^ data.hashCode;
}

class Error extends Result<Null> {
  const Error({@required this.throwable});

  final dynamic throwable;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Error &&
          runtimeType == other.runtimeType &&
          throwable == other.throwable;

  @override
  int get hashCode => super.hashCode ^ throwable.hashCode;
}

class Loading extends Result<Null> {
  // A loading should always be equal to another loading.
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other && other is Loading && runtimeType == other.runtimeType;

  @override
  int get hashCode => super.hashCode;
}
