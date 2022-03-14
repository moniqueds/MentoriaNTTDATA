trigger ClienteTrigger on Cliente__c (before insert, before update, after insert, after update) {
    //Sempre que for before && (update ou insert)
    if(trigger.isBefore && (trigger.isUpdate || trigger.isInsert)){
        ClienteTriggerHandler.dataNascimento(trigger.new);
        ClienteTriggerHandler.idadeMenor(trigger.new);
        ClienteTriggerHandler.contaNull(trigger.new);
        ClienteTriggerHandler.novaOp(trigger.new);
    }
}
