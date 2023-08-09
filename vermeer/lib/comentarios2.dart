import 'package:flutter/material.dart';
import 'package:vermeer/publicacion3.dart';
import 'package:shared_preferences/shared_preferences.dart';


class comentarios2 extends StatefulWidget {
  const comentarios2({super.key});

  @override
  State<comentarios2> createState() => _comentarios2State();
}

class _comentarios2State extends State<comentarios2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CommentScreen(),
    );
  }
}


class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  List<String> _comments = [];

  @override
  void initState() {
    super.initState();
    _comments.add("Primer comentario jeje");
    _loadComments();
  }

  Future<void> _loadComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _comments = prefs.getStringList('comments') ?? [];
    });
  }

  Future<void> _addComment(String comment) async {
    final prefs = await SharedPreferences.getInstance();
    _comments.add(comment);
    await prefs.setStringList('comments', _comments);
    _commentController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(title: 'Comentarios',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                hintText: 'Escribe aquí tu opinión',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_commentController.text.isNotEmpty) {
                  _addComment(_commentController.text);
                }
              },
              child: Text('Comentar'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_comments[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => publicacion3()),
            );
        },
      ),
      title: Text("Comentarios"),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}





