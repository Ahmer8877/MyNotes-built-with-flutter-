import 'package:flutter/material.dart';
import 'package:note/Providers/my_note%20provider.dart';
import 'package:note/Screens/HomeScreen/home_screen.dart';
import 'package:note/Screens/Notes_Screen/notes_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NoteProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes:{
            '/' : (context) => HomeScreen(),
            'MyNotes' : (context) => NotesScreen(),
          }
      ),
    );
  }
}
