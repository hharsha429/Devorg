public class TestCoverage {
    public string  objectIdQuery{set;get;} 
    public string TestCoverage1(){
        
     //Testlist=new ApexCodeCoverageAggregate(); 
          objectIdQuery = 'SELECT id, ApexClassorTriggerId, NumLinesCovered, NumLinesUncovered FROM ApexCodeCoverage'; 
        return objectIdQuery;
        
    }

}