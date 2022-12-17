import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:elice_mobile_team_pa/repository/model/models.dart';
import 'package:elice_mobile_team_pa/support/support.dart';

import 'base_repository.dart';

abstract class AbstractCourseRepository {
  Future<CourseRes> fetchCourse({
    required bool isFree,
    required bool isRecommended,
    required int offset,
    required int count,
  });
}

class CourseRepository extends BaseRepository
    implements AbstractCourseRepository {
  @override
  Future<CourseRes> fetchCourse({
    required bool isFree,
    required bool isRecommended,
    required int offset,
    required int count,
  }) async {
    try {
      final response = await dioClient.client.get(
        "/academy/course/list/",
        queryParameters: {
          "filter_is_free": isFree,
          "filter_is_recommended": isRecommended,
          "offset": offset,
          "count": count,
        },
      );
      log(']-----] CourseRepository::fetchCourse.response [-----[ $response');
      return CourseRes.fromJson(response.data);
    } on DioError catch (err) {
      throw EliceException.fromCode(err.response?.statusCode);
    } catch (err) {
      throw EliceException(err.toString());
    }
  }
}
