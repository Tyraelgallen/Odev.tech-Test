import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_test/data/databases/db1.dart';
import 'package:odev_test/data/models/post_model.dart';
import 'package:odev_test/data/preferences/prefs_user.dart';
import 'package:odev_test/logic/cubit/comment_cubit.dart';
import 'package:odev_test/logic/cubit/user_change_cubit.dart';
import 'package:odev_test/presentation/styles/styles.dart';
import 'package:odev_test/presentation/widgets/appbar.dart';
import 'package:readmore/readmore.dart';

String comment = "";

class CommentSection extends StatefulWidget {
  const CommentSection({super.key, required this.index});

  final int index;

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: textEditingController,
                        onChanged: (value) {
                          setState(() {
                            comment = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: "Add Comment",
                          fillColor: Colors.grey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    child: IconButton(
                        onPressed: () async {
                          if (comment != "") {
                            final json = Comment(
                                linkid: widget.index,
                                name: PrefsUser.name,
                                date: "Just Now",
                                text: comment,
                                likes: 0);
                            await MyDatabase.instance.insertComment(json);
                            textEditingController.clear;
                            setState(() {
                              comment = "";
                            });
                          }
                        },
                        icon: Styles.send))
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: FutureBuilder(
                future: MyDatabase.instance.getCommentsbyName(widget.index),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    List<Comment> registro = snapshot.data!;
                    return registro.isEmpty
                        ? SizedBox(
                            height: 0,
                            width: 0,
                          )
                        : ListView.separated(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return ItemComment(
                                index: index,
                                registro: registro[index],
                              );
                            }),
                            separatorBuilder: ((context, index) =>
                                const SizedBox(height: 10)),
                            itemCount: registro.length);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ItemComment extends StatefulWidget {
  const ItemComment({super.key, required this.index, required this.registro});

  final int index;
  final Comment registro;

  @override
  State<ItemComment> createState() => _ItemCommentState();
}

class _ItemCommentState extends State<ItemComment> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        width: double.infinity,
        // height: 205,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserInfo(
                  name: widget.registro.name,
                  date: widget.registro.date,
                ),
                BlocBuilder<UserChangeCubit, UserChangeState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () {}, icon: Styles.heartIcon),
                        Text(
                          widget.registro.likes.toString(),
                          style: Styles.interactbuttons,
                        ),
                        const SizedBox(width: 20),
                      ],
                    );
                  },
                ),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReadMoreText(
                widget.registro.text,
                trimLines: 4,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Read More",
                trimExpandedText: "Read Less",
                textAlign: TextAlign.start,
                lessStyle: Styles.styleReadMore,
                moreStyle: Styles.styleReadMore,
              ),
            ),
            const Divider(),
          ],
        ));
  }
}
