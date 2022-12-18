import 'package:flutter/material.dart';
import 'package:post/icons/arrow_head_down_word_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../models/wrapper.dart';
import '../../icons/settings_icons.dart';
import '../provider/search_provider.dart';
import 'package:provider/provider.dart';
import '../../widgets/loading_reddit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../logins/screens/login.dart';
import '../../logins/providers/authentication.dart';
// Navigator.of(context).pushNamed(homeLayoutScreen.routeName);
import '../../widgets/custom_snack_bar.dart';
import '../provider/search_provider.dart';

class CommunitiesList extends StatefulWidget {
  static const routeName = '/communitieslist';
  String quiry;
  CommunitiesList({Key? key, this.quiry = ''}) : super(key: key);

  @override
  State<CommunitiesList> createState() => _CommunitiesListState();
}

class _CommunitiesListState extends State<CommunitiesList> {
  bool fetchingDone = true;

  bool _isInit = true;

  bool isBuild = false;
  int index = 0;
  bool showNSFW = true;
  bool autoPlay = true;
  String SorthomePosts = 'Best';
  SearchProvider? provider = null;
  // @override
  void didChangeDependencies() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_isInit) {
      setState(() {
        fetchingDone = false;
      });

      provider = Provider.of<SearchProvider>(context, listen: false);
      // provider!.getAllPrefs(context).then((value) {
      //   provider!.userPrefrence;
      //   print(provider!.userPrefrence);
      provider!.getsearch('ahmed', context).then((value) => {});
      fetchingDone = true;
      //   SorthomePosts = provider!.userPrefrence!.sortHomePosts!;
      //   autoPlay = provider!.userPrefrence!.autoplayMedia!;
      //   showNSFW = provider!.userPrefrence!.adultContent!;
      //   if (isBuild) setState(() {});
      // });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    isBuild = true;
    return (!fetchingDone)
        ? const LoadingReddit()
        //Calls TopicMainScreen widget to build Topics Screen
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Center(child: Text('Communities'))],
            ),
          );
  }
}
