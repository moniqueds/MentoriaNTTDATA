// lista número par e impar

//criando a classe
public with sharing class ListaNumPar {

    //criando o metodo que vai retornar uma lista, e parametro
    public static List <Integer> listaNumPar (List<Integer> listanum) {
            // criando a lista nova = listanumpar
        List <Integer> listanumpar = new List<Integer>();
        // L = são os números da lista, que serão incluídos na listanum(coleção)
        for (Integer L:listanum) {
            //L, 2 == 0 porque todo número (L) que for dividido e chegar ao zero/nao ter resultado com vírgula, será par.
            if(math.mod(L, 2) ==0){
                // todo número que chegar em zero, será incluso na nova lista de número par= listanumpar
                listanumpar.add(L);
            }
            
        }
        System.debug('os números pares são: '+listanumpar);
        return listanumpar;

    }
    // número impar
    public static List <Integer> listaNumImpar (List<Integer> listanum) {
            
        List <Integer> listanumimpar = new List<Integer>();
        for (Integer L:listanum) {
            //L, 2 != 0 porque todo número (L) que for dividido e não chegar(! = diferente) em zero/ter resultado com vírgula, será impar.
            if(math.mod(L, 2) !=0){
                listanumimpar.add(L);
            }
            
        }
        System.debug('os números impares são: '+listanumimpar);
        return listanumimpar;
    }
}



// TESTAR O CODIGO:
/*List<Integer> lista = new List<Integer>();
lista.add(1);
lista.add(2);
lista.add(3);
lista.add(4);
lista.add(5);
lista.add(6);
lista.add(7);
lista.add(8);
lista.add(9);
lista.add(10);
ListaNumPar.listaNumPar(lista);
ListaNumPar.listaNumImpar(lista);
*/