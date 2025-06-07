import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain_result.freezed.dart';

@freezed
class DomainResult<T> with _$DomainResult<T> {
  const factory DomainResult.success(T data) = DomainSuccess<T>;

  const factory DomainResult.error(String error) = DomainError<T>;

  const factory DomainResult.loading() = DomainLoading<T>;
}
