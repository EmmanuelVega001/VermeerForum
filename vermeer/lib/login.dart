import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:vermeer/home.dart';
import 'package:vermeer/perfil.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String nombre = ' ';
  String soundPath= 'assets/sound.mp3';
  AudioPlayer audioPlayer = AudioPlayer();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = ' ';
  bool _isPasswordValid = false;

  @override
Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 60.0),
              child: Center(
                
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: const Text("VERMEER FORUM",style: TextStyle(fontSize: 30, color:Color.fromARGB(255, 192, 63, 63)),)
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'USER',
                    hintText: 'ENTER A VALID USERNAME PLEASE'),
                    onChanged: (value){
                      setState(() {
                        nombre = value;
                      });
                    },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password ',
                    hintText: 'Enter secure password'),
              ),
              
            
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: ElevatedButton(
                    child: Text('LogIn'),
                  onPressed: () => {
                    playSound(),
                    passwordVal()
                  },
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                  ),
            ),

            

            Container(
              

            ),
            
            SizedBox(
              height: 130,
            ),
             SizedBox(height: 10),
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
            ),
            
          ],
        ),
      ),
    );
  }
  void passwordVal(){
    String validPassword = 'arribaValdi123'; // Cambia esto por tu 
    String enteredPassword = _passwordController.text;
    if (enteredPassword == validPassword) {
                          Navigator.pushNamed(context, '/home', arguments: "pedro");
    }
    _isPasswordValid = enteredPassword == validPassword;
    setState(() {
      _errorMessage = _isPasswordValid ? '' : 'Contraseña incorrecta';
    });  
  }
  void playSound(){
  audioPlayer.play(soundPath);
}
}
