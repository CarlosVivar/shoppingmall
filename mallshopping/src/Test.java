import javax.servlet.http.HttpServlet;

import UTIL.ResourcesDefault;
import UTIL.StringUtils;

public class Test extends HttpServlet {
	public void uploadFile() {
		System.out.println(getServletContext().getRealPath("/images/fashion/"));
	}

	public static String priceVNFormat(float price) {
		String prices = String.valueOf(new Float(price).intValue());
		String temp = "";
		int i;
		for (i = prices.length(); i >= 3; i -= 3) {
			temp = prices.substring(i - 3, i) + "." + temp;

		}
		if (i != 0) {
			temp = prices.substring(0, i) + "." + temp;

		}
		return temp.substring(0, temp.length() - 1);
	}

	public static void main(String[] args) throws InstantiationException,
			IllegalAccessException {
		float price = 103450000.0f;
		System.out.println(priceVNFormat(price));
		// String
		// folderSource=getcu.class.newInstance().getServletContext().getRealPath("/images/"+"/");
		// System.out.println(folderSource);
		// String
		// folderDes=ResourcesDefault.getServletContext.getRealPath("/images/fashion/"+"/");
		// String
		// sourcePath=folderSource+"accept.gif",desPath=folderDes+"accept.gif";
		// File inputFile=new File(sourcePath),outputFile =new File(desPath);
		// byte[] buffer=new byte[1024*4];
		// try{
		// FileInputStream input=new FileInputStream(inputFile);
		// FileOutputStream output=new FileOutputStream(outputFile);
		// long count=0;
		// int n=0;
		// while(-1!=(n=input.read(buffer))){
		// output.write(buffer,0,n);
		// }
		//
		// }catch(Exception e){
		//
		// }

		// List<String> list = new ArrayList<String>();
		// for (int i = 0; i < 5; i++) {
		// list.add(i + "");
		// }
		// for (int i = 0; i < 5; i++) {
		// list.add("");
		// }
		// for (int i = 0; i < 5; i++) {
		// list.add(i + "");
		// }
		//
		// for (int i = 0; i < list.size(); i++) {
		// System.out.println(list.get(i));
		// }
	}
}
