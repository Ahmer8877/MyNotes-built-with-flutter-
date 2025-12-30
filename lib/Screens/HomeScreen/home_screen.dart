import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/Models/note_models.dart';
import 'package:note/Providers/my_note%20provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY NOTES',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
      ),
      //this button used for add notes and push to notes screen
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, 'MyNotes');
          },
        child: Icon(Icons.add),
      ),
      body: Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<NoteProvider>(
            builder: (context,provider,child) {
              return provider.notes.isEmpty? Center(child: Text('is Empty')) : ListView(
                children: [
                  //for loop used for create multi list tiles
                  for(NoteModel note in provider.notes)
                    ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.desc),
                      trailing: IconButton(
                          onPressed: (){
                            provider.removeNote(note);
                          },
                          icon: Icon(Icons.delete)
                      ),
                      leading: Icon(CupertinoIcons.book),
                    )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
