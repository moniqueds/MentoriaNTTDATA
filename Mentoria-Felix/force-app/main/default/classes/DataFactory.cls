public with sharing class DataFactory {
    public static Cliente__c createCliente() {
        Cliente__c cliente = new Cliente__c();
        cliente.Name = 'Teste Classe'; 
        cliente.Idade__c = 33;
        cliente.Data_de_Nascimento__c = System.today();
        cliente.Profissao__c = 'Teste';
        return cliente;
    }
}




// DataFactory A Test Data Factory is used to create all your records you need for your tests in one place. 
//This makes it easy to fix your unit tests when a validation rule or new required field is added. 
//It also arguably reduces the complexity of your code, since you're now effectively using a factory pattern to create all of your data,
// which reduces the amount of code you're repeating.