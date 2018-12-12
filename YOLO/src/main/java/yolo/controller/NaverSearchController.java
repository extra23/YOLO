package yolo.controller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import yolo.service.NaverSearchService;
import yolo.vo.CourseVO;

/*import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;*/
@Controller("NaverSearchController")
public class NaverSearchController {
	
	@Autowired
	private NaverSearchService naverSearchService;
	
	@RequestMapping("/naverSearch")
	public ModelAndView bookList(@RequestParam(required=false)String keyword){
        ModelAndView mav = new ModelAndView();
        
        if(keyword !=null)
        {
            mav.addObject("naverSearch",naverSearchService.searchBook(keyword,10,1));
        }
        mav.setViewName("naverSearch");
        return mav;
    }
}



/*public static StringBuilder sb;//

@RequestMapping("/test")
public static void main(String[] args) {
    String clientId = "NsHPzHEy_bdvm4_5n40J";// 애플리케이션 클라이언트 아이디값";
    String clientSecret = "Jz1Zda_Pje";// 애플리케이션 클라이언트 시크릿값";\
    int display = 5; // 검색결과갯수. 최대100개
    try {
        String text = URLEncoder.encode("아트메가128", "utf-8");
        String apiURL = "https://openapi.naver.com/v1/search/encyc.json?query=" + text + "&display=" + display + "&";

        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("X-Naver-Client-Id", clientId);
        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if (responseCode == 200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else { 
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        sb = new StringBuilder();
        String line;

        while ((line = br.readLine()) != null) {
            sb.append(line + "\n");
        }
        br.close();
        con.disconnect();
        System.out.println(sb);
    } catch (Exception e) {
        System.out.println(e);
    }

}
}
*/


/*@RequestMapping("/test")
public String test(){
String clientId = "NsHPzHEy_bdvm4_5n40J";//애플리케이션 클라이언트 아이디값";
String clientSecret = "Jz1Zda_Pje";//애플리케이션 클라이언트 시크릿값";
try {
    String text = URLEncoder.encode("yolo", "UTF-8");
    //String apiURL = "https://openapi.naver.com/v1/search/encyc.json?query="+ text; // json 결과
    String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
    URL url = new URL(apiURL);
    HttpURLConnection con = (HttpURLConnection)url.openConnection();
    con.setRequestMethod("GET");
    con.setRequestProperty("X-Naver-Client-Id", clientId);
    con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
    int responseCode = con.getResponseCode();
    BufferedReader br;
    if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
    } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
    }
    String inputLine;
    StringBuffer response = new StringBuffer();
    while ((inputLine = br.readLine()) != null) {
        response.append(inputLine);
    }
    br.close();
    System.out.println(response.toString());
} catch (Exception e) {
    System.out.println(e);
}
return "test";
}
*/


/* private String clientId = "NsHPzHEy_bdvm4_5n40J";//애플리케이션 클라이언트 아이디값";
private String clientSecret = "Jz1Zda_Pje";//애플리케이션 클라이언트 시크릿값";
private String target = "encyc";

    private  query(){
    String apiURL = "https://openapi.naver.com/v1/search/encyc.json?query="+ text; // json 결과
    String data = "file_get_contents(url)";
    String xml = "simplexml_load_string(data)";
    
    return "xml";
    
    }
    public void getEncycSearch() {
    	String xml =
    			
    	return result;
    }*/
    
