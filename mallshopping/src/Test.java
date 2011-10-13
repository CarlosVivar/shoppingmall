import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

import UTIL.ResourcesDefault;

public class Test extends HttpServlet{
	public  void uploadFile(){
		System.out.println(getServletContext().getRealPath("/images/fashion/"));
	}
	public static void main(String[] args) throws InstantiationException, IllegalAccessException {
		new Test().uploadFile();
//		 String	 folderSource=getcu.class.newInstance().getServletContext().getRealPath("/images/"+"/");
//		 System.out.println(folderSource);
//		 String folderDes=ResourcesDefault.getServletContext.getRealPath("/images/fashion/"+"/");
//		 String
//		 sourcePath=folderSource+"accept.gif",desPath=folderDes+"accept.gif";
//		 File inputFile=new File(sourcePath),outputFile =new File(desPath);
//		 byte[] buffer=new byte[1024*4];
//		 try{
//		 FileInputStream input=new FileInputStream(inputFile);
//		 FileOutputStream output=new FileOutputStream(outputFile);
//		 long count=0;
//		 int n=0;
//		 while(-1!=(n=input.read(buffer))){
//		 output.write(buffer,0,n);
//		 }
//		
//		 }catch(Exception e){
//		
//		 }

//		List<String> list = new ArrayList<String>();
//		for (int i = 0; i < 5; i++) {
//			list.add(i + "");
//		}
//		for (int i = 0; i < 5; i++) {
//			list.add("");
//		}
//		for (int i = 0; i < 5; i++) {
//			list.add(i + "");
//		}
//
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println(list.get(i));
//		}
	}
}
