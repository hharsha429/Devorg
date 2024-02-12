public class Buttonex {

public Buttonex (ApexPages.StandardController controller) {
patient__c acc = (Patient__c)controller.getRecord();
String accNum = acc.Patient_Name__c;
//Assign "Account_[Ac].pdf" as a file name
String fileName = 'Patient__c' + accNum + '.pdf';
Apexpages.currentPage().getHeaders().put('content-disposition', 'attachment; filename=' + fileName);
}
}