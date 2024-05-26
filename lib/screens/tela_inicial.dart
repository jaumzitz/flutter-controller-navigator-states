import 'package:alura_flutter_curso_1/components/tasks.dart';
import 'package:alura_flutter_curso_1/data/task_inherited.dart';
import 'package:alura_flutter_curso_1/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  int globalLevel = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Flutter: Primeiros Passos', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                          child: LinearProgressIndicator(
                            color: Colors.white,
                            value: 1,
                          ),

                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text('Level: ${this.globalLevel}', style: TextStyle(color: Colors.white, fontSize: 16),),
                        ),

                      ],

                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 4),
                      child: ElevatedButton(child: Icon(Icons.refresh, color: Colors.blue), onPressed: () {
                        setState(() {

                          int sumLevel = 0;

                          for (Tasks task in TaskInherited.of(context).taskList) {
                            sumLevel += task.level;
                          }

                          this.globalLevel = sumLevel;


                        });
                      }, )
                    )
                  ],
                )
              ],
            ),



          ],
        ),

        toolbarHeight: 100,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: TaskInherited.of(context).taskList,
        padding: EdgeInsets.only(top: 8, bottom: 70),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (contextNew) => FormScreen(taskContext: context,)));
        },
        backgroundColor: Colors.blue[100],
        child: const Icon(Icons.add),
      ),
    );
  }
}
