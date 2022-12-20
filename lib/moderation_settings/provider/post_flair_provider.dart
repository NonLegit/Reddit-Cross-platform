import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:post/networks/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/handle_error.dart';
import '../models/post_flair_model.dart';

class PostFlairProvider with ChangeNotifier {
  List<PostFlairModel> _flairsList = [];

  List<PostFlairModel> get flairList {
    return [..._flairsList];
  }

//http://localhost:8000/api/v1/subreddits/{subredditName}/flairs
  Future<void> addNewFlair(subredditName, data, context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      DioClient.init(prefs);
      final PostFlairModel post = data;
      print(post.toJson());
      // post.modOnly = ;
      await DioClient.post(
          path: '/subreddits/$subredditName/flair', data: post.toJson());
      _flairsList.add(data);
      notifyListeners();
    } on DioError catch (e) {
      //print(e.error.toString());
      print(e.error.toString());
      HandleError.errorHandler(e, context);
    } catch (error) {
      //print(error.toString());
      HandleError.handleError(error.toString(), context);
    }
  }

  Future<void> fetchFlair(subredditName, context) async {
    _flairsList = [];
    try {
      final prefs = await SharedPreferences.getInstance();
      DioClient.init(prefs);
      await DioClient.get(path: '/subreddits/$subredditName/flair')
          .then((value) {
        print(value);
        value.data['data'].forEach((element) {
          print(element);
          _flairsList.add(PostFlairModel.fromJson(element));
        });
      });
      notifyListeners();
    } on DioError catch (e) {
      HandleError.errorHandler(e, context);
    } catch (error) {
      HandleError.handleError(error.toString(), context);
    }
  }

//http://localhost:8000/api/v1/subreddits/{subredditName}/flairs/{flairId}
  Future<void> editFlair(subredditName, context, flairId, data) async {
    try {
      final PostFlairModel post = data;
      final prefs = await SharedPreferences.getInstance();
      DioClient.init(prefs);
      print(post.toJson());
      print(_flairsList[
              _flairsList.indexWhere((element) => element.sId == flairId)]
          .sId);
      print('hiiiiiiiiiiiiiiiiiii $flairId');
      print(post.backgroundColor);
      await DioClient.patch(
          path: '/subreddits/$subredditName/flair/$flairId',
          data: post.toJson());
      //foods[foods.indexWhere((element) => element.uid == food.uid)] = food;
      _flairsList[_flairsList.indexWhere((element) => element.sId == flairId)] =
          data;
      notifyListeners();
    } on DioError catch (e) {
      HandleError.errorHandler(e, context);
    } catch (error) {
      HandleError.handleError(error.toString(), context);
    }
  }

  Future<void> deleteFlair(subredditName, context, flairId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      DioClient.init(prefs);
      await DioClient.delete(path: '/subreddits/$subredditName/flair/$flairId');
      _flairsList.removeWhere((element) => element.sId == flairId);
      notifyListeners();
    } on DioError catch (e) {
      HandleError.errorHandler(e, context);
    } catch (error) {
      HandleError.handleError(error.toString(), context);
    }
  }
}
