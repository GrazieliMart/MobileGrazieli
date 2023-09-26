import 'package:flutter/material.dart';
import 'package:flutter_application_7/alterar.dart';
import 'aluno.dart';
import 'aluno.repository.dart';




class MyLista extends StatefulWidget {
  const MyLista({super.key});

  @override
  State<MyLista> createState() => _MyListaState();
}

class _MyListaState extends State<MyLista> {
   List<Aluno>lista = [];
   List <Aluno> listaAlunos = AlunoRepository.getListaAlunos;
   List<Aluno> listaBusca = [];
   String nomeBusca="";




    @override
  void initState(){
    listaBusca = List.from(listaAlunos);
    super.initState();
  }

void atualizaLista(String nome){
  listaBusca = List.from(listaAlunos);
  setState(() {
    listaBusca = listaAlunos.where((element) => (
      element.nome.toLowerCase().contains(nome.toLowerCase()))).toList();
    
  });
}

  @override
  Widget build(BuildContext context) {
     final _listaAlunos = AlunoRepository.getListaAlunos;

    return Scaffold(
      appBar: AppBar(title: (Text('ListView')),
     ),

    
 body: Column(children:[ 
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(width:350, height:30, 
              child: TextField (
                style: TextStyle(fontSize: 15),
                decoration:  InputDecoration (
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 184, 206, 225),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (String nome) {
                  nomeBusca = nome;
                  atualizaLista(nomeBusca);
                },
            )
            ),
        ]),
        SizedBox(height: 30),
        Divider(thickness: 2,),


      Expanded(
        child: ListView.separated(
        shrinkWrap: true,
           separatorBuilder: (BuildContext context, int index) =>Divider(thickness:4),
        itemCount: listaBusca.length,
        itemBuilder: (BuildContext context, int index) {  
          return ListTile(
            title: Text(listaBusca[index].nome),
            subtitle: Text(listaBusca[index].ra.toString()),
            leading: CircleAvatar(child: Text(listaBusca[index].nome[0])),
            trailing: SizedBox(
              width: 70,
              child: Row(children: [
                
                Expanded(child:   IconButton(onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                  return MyAlterar(listaBusca[index], index);
                  },));
            },
             icon: Icon(Icons.catching_pokemon_outlined),)),
              
                Expanded(child: IconButton(onPressed: (){
                  Aluno al = _listaAlunos[index];
                AlunoRepository.remover(al);
                  atualizaLista(nomeBusca);
                setState(() {
                  
                });
              
                }, icon: Icon(Icons.delete))),
                ]),)
            );
          }, 
        
          ),
      ),
    
        
      ])
    );
  }
}