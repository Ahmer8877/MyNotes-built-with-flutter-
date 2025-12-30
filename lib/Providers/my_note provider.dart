import 'package:flutter/material.dart';
import 'package:note/Models/note_models.dart';

class NoteProvider with ChangeNotifier{
  List<NoteModel> notes=[];

  //func. used add note
  void addNote(NoteModel note){

    notes.add(note);
    notifyListeners();
  }
  //func. used delete note

  void removeNote(NoteModel note){
    notes.remove(note);
    notifyListeners();
  }


}