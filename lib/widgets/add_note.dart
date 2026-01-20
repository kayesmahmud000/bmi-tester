import 'package:bmi_test_app/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  final bool isUpdate;
  final String defaultTitle;
  final int ?noteId;
  final String defaultDesc;
 final Function(String title, String desc)? addNote;
 final Function(String title, String desc , int noteId)? updateNote;

   const AddNote({super.key , this.addNote ,this.isUpdate =false, this.defaultTitle='',this.defaultDesc='',this.noteId, this.updateNote});


  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  TextEditingController titleController =TextEditingController();
  TextEditingController descController =TextEditingController();

  String errMassage='';

  @override
  void initState() {
    super.initState();

    if(widget.isUpdate){
      titleController.text =widget.defaultTitle;
      descController.text =widget.defaultDesc;
    }
  }

  void handleAddNote(){
    var title =titleController.text;
    var desc = descController.text;

    if(title.isEmpty && desc.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill the all required blank field')));
      return;
    }

    if(widget.isUpdate){
      widget.updateNote!(title, desc, widget.noteId! );
      
    }else{
       widget.addNote!(title, desc);
     
    }
 Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.isUpdate ?"Update Note":"Add Note", style: TextStyle(fontSize: 25 , fontWeight: .bold),),
            ),
            SizedBox(height: 20,),
            Container(
              width: 400,
              child: TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                    hint: Text('Enter Note Title'),
                label: Text('Title'),
                filled: true,
                fillColor: Colors.white,)
              ),
            ),
              SizedBox(height: 20,),
            Container(
              width: 400,
              child: TextField(
                maxLines: 5,
                controller: descController,
                keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                    hint: Text('Enter Note Description'),
                label: Text('Description'),
                filled: true,
                fillColor: Colors.white,)
              ),
            ),
            Row(
              // mainAxisAlignment: .center,
              children: [
                Expanded(child: CustomBtn(btnName:widget.isUpdate? "Update Note":"Add Note", bgColor: Colors.green, textStyle: TextStyle(color: Colors.white), callback: handleAddNote,)),
                Expanded(child: CustomBtn(btnName: "Cancel", bgColor: Colors.red, textStyle: TextStyle(color: Colors.white),callback:()=> Navigator.pop(context),) ),
              ],
            )
          ],
        );
  }
}