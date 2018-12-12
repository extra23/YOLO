package yolo.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import yolo.vo.CourseVO;

@Service
public class NaverSearchService{
    private static String clientID = "NsHPzHEy_bdvm4_5n40J";
    private static String clientSecret = "Jz1Zda_Pje";
 
    //display ==> 몇개 출력
    //start==>몇번쨰부터 (item)
    public List<CourseVO> searchBook(String keyword, int display, int start){
    	List<CourseVO> list = null;
        try {
            URL url;
            url = new URL("https://openapi.naver.com/v1/search/"
                    + "encyc.json?query="
                    + URLEncoder.encode(keyword, "UTF-8")
                    + (display !=0 ? "&display=" +display :"")
                    + (start !=0 ? "&start=" +start :""));
 
            URLConnection urlConn = url.openConnection();
            urlConn.setRequestProperty("X-Naver-Client-Id", clientID);
            urlConn.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            
            XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
            XmlPullParser parser = factory.newPullParser();
            parser.setInput(
                    new InputStreamReader(urlConn.getInputStream()));
            //Test에서 했던 방식은 DOM방식이기때문에? 
            //그래서 이렇게 해도 된다?!??!??!? 
            
            
            
            int eventType = parser.getEventType();
            CourseVO b = null;
            while (eventType != XmlPullParser.END_DOCUMENT) {
                switch (eventType) {
                case XmlPullParser.END_DOCUMENT: // 문서의 끝
                    break;
                case XmlPullParser.START_DOCUMENT:
                    list = new ArrayList<CourseVO>();
                    break;
                case XmlPullParser.END_TAG: {
                    String tag = parser.getName();
                    if(tag.equals("item"))
                    {
                        list.add(b);
                        b = null;
                    }
                }
                case XmlPullParser.START_TAG: {
                    String tag = parser.getName();
                    switch(tag){
                    case "item":
                        b = new CourseVO();
                        break;
                    case "cTitle":
                        if(b != null)
                            b.setcTitle(parser.nextText());
                        break;
                    case "cContent":
                        if(b != null)
                            b.setcContent(parser.nextText());
                        break;
                    case "cSummary":
                        if(b != null)
                            b.setcSummary(parser.nextText());
                        break;
                   
                    }
                    
                }
                }
                eventType = parser.next();
            }
             
            
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (XmlPullParserException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }
}
 
