import 'package:flutter/material.dart';
import 'package:flutter_exam_2/models/post.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: PostPage(),
    );
  }
}

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<PostResult> postResults = [];

  void fetchPosts() async {
    final posts = await PostResult.fetchPosts();
    setState(() {
      postResults = posts;
    });
  }

  void addPost() {
    PostResult.connectToAPI(
      'New Account',
      'accountnew@example.com',
      'Example Text',
    ).then((value) {
      setState(() {
        postResults.add(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.post_add),
            SizedBox(width: 10),
            Text('POST'),
          ],
        ),
        
      ),
      body: ListView.builder(
        itemCount: postResults.length,
        itemBuilder: (context, index) {
          final post = postResults[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(post.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.email),
                  Text(post.body),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addPost,
        child: const Icon(Icons.add),
      ),
    );
  }
}
