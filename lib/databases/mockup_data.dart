import 'package:odev_test/databases/db1.dart';
import 'package:odev_test/models/post_model.dart';

bool initialput = false;
String text =
    "The collapse of the online-advertising market in 2001 made marketing on the internet seem even less compelling.";

final david1 = Post(
  id: 1,
  name: "David Smith",
  date: "10 hours ago",
  text: text,
  likes: 15,
  shares: 2,
  comments: 5,
);

final john1 = Post(
  id: 2,
  name: "John Doe",
  date: "5 hours ago",
  text: text,
  likes: 1,
  shares: 5,
  comments: 3,
);

final jane1 = Post(
  id: 3,
  name: "Jane Doe",
  date: "4 hours ago",
  text: text,
  likes: 20,
  shares: 10,
  comments: 0,
);

final john2 = Post(
  id: 4,
  name: "John Doe",
  date: "3 hours ago",
  text: text,
  likes: 30,
  shares: 34,
  comments: 15,
);

Future putData() async {
  if (initialput == false) {
    await MyDatabase.instance.insert(david1);
    await MyDatabase.instance.insert(john1);
    await MyDatabase.instance.insert(jane1);
    await MyDatabase.instance.insert(john2);
  }
  initialput = true;
}

Future moreData() async {
  await MyDatabase.instance.insert(david2);
  await MyDatabase.instance.insert(jane2);
  await MyDatabase.instance.insert(john3);
  await MyDatabase.instance.insert(david3);
  await MyDatabase.instance.insert(jane3);
}

final david2 = Post(
  name: "David Smith",
  date: "1 hours ago",
  text: text,
  likes: 15,
  shares: 2,
  comments: 5,
);

final david3 = Post(
  name: "David Smith",
  date: "2 hours ago",
  text: text,
  likes: 15,
  shares: 2,
  comments: 5,
);

final john3 = Post(
  name: "John Doe",
  date: "5 minutes ago",
  text: text,
  likes: 1,
  shares: 5,
  comments: 3,
);

final jane2 = Post(
  name: "Jane Doe",
  date: "2 hours ago",
  text: text,
  likes: 20,
  shares: 10,
  comments: 0,
);

final jane3 = Post(
  name: "Jane Doe",
  date: "3 hours ago",
  text: text,
  likes: 20,
  shares: 10,
  comments: 0,
);
