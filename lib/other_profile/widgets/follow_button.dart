import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import '../providers/other_profile_provider.dart';

class FollowButton extends StatefulWidget {
  bool isFollowed;
  final String userName;
  FollowButton({super.key, required this.isFollowed, required this.userName});

  @override
  State<FollowButton> createState() => FollowButtonState();
}

class FollowButtonState extends State<FollowButton> {
  bool isFollowedstate = false;
  void _follow() async {
    bool follow =
        await Provider.of<OtherProfileprovider>(context, listen: false)
            .followUser(widget.userName);
    if (follow) {
      setState(() {
        followSucceeded();
      });
    } else {
      print('follow Failed');
    }
  }

  bool followSucceeded() {
    isFollowedstate = true;
    return isFollowedstate;
  }

  void _unFollow() async {
    bool unfollow =
        await Provider.of<OtherProfileprovider>(context, listen: false)
            .unFollowUser(widget.userName);
    if (unfollow) {
      setState(() {
        unFollowsucceeded();
      });
    } else {
      print('unfollow Failed');
    }
  }

  bool unFollowsucceeded() {
   isFollowedstate = false;
    return isFollowedstate;
  }

  @override
  void initState() {
    // TODO: implement initState
    isFollowedstate = widget.isFollowed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.isFollowed ? 30.w : 23.w,
        height: 6.h,
        child: OutlinedButton(
          onPressed: () {
            (widget.isFollowed) ? _unFollow() : _follow();
          },
          style: ButtonStyle(
              //shape: Outlin,

              side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.white)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)))),
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(137, 33, 33, 33)),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          child: Text(
            widget.isFollowed ? 'Following' : 'Follow',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ));
  }
}
