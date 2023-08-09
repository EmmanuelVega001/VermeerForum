import 'package:flutter/material.dart';
import 'package:vermeer/publicacion2.dart';
import 'package:shared_preferences/shared_preferences.dart';


class comentarios1 extends StatefulWidget {
  const comentarios1({super.key});

  @override
  State<comentarios1> createState() => _comentarios1State();
}

class _comentarios1State extends State<comentarios1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
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
  List<String> _comments1 = [];

  @override
  void initState() {
    super.initState();
    _comments1.add("Primer comentario jeje");
    _loadComments();
  }

  Future<void> _loadComments() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _comments1 = prefs.getStringList('comments1') ?? [];
    });
  }

  Future<void> _addComment(String comment) async {
    final prefs = await SharedPreferences.getInstance();
    _comments1.add(comment);
    await prefs.setStringList('comments1', _comments1);
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
                itemCount: _comments1.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_comments1[index]),
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
              MaterialPageRoute(builder: (context) => publicacion2()),
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





