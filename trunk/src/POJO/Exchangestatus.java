package POJO;
// Generated Aug 23, 2011 5:43:30 PM by Hibernate Tools 3.2.1.GA



/**
 * Exchangestatus generated by hbm2java
 */
public class Exchangestatus  implements java.io.Serializable {


     private int exchangeStatusId;
     private String exchangeStatusName;

    public Exchangestatus() {
    }

    public Exchangestatus(String exchangeStatusName) {
       this.exchangeStatusName = exchangeStatusName;
    }
   
    public int getExchangeStatusId() {
        return this.exchangeStatusId;
    }
    
    public void setExchangeStatusId(int exchangeStatusId) {
        this.exchangeStatusId = exchangeStatusId;
    }
    public String getExchangeStatusName() {
        return this.exchangeStatusName;
    }
    
    public void setExchangeStatusName(String exchangeStatusName) {
        this.exchangeStatusName = exchangeStatusName;
    }




}


