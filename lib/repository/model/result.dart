import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result extends Equatable {
  final String status;
  final String? reason;

  const Result({
    required this.status,
    required this.reason,
  });

  @override
  List<Object> get props => [status];

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
