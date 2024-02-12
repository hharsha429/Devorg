@istest
private class batchtesr {
    static testmethod void my(){
        account acc=new account(name='test',Phone='9949002763');
        insert acc;
        string qur ='select id,name,phone from account';
        test.startTest();
        batchclass v =new batchclass();
        Id d =database.executeBatch(v, 5);
        test.stopTest();
        account ac=[select id,name,phone from account where id=:acc.Id];
            system.assertEquals('mr. test',ac.Name );
        system.assertEquals('+91-9949002763',ac.phone );
        
    }

}