import 'package:bloc/bloc.dart';
import 'package:drip/api/post_api.dart';
import 'package:drip/blocs/post/post_event.dart';
import 'package:drip/blocs/post/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostApi _postApi = PostApi();

  @override
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is Fetch) {
      try {
        if (currentState is PostUninitialized) {
          PostState state =
              await _mapPostLoadEventToState(event.start, event.limit);
          yield state;
          return;
        }

        if (currentState is PostLoaded) {
          PostState state =
              await _mapPostLoadEventToState(event.start, event.limit);
          yield state;
          return;
        }

        if (currentState is PostNoMore) {
          yield PostNoMore();
          return;
        }

        if (currentState is PostError) {
          PostState state =
              await _mapPostLoadEventToState(event.start, event.limit);
          yield state;
          return;
        }

        yield PostError();
      } catch (e) {
        print(e);
        yield PostError();
      }
    }
  }

  Future<PostState> _mapPostLoadEventToState(int start, int limit) async {
    final posts = await _postApi.request(start, limit);
    return posts.isEmpty
        ? PostNoMore()
        : PostLoaded(start: start, limit: limit, posts: posts);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    print('$error, $stacktrace');
  }
}
