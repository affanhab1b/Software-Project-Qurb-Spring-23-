import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:testing/resources/firestore_methods.dart';
import 'package:testing/widgets/like_animation.dart';
import '../models/usermodel.dart';
import '../providers/user_provider.dart';

class CommentCard extends StatefulWidget {
  final snap;
  CommentCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Container(
      color: Colors.black38,
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 16,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              widget.snap['profilePic'],
            ),
            radius: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.snap['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            // color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: ' ${widget.snap['text']}',
                          // style: const TextStyle(
                          //     // color: Colors.black,
                          //     ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      DateFormat.yMMMd().format(
                        widget.snap['datePublished'].toDate(),
                      ),
                      style: const TextStyle(
                        fontSize: 12,
                        // fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.thumb_up_sharp,
              size: 16,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shrinkWrap: true,
                    children: [
                      'Delete',
                    ]
                        .map(
                          (e) => InkWell(
                            onTap: () async {
                              FirestoreMethods()
                                  .deleteComment(widget.snap['commentId']);
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              child: Text(e),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
