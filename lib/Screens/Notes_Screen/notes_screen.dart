import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/Models/note_models.dart';
import 'package:note/Providers/my_note%20provider.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  TextEditingController title=TextEditingController();
  TextEditingController desc=TextEditingController();
  GlobalKey<FormState> formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Notes'),
        centerTitle: true,
      ),
      body: Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: Column(
              spacing: 20,
              children: [
                //card for title
            
                Card(
                  child: TextFormField(
                    maxLines: 1,
                    controller: title,
                    decoration: InputDecoration(
                      hint: Text('Title',style: TextStyle(color: CupertinoColors.inactiveGray),)
                    ),
                  ),
                ),
            
                //card for desc
                Card(
                  child: TextFormField(
                    maxLines: 10,
                    controller: desc,
                    decoration: InputDecoration(
                      hint: Text('Description',style: TextStyle(color: CupertinoColors.inactiveGray),)
                    ),
                  ),
                ),
                //save krne ke liye elevated button
                ElevatedButton(
                    onPressed: (){
                      if(formkey.currentState!.validate()){
                        NoteModel note=NoteModel(title.text, desc.text);
                        Provider.of<NoteProvider>(context,listen: false).addNote(note);
                         Navigator.pop(context);
                      }
                    },
                    child: Text('SAVE',
                      style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.black
                      ),
                    )
                ),
                //used spacer for spacing
                Spacer(),
                //creater text
                Text('Create by AS group',style: TextStyle(fontWeight: FontWeight.bold,color: CupertinoColors.inactiveGray),)
              ],
            ),
          ),
        ),
      ),
    
    );
  }
}
