public with sharing class ClienteTriggerHandler {
    public static void dataNascimento(List<Cliente__c> clientes) {
     //1-Não permitir a inserção de registros com o campo data de nascimento em branco.
        for(Cliente__c cliente : clientes){
            if(cliente.Data_de_Nascimento__c == null){
                cliente.Data_de_Nascimento__c.addError('Obrigatório informar a data de nascimento.');
            }
        }
    }

    public static void idadeMenor(List<Cliente__c> clientes) {
    //2-Não permitir a criação de registros de clientes com menos de 18 anos.
        for(Cliente__c cliente : clientes){
            if(cliente.Idade__c < 18){
                   cliente.Idade__c.addError('Usuários menores de 18 anos não são permitidos.');
               } 
           }   
    }

    public static void contaNull(List<Cliente__c> clientes) {
        //3-Caso o campo conta esteja vazio, criar automaticamente uma conta e adicionar ao campo.
        List<Account> contas = new List<Account>();
        for(Cliente__c cliente : clientes){
            if(cliente.Conta__c == null){
                Account acc = new Account();
                acc.Name = cliente.Name;
                contas.add(acc);    
            } 
        }// inserindo conta caso esteja vazio.   
        if (!contas.isEmpty()) {
            insert contas;   
        }//adicionando ao campo.
        for (Cliente__c cliente : clientes) {
            for (Account conta : contas) {
                if(cliente.Name == conta.Name){
                    cliente.Conta__c = conta.Id;
                }
            }
        }
    }

    public static void novaOp(List<Cliente__c> clientes) {
        List<Opportunity> oppnew = new List<Opportunity>();
         //4-Quando registro for criado, uma nova opportunity deve ser criada e o campo cliente deverá ser preenchido.
        for(Cliente__c cliente : clientes) {
            oppnew.add(new Opportunity(Name=cliente.Name + 'Opportunity',
                                           StageName='Prospecting',
                                           CloseDate=System.today().addMonths(1),
                                           Cliente__c=cliente.Id));
        }
        if(oppnew.size() > 0) {
            insert oppnew;
        }    
    }

    public static String creditoCliente(Cliente__c cliente) {
        if(cliente.Profissao__c == 'Programador'){
            cliente.Credito__c = 10000;
            return 'Crédito adicionado com sucesso.';
        } else if(cliente.Profissao__c == 'Advogado'){
            cliente.Credito__c = 5000;
            return 'Crédito adicionado com sucesso.';
        } else if(cliente.Profissao__c == 'Juiz'){
            cliente.Credito__c = 35000;
            return 'Crédito adicionado com sucesso.';
        } else {
            return 'Profissão inválida.';
        }        
    }
}