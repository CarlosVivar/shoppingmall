import java.util.Comparator;


import BUS.CategoryChildBUS;
import POJO.CategoryChild;
import POJO.Products;


public class CompareProduct implements Comparator<Products> {
	String lang;
	public CompareProduct(String lang) {
		this.lang=lang;
	}

	@Override
	public int compare(Products p1, Products p2) {
		CategoryChild child1=CategoryChildBUS.getCategoryChild(p1.getCategoryChildId(), lang);
		CategoryChild child2=CategoryChildBUS.getCategoryChild(p2.getCategoryChildId(), lang);
		return child1.getCategoryId().compareTo(child2.getCategoryId());
	}

}
