import 'package:flutter/material.dart';

extension WhenExtension<T, R> on AsyncSnapshot<T?> {
  R when({
    required R Function(T? data) data,
    required R Function(Object? error, StackTrace? stackTrace) error,
    required R Function() loading,
  }) {
    if (connectionState == ConnectionState.waiting) return loading();
    if (hasError) return error(error, stackTrace);
    return data(this.data);
  }
}

extension MaybeWhenExtension<T, R> on AsyncSnapshot<T?> {
  R maybeWhen({
    R Function(T? data)? data,
    R Function(Object? error, StackTrace? stackTrace)? error,
    R Function()? loading,
    required R Function() orElse,
  }) {
    assert(
      data != null || error != null || loading != null,
      'At least one of the functions must be non-null',
    );

    if (loading != null && (connectionState == ConnectionState.waiting)) {
      return loading();
    }

    if (error != null && hasError) {
      return error(error, stackTrace);
    }

    if (data != null && hasData) {
      return data(this.data);
    }

    return orElse();
  }
}
