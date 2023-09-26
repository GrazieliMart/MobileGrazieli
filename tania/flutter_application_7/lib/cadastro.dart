
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'aluno.dart';
import 'aluno.repository.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _Cadastro();
}

class _Cadastro extends State<Cadastro> {
    final campoRa = TextEditingController();
    final campoNome = TextEditingController();
    GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
    AlunoRepository alRepo = new AlunoRepository();
    final FocusNode focoRa = FocusNode();


  @override
  Widget build(BuildContext context)
   {
    return Scaffold(
      appBar: AppBar(
        title: (Text("ᚠLibrary")),
        

        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/lista');
          }, icon: Icon(Icons.list_alt_rounded),),
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/alterar');
          }, icon: Icon(Icons.catching_pokemon_outlined),)
        ],
      ),
      body: Padding(padding:const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         
          SizedBox(height: 30),
              Form(
                key: this._formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: campoRa,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                     focusNode: focoRa,
                     style: TextStyle(fontSize: 15),
                     decoration: InputDecoration (
                      labelText: 'RA',
                      border: OutlineInputBorder(),
                      filled: true,
                      
                     ),
                     validator: (value){
                      if (value!.isEmpty){
                        return 'O CAMPO RA nÃo deve fIcar vazio';
                      } else 
                      {
                        if (int.parse(campoRa.text)<5)
                        {
                        return 'o campo RA deve ser maior que 5';  
                        }
                      }
                    
                     return null;
                     } ,
                    ),
                    SizedBox(height: 50),
                    TextFormField(
                    controller: campoNome,
                     style: TextStyle(fontSize: 15),
                     decoration: InputDecoration (
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                      filled: true,
                     ),
                     validator: (value){
                      if (value!.isEmpty){
                        return 'Nome nao deve ficar vazio';
                      } else 
                      {
                        if (campoNome.text.length<5)
                        {
                        return 'O campo nome deve ter pelo menos 5 caracter';  
                        }
                      }
                     
                     return null;
                     } ,

                    ),

                    ElevatedButton(onPressed: () {
                      if (_formKey.currentState!.validate())
                      {
                        int ra = int.parse(campoRa.text);
                        String nome = campoNome.text;
                        Aluno a = new Aluno (ra, nome);
                        alRepo.adicionar(a);
                        alRepo.imprimir();
                        setState(() {
                          
                        });
                      }
                    }, 
                    
                    child: Text('Cadastrar'),
                    
                    ),
                  ],
                                    
                  )
              )

        ],

      )
      
      )
    );
  }
}