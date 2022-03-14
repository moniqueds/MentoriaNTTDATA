@isTest
public class ClienteTriggerTest {
    
    @isTest
    public static void clienteTriggerTest() {
        
        Test.startTest();
        Cliente__c cliente = new Cliente__c();
        cliente.Name = 'Teste Classe'; 
        cliente.Idade__c = 33;
        try{
            insert cliente;
        }
        catch(Exception ex)
        {
            Boolean expectedExceptionThrown =  ex.getMessage().contains('Obrigatório informar a data de nascimento.') ? true : false;
            System.assertEquals(expectedExceptionThrown, false);  
        }
        
        Cliente__c cliente1 = new Cliente__c();
        cliente1.Name='Teste Classe'; 
        cliente1.Data_de_Nascimento__c =Date.newInstance(2012,12,12);
        cliente1.Idade__c = 17;
        try{
            insert cliente1;
        }
        catch(Exception ex)
        {
            Boolean expectedExceptionThrown =  ex.getMessage().contains('Usuários menores de 18 anos não são permitidos.') ? true : false;
            System.assertEquals(expectedExceptionThrown, false);  
        }

        Cliente__c cliente2 = new Cliente__c();
        cliente2.Name='Teste Classe'; 
        cliente2.Data_de_Nascimento__c =Date.newInstance(2012,12,12);
        cliente2.Idade__c = 33;
        cliente2.Profissao__c = 'Juiz';
        cliente.Credito__c = 35000;
        try{
            insert cliente2;
        }
        catch(Exception ex)
        {
            Boolean expectedExceptionThrown =  ex.getMessage().contains('Juiz') ? true : false;
            System.assertEquals(expectedExceptionThrown, false); 
        }

        Cliente__c cliente3 = new Cliente__c();
        cliente3.Name='Teste Classe'; 
        cliente3.Data_de_Nascimento__c =Date.newInstance(2012,12,12);
        cliente3.Idade__c = 33;
        cliente3.Profissao__c = 'Programador';
        cliente.Credito__c = 10000;
        try{
            insert cliente3;
        }
        catch(Exception ex)
        {
            Boolean expectedExceptionThrown =  ex.getMessage().contains('Programador') ? true : false;
            System.assertEquals(expectedExceptionThrown, false); 
        }
        
        Cliente__c cliente4 = new Cliente__c();
        cliente4.Name='Teste Classe'; 
        cliente4.Data_de_Nascimento__c =Date.newInstance(2012,12,12);
        cliente4.Idade__c = 33;
        cliente4.Profissao__c = 'Advogado';
        cliente.Credito__c = 5000;
        try{
            insert cliente4;
        }
        catch(Exception ex)
        {
            Boolean expectedExceptionThrown =  ex.getMessage().contains('Advogado') ? true : false;
            System.assertEquals(expectedExceptionThrown, false); 
        }

        Cliente__c cliente5 = new Cliente__c();
        cliente5.Name='Teste Classe'; 
        cliente5.Data_de_Nascimento__c =Date.newInstance(2012,12,12);
        cliente5.Idade__c = 33;
        cliente5.Profissao__c = 'Professor';
        try{
            insert cliente5;
        }
        catch(Exception ex)
        {
            Boolean expectedExceptionThrown =  ex.getMessage().contains('Profissão inválida.') ? true : false;
            System.assertEquals(expectedExceptionThrown, false); 
        }


    Test.stopTest();
    }

}