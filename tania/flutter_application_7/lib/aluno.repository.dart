import 'aluno.dart';



class AlunoRepository{

 
  static List<Aluno> _listaAlunos = [];
  static get getListaAlunos => _listaAlunos;
  set listaAlunos(value)=> _listaAlunos = value;

 
  
 void adicionar (Aluno aluno)
 {
  _listaAlunos.add(aluno);
 }

 void imprimir ()
 {
  for (var i=0;i<_listaAlunos.length; i++)
  {
    print("RA: ${_listaAlunos[i].ra}, Nome: ${_listaAlunos[i].nome}");
  }
  print("--------");
 }


 static void remover(Aluno al){
  _listaAlunos.remove(al);
}

}


