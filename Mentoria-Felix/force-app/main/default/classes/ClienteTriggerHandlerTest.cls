@isTest
public class ClienteTriggerHandlerTest {
    @TestSetup
    public static void setup(){
        Cliente__c cliente = DataFactory.createCliente();
        insert cliente;
    }
    @IsTest
    public static void teste01(){
        Cliente__c cliente = [SELECT Id, Name, Profissao__c FROM Cliente__c LIMIT 1];
        cliente.Profissao__c = 'Programador';
        update cliente;
        Test.startTest();
        String resp = ClienteTriggerHandler.creditoCliente(cliente);
        System.assertEquals('Crédito adicionado com sucesso.', resp);
        Test.stopTest();        
    }
    @isTest
    public static void teste02(){
        Cliente__c cliente = [SELECT Id, Name, Profissao__c FROM Cliente__c LIMIT 1];
        cliente.Profissao__c = 'Advogado';
        update cliente;
        Test.startTest();
        String resp = ClienteTriggerHandler.creditoCliente(cliente);
        System.assertEquals('Crédito adicionado com sucesso.', resp);
        Test.stopTest();        
    }
    @isTest
    public static void teste03(){
        Cliente__c cliente = [SELECT Id, Name, Profissao__c FROM Cliente__c LIMIT 1];
        cliente.Profissao__c = 'Juiz';
        update cliente;
        Test.startTest();
        String resp = ClienteTriggerHandler.creditoCliente(cliente);
        System.assertEquals('Crédito adicionado com sucesso.', resp);
        Test.stopTest();        
    }
    @isTest
    public static void teste04(){
        Cliente__c cliente = [SELECT Id, Name, Profissao__c FROM Cliente__c LIMIT 1];
        cliente.Profissao__c = 'Professor';
        update cliente;
        Test.startTest();
        String resp = ClienteTriggerHandler.creditoCliente(cliente);
        System.assertEquals('Profissão inválida.', resp);
        Test.stopTest();        
    }

}
