import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../moderation_settings/widgets/alert_dialog.dart';
import '../Provider/message_provider.dart';

class NewMessageScreen extends StatefulWidget {
  NewMessageScreen({super.key, this.userName, this.userNameAvailable});
  static const routeName = '/new-message-screen';
  String? userName;
  bool? userNameAvailable;

  @override
  State<NewMessageScreen> createState() => _NewMessageScreenState();
}

class _NewMessageScreenState extends State<NewMessageScreen> {
  bool _iselected = false;
  // TextEditingController? _nameController = null;
  // TextEditingController? _subjectController = null;
  //TextEditingController? _bodyController = null;
  bool subjectAvailable = false;
  bool messageAvailable = false;
  String subject = '';
  String message = '';
  String? username;

  _changeStateOfUserName() {
    //print(widget.userName);
    setState(() {
      if (username!.isNotEmpty) {
        widget.userNameAvailable = true;
      } else {
        widget.userNameAvailable = false;
      }
      _iselected =
          widget.userNameAvailable! && subjectAvailable && messageAvailable;
      //   if(widget.userNameAvailable){

      // }
    });
  }

  _changeStateOfSubject() {
    print(subject);
    setState(() {
      if (subject.isNotEmpty) {
        subjectAvailable = true;
      } else {
        subjectAvailable = false;
      }
      _iselected =
          widget.userNameAvailable! && subjectAvailable && messageAvailable;
    });
  }

  _changeStateOfMessage() {
    print(message);
    setState(() {
      if (message.isNotEmpty) {
        messageAvailable = true;
      } else {
        messageAvailable = false;
      }
      _iselected =
          widget.userNameAvailable! && subjectAvailable && messageAvailable;
    });
  }

  _saveNewMessage(username, subject, message) {
    Provider.of<MessageProvider>(context, listen: false).createMessage(
        {'to': username, 'text': message, 'subject': subject},
        context).then((value) {
      Navigator.of(context).pop();
    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   //_nameController.value = null;

  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username = (widget.userName == null) ? '' : widget.userName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Message',
        ),
        actions: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            onPressed: (_iselected)
                ? () =>_saveNewMessage(username, subject, message)
                : null,
            child: Text(
              'Send',
              style: TextStyle(
                  color: (_iselected)
                      ? Colors.blue
                      : Colors.blue.shade900.withOpacity(0.5)),
            ),
          )
        ],
        titleTextStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
        backgroundColor: Colors.grey[50],
        titleSpacing: 0,
        elevation: 2,
        shadowColor: Colors.white,
      ),
      body: WillPopScope(
          onWillPop: () async {
            final shouldPop = _iselected
                ? await showDialog<bool>(
                    context: context,
                    builder: ((context) {
                      return const AlertDialog1();
                    }),
                  )
                : true;
            return shouldPop!;
          },
          child: Container(
            child: Column(
              children: [
                TextFormField(
                  enabled: (widget.userName != null) ? false : true,
                  initialValue:
                      (widget.userName != null) ? widget.userName : null,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    print(value);
                    username = value;
                    _changeStateOfUserName();
                  },
                  decoration: const InputDecoration(
                    prefix: Text(
                      'u/',
                      style: TextStyle(color: Colors.black),
                    ),
                    labelText: 'u/Username',
                    hintText: 'Username',
                    labelStyle: TextStyle(color: Colors.black54),
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(bottom: 3, left: 5, top: 25, right: 5),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    subject = value;
                    _changeStateOfSubject();
                  },
                  decoration: const InputDecoration(
                    isDense: true,
                    hintText: 'Subject',
                    contentPadding:
                        EdgeInsets.only(bottom: 3, left: 5, top: 25, right: 5),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    message = value;
                    _changeStateOfMessage();
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 13,
                  textInputAction: TextInputAction.newline,
                  decoration: const InputDecoration(
                    hintText: 'Message',
                    isDense: true,
                    contentPadding:
                        EdgeInsets.only(bottom: 3, left: 5, top: 25, right: 5),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
