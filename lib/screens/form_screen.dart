import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,

            leading: Icon(Icons.arrow_back, color: Colors.white,),
            title: Text('Nova tarefa', style: TextStyle(color: Colors.white),)),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 375,
              height: 750,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Insira o nome da tarefa.';
                  }
                  return null;
                },
                controller: nameController,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nome',
                    fillColor: Colors.white70,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty ||
                      int.parse(value) > 5 ||
                      int.parse(value) < 1) {
                    return 'A dificuldade deve ser entre 1 e 5.';
                  }
                  return null;
                },
                controller: difficultyController,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Dificuldade',
                    fillColor: Colors.white70,
                    filled: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (text) {
                  setState(() {});
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira a URL da imagem.';
                  }
                  return null;
                },
                keyboardType: TextInputType.url,
                controller: imageController,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Imagem',
                    fillColor: Colors.white70,
                    filled: true),
              ),
            ),
            Container(
              height: 100,
              width: 72,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: Colors.blue),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageController.text, errorBuilder:
                    (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    'assets/images/nophoto.jpg',
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(nameController.text);
                    print(int.parse(difficultyController.text));
                    print(imageController.text);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Tarefa adicionada')
                      ),
                    );

                    Navigator.pop(context);
                  }
                },
                child: Text('Adicionar')
            )
            ],
          ),
        ),
      ),
    ),)
    ,
    );
  }
}