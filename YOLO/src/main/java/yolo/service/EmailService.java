package yolo.service;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

import yolo.vo.UserVO;

@Service("EmailService")
public class EmailService implements InterfaceEmailService {

	
	
	public void send_email(UserVO user) {
		//Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "dia3546";
		String hostSMTPpwd = "asdfkj11";
		
		//보내는 사람 Email, 제목, 내용
		String fromEmail = "dia3546@naver.com";
		String fromName = "YOLO관리자";
		String subject = "";
		String msg = "";

		subject = "#YOLO 임시 비밀번호 입니다";
		msg += "<div align='center' style='border:ipx solid black;'>";
		msg += "<h3 style= 'color:blue;'>";
		msg += user.getNickName() +"님의 임시비밀번호 입니다. 비밀번호를 변경하여 사용하세요 </h3>";
		msg += "<p> 임시 비밀번호: ";
		msg += user.getPassword() +"</p></div>";
		
		//받는 사람 email 주소
		String mail = user.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setStartTLSEnabled(true);
			email.addTo(mail,charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
			
		}catch(Exception e) {
			System.out.println("메일발송 실패: "+ e);
		}
		
	}


}
