# elice-mobile-team-pa
엘리스 flutter개발자 과제전형 레포지토리입니다
## 의존성
- flutter: 3.3.4
- Dart SDK: >=2.17.0 <3.0.0
- flutter_bloc: ^8.0.1  
- bloc: ^8.0.3  
- bloc_concurrency: ^0.2.0  
- stream_transform: ^2.0.0   
- dio: ^4.0.6  
- equatable: ^2.0.3  
- webview_flutter: ^4.0.0  
- cached_network_image: ^3.2.1  
- json_serializable: ^6.2.0  
- json_annotation: ^4.6.0  
- google_fonts: ^3.0.1  
- go_router: ^5.2.4   
- mobile_scanner: ^2.1.0
- build_runner: ^2.3.2
## 폴더구조
```bash
├─ lib
│  ├─ app
│  │  ├─ app.dart
│  │  ├─ bloc_observer.dart
│  │  ├─ routes
│  │  │  └─ routes.dart
│  │  └─ view
│  │     ├─ app.dart
│  │     └─ view.dart
│  ├─ common
│  │  ├─ common.dart
│  │  ├─ layout
│  │  │  ├─ layout.dart
│  │  │  └─ screen_layout.dart
│  │  ├─ style
│  │  │  ├─ app_colors.dart
│  │  │  ├─ app_text_styles.dart
│  │  │  └─ style.dart
│  │  └─ widget
│  │     ├─ chip_label.dart
│  │     ├─ course_logo.dart
│  │     ├─ empty_course.dart
│  │     ├─ entire_course_card.dart
│  │     ├─ error_image_asset.dart
│  │     ├─ global_app_bar.dart
│  │     ├─ instructor_full_name.dart
│  │     ├─ purple_logo_asset.dart
│  │     └─ widget.dart
│  ├─ embed_web_view
│  │  ├─ embed_web_view.dart
│  │  └─ view
│  │     ├─ embed_web_view.dart
│  │     └─ view.dart
│  ├─ free_course
│  │  ├─ bloc
│  │  │  ├─ entire_free_course_bloc.dart
│  │  │  ├─ entire_free_course_event.dart
│  │  │  └─ entire_free_course_state.dart
│  │  ├─ free_course.dart
│  │  └─ view
│  │     ├─ entire_free_course.dart
│  │     └─ view.dart
│  ├─ home
│  │  ├─ cubit
│  │  │  ├─ cubit.dart
│  │  │  ├─ free_course_cubit.dart
│  │  │  ├─ free_course_state.dart
│  │  │  ├─ recommended_course_cubit.dart
│  │  │  └─ recommended_course_state.dart
│  │  ├─ home.dart
│  │  ├─ view
│  │  │  ├─ home.dart
│  │  │  ├─ home_contents.dart
│  │  │  └─ view.dart
│  │  └─ widget
│  │     ├─ category_title.dart
│  │     ├─ horizontal_course_card.dart
│  │     ├─ horizontal_courses.dart
│  │     ├─ view_entire_course_button.dart
│  │     └─ widget.dart
│  ├─ main.dart
│  ├─ qr_scanner
│  │  ├─ qr_scanner.dart
│  │  └─ view
│  │     ├─ qr_scanner.dart
│  │     └─ view.dart
│  ├─ recommended_course
│  │  ├─ bloc
│  │  │  ├─ entire_recommended_course_bloc.dart
│  │  │  ├─ entire_recommended_course_event.dart
│  │  │  └─ entire_recommended_course_state.dart
│  │  ├─ recommended_course.dart
│  │  └─ view
│  │     ├─ entire_recommended_course.dart
│  │     └─ view.dart
│  ├─ repository
│  │  ├─ base_repository.dart
│  │  ├─ course_repository.dart
│  │  ├─ model
│  │  │  ├─ course.dart
│  │  │  ├─ course.g.dart
│  │  │  ├─ course_res.dart
│  │  │  ├─ course_res.g.dart
│  │  │  ├─ instructor.dart
│  │  │  ├─ instructor.g.dart
│  │  │  ├─ models.dart
│  │  │  ├─ result.dart
│  │  │  └─ result.g.dart
│  │  └─ repository.dart
│  └─ support
│     ├─ config
│     │  ├─ config.dart
│     │  └─ env.dart
│     ├─ dio
│     │  ├─ dio.dart
│     │  ├─ dio_client.dart
│     │  ├─ dio_interceptor.dart
│     │  └─ elice_exception.dart
│     ├─ support.dart
│     └─ utils
│        ├─ elice_decoder.dart
│        ├─ throttle_droppable.dart
│        └─ utils.dart
├─ pubspec.yaml
``` 

#### 폴더 구조 설명
- `view`: Screen이나 inner contents에 해당하는 위젯이 들어갑니다
- `bloc`: 비즈니스로직 관련 bloc,state,event 파일이 위치하는 곳 입니다.
- `widget`: componet화 된 widget들이 위치하는 곳 입니다.
- `repository`: api통신을 위한 함수가 정의되어 있는 곳 입니다.
- `model`: 데이터 바인딩을 위한 model이 위치하는 곳 입니다.
- `support`: 앱내에 필요한 util,http통신,예외처리 클래스,환경변수 클래스 등이 위치하는 곳 입니다.
- `common`: 공통으로 사용되는 layout,widget등이 위치하는 곳 입니다.
## 과제 구현 방법
- home과 전체보기가 같은 api엔드포인트를 사용하고 있고 페이징이 추가되는 부분만 제하면 로직이 같아 처음엔 분할 없이 한 `Bloc`으로 관리를 하려고 했으나 추후 확장을 고려하여 home에는 일회성 API호출을 하는 `cubit`,전체보기에는 pagination을 위한 `bloc`을 사용했습니다.
-  pagination시 API호출 주기를 조절하기위해 droppable을 사용했습니다.
```dart
 EventTransformer<E> throttleDroppable<E>([Duration? duration]) {
   return (events, mapper) {
     return droppable<E>().call(
         events.throttle(duration ?? const Duration(milliseconds: 200)), mapper);
   };
 }

```
- API에서 최대 course count가 넘어갔음에도 불구하고 중복 아이템이 계속 내려와서 간단한 수식으로 아이템 수가 전체 count를 넘어가지 않게 작업했습니다
```dart
 final courseRes = await _fetchCourse();
 emit(
        state.copyWith(
          ...
          hasReachedMax: courseRes.courseCount <=
              state.courses.length + courseRes.courses.length,
          ...
        ),
      );
```
- API통신 실패시 예외처리를 하였습니다.
```dart
  //Exception
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
    
  //Bloc
  on EliceException catch (err) {
      emit(state.copyWith(
        status: EntireFreeCourseStatus.failure,
        errorMessage: err.message,
      ));
   } catch (err) {
      emit(
        state.copyWith(
          status: EntireFreeCourseStatus.failure,
          errorMessage: err.toString(),
        ),
      );
   }
    
   //UI
   ...
   case EntireFreeCourseStatus.failure:
        return EmptyCourse(message: state.errorMessage);
   ...
   ```
   - mobile_scanner 패키지를 사용해서 qr인식 기능을 구현했습니다. 다만 현재 버전에서 카메라 전체화면을 인식하기 때문에 센터 윈도우 영역으로 widget을 맞춰서 구현했습니다
   - qr인식이 완료되면 rawValue로 util에서 base64인지 검사를 하고 후에 String을 리턴해서 웹뷰로 이동 됩니다.
   ```dart
   static final RegExp _base64 = RegExp(
      r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');

    static String decodeBase64(String str) {
      //정규식 검사
      if (_base64.hasMatch(str)) {
        return utf8.decode(base64Url.decode(str.toString()));
      }
      return str;
    }
   ```
    
## 궁금한 점
- api에서 max count가 넘었음에도 아이템이 계속 내려오는 건 오류인지 혹은 테스트를 위한 장치인지 궁금했다
- api키 값이 정규화 되어있지 않고 몇개는 snake case를 쓰는데 어떤 기준인지 궁금했다
- QR인식과 웹뷰 이동은 라이브러리 의존 성향이 짖은데 이 부분을 과제에 넣은 이유가 궁금했다
