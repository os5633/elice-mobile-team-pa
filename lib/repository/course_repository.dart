import 'dart:developer';
import 'package:elice_mobile_team_pa/repository/model/models.dart';
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
  }
}
