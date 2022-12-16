import 'package:flutter/material.dart';
import 'package:odev_test/databases/db1.dart';
import 'package:odev_test/models/post_model.dart';
import 'package:odev_test/preferences/prefs_user.dart';
import 'package:odev_test/provider/provider_homepage.dart';
import 'package:odev_test/styles/styles.dart';
import 'package:odev_test/widgets/appbar.dart';
import 'package:odev_test/widgets/button_navigator.dart';
import 'package:odev_test/widgets/delete_post.dart';
import 'package:odev_test/widgets/edit_post.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<RefreshHome>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(140),
              child: CustomAppBar(
                scrollController: scrollController,
              )),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.01),
                  FutureBuilder(
                    future: MyDatabase.instance.getAll(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        List<Post> registro = snapshot.data!;
                        return registro.isEmpty
                            ? const Center(
                                child: Text(
                                  "No hay Posts para mostrar",
                                ),
                              )
                            : ListView.separated(
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                primary: false,
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                  return ItemPost(
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
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: const ButtonNavigator(
            navigate: "publish",
          ),
          bottomNavigationBar: BottomAppBar(
            color: Styles.primaryColor,
            shape: const CircularNotchedRectangle(),
            child: const Padding(
              padding: EdgeInsets.all(30),
            ),
          ),
        );
      },
    );
  }
}

class ItemPost extends StatelessWidget {
  const ItemPost({super.key, required this.index, required this.registro});

  final int index;
  final Post registro;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 205,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserInfo(
                  name: registro.name,
                  date: registro.date,
                  usertag: true,
                ),
                PrefsUser.name == registro.name
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                editDialog(context, registro);
                              },
                              iconSize: 20,
                              icon: Styles.editIcon),
                          IconButton(
                              onPressed: () {
                                deleteDialog(context, registro.id!);
                              },
                              iconSize: 20,
                              icon: Styles.editIcon),
                        ],
                      )
                    : const SizedBox(
                        height: 0,
                        width: 0,
                      )
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(registro.text,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                IconButton(onPressed: () {}, icon: Styles.heartIcon),
                Text(
                  registro.likes.toString(),
                  style: Styles.interactbuttons,
                ),
                const SizedBox(width: 20),
                IconButton(onPressed: () {}, icon: Styles.commentIcon),
                Text(
                  registro.comments.toString(),
                  style: Styles.interactbuttons,
                ),
                const SizedBox(width: 20),
                IconButton(onPressed: () {}, icon: Styles.shareIcon),
                Text(
                  registro.shares.toString(),
                  style: Styles.interactbuttons,
                ),
              ],
            )
          ],
        ));
  }
}
