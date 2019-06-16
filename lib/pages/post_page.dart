import 'package:drip/blocs/post/post_bloc.dart';
import 'package:drip/blocs/post/post_event.dart';
import 'package:drip/blocs/post/post_state.dart';
import 'package:drip/model/post/post.dart';
import 'package:drip/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:toast/toast.dart';

class PostPage extends StatefulWidget {
  @override
  State createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final PostBloc _bloc = PostBloc();

  final List<Post> _posts = List();

  @override
  void initState() {
    super.initState();

    ///
    _bloc.dispatch(Fetch(0, 20));
  }

  @override
  void dispose() {
    _bloc.dispose();
    _refreshController.dispose();

    ///
    super.dispose();
  }

  void _onRefresh() {
    _bloc.dispatch(Fetch(0, 20));
  }

  void _onLoading() {
    _bloc.dispatch(Fetch(0, 20));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder(
        bloc: _bloc,
        builder: (BuildContext context, PostState state) {
          if (state is PostUninitialized) {
            return _loadingIndicator();
          }

          _completeRefreshOrLoad(state);
          if (state is PostLoaded) {
            _posts.addAll(state.posts);
          }

          if (state is PostError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Toast.show('d(>_<)b 出错了~', context,
                  gravity: Toast.CENTER, duration: 2);
            });
          }

          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return PostWidget(post: _posts[index]);
              },
              itemCount: _posts.length,
            ),
          );
        },
      ),
    );
  }

  void _completeRefreshOrLoad(PostState state) {
    if (_refreshController.isRefresh) {
      if (state is PostError) {
        _refreshController.refreshFailed();
      } else {
        _refreshController.refreshCompleted();
      }
    }
    if (_refreshController.isLoading) {
      _refreshController.loadComplete();
    }
  }

  Widget _loadingIndicator() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
