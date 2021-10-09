@IsTest
public class Calculator_Tests {

    
    
    
    @isTest
    static void testAddition(){
        System.assertEquals(20, Calculator.addition(10, 10));
    }
    
     @isTest
    static void testSubtraction(){
        System.assertEquals(0, Calculator.subtraction(10, 10));
    }
    
    
     @isTest
    static void testMultiply(){
        System.assertEquals(100, Calculator.multiply(10, 10));
    }
    
     @isTest
    static void testDivide(){
        System.assertEquals(1, Calculator.divide(10, 10));
    }
    
     @isTest
    static void testTrymutiply(){
        
        List<Boolean> exceptions = new List<Boolean>();
        try{
                Calculator.multiply(0, 10);
            } catch (Calculator.CalculatorException awe){
                if(awe.getMessage().equalsIgnoreCase('It doesn\'t make sense to multiply by zero')){
                    exceptions.add(true);
                }
        }
        //System.assertEquals(20, Calculator.multiply(0, 10));
    }
    
     @isTest
    static void testTryDivideDenominador(){
        Boolean caught=false;
        //List<Boolean> exceptions = new List<Boolean>();
        try{
                Calculator.divide(10, 0);
            } catch (Calculator.CalculatorException awe){
               // if(awe.getMessage().equalsIgnoreCase('you still can\'t divide by zero')){
                  //  exceptions.add(true);
               // }
               System.assertEquals('you still can\'t divide by zero', awe.getMessage(),'caught the right exception');
                caught = true;
        }
        System.assert(caught, 'threw expected exception');
    }
     @isTest
    static void testTryDivideresult(){
        
         Boolean caught=false;
        //List<Boolean> exceptions = new List<Boolean>();
        try{
                Calculator.divide(10, 100);
            } catch (Calculator.CalculatorException awe){
               // if(awe.getMessage().equalsIgnoreCase('you still can\'t divide by zero')){
                  //  exceptions.add(true);
               // }
               System.assertEquals('Division returned a negative value.', awe.getMessage(),'caught the right exception');
                caught = true;
        }
        System.assert(caught, 'threw expected exception');
    }
}