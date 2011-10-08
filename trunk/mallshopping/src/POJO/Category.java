package POJO;
// Generated May 31, 2011 10:22:52 AM by Hibernate Tools 3.2.1.GA

import java.util.HashSet;
import java.util.Set;


/**
 * Category generated by hbm2java
 */
public class Category  implements java.io.Serializable {


     private String categoryId;
     private String categoryName;
     private Set categoryChilds = new HashSet(0);
     
	public Category() {
    }

    public Category(String categoryName) {
       this.categoryName = categoryName;
    }
    
    public Category(String categoryName, Set categoryChilds) {
        this.categoryName = categoryName;
        this.categoryChilds = categoryChilds;
     }
   
    public String getCategoryId() {
        return this.categoryId;
    }
    
    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
    public String getCategoryName() {
        return this.categoryName;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }


    public Set getCategoryChilds() {
		return categoryChilds;
	}

	public void setCategoryChilds(Set categoryChilds) {
		this.categoryChilds = categoryChilds;
	}




}

