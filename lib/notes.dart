import 'package:bmi_test_app/db/db_helper.dart';
import 'package:bmi_test_app/widgets/add_note.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {

  List<Map<String, dynamic>> allNotes =[];
  DbHelper? dbHelper;


  @override
  void initState(){
    super.initState();
    dbHelper = DbHelper.getInstance;
    getAllNotes();
  }

// get notes
  void getAllNotes() async{
   allNotes= await dbHelper!.getNotes();
   setState(() {
     
   });
  }



void addNote(String title,  String desc ) async{
   
 bool check =await dbHelper!.addNote(mTitle:title, mDesc:desc);
 if(check){
 getAllNotes();
 }
 
}


void updateNote(String title, String desc, int noteId ) async{
 bool check = await dbHelper!.updateNote(title: title, desc: desc, sl:noteId);

 if(check){
  getAllNotes();
 }
}
 
 void deleteNote (int noteId)async{
  bool check = await dbHelper!.deleteNote(sl: noteId);

  if(check){
    getAllNotes();
  }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('My Note', style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: allNotes.isNotEmpty ? ListView.builder(
        itemCount: allNotes.length,
        itemBuilder:(_, index) => ListTile(
          leading: Text('${index+1}'),
          title: Text(allNotes[index][DbHelper.COLUMN_NOTE_TITLE]),
          subtitle: Text(allNotes[index][DbHelper.COLUMN_NOTE_DESC]),
          trailing: Row(
            mainAxisSize: .min,
            children: [
              IconButton( onPressed: (){

                showModalBottomSheet(context: context, builder: (context)=>
                 AddNote(updateNote:updateNote, isUpdate: true, defaultTitle: allNotes[index][DbHelper.COLUMN_NOTE_TITLE],
                defaultDesc: allNotes[index][DbHelper.COLUMN_NOTE_DESC],
                noteId:allNotes[index][DbHelper.COLUMN_NOTE_SL_NO], 
                ));
              },icon: Icon(Icons.edit)),
              
               
              IconButton(onPressed: () =>deleteNote(allNotes[index][DbHelper.COLUMN_NOTE_SL_NO]) ,
              icon: Icon(Icons.delete, color: Colors.red,))
            ],
          ),
      //  trailing:  Icon(Icons.edit),
      ),):Center(
        child: Text("No Note Yet!!"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=> showModalBottomSheet(context: context, builder: (context)=>Container(
        width: double.infinity,
        child: AddNote(addNote: addNote),
      )),
       child: Icon(Icons.add),
      ),
    );
  }
}