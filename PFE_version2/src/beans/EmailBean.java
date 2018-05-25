package beans;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;


public class EmailBean {
	String senderEmail= "pfe.2018.webapp@gmail.com";
	String pwd= "testpfe@";
	String emailSMTPserver="smtp.gmail.com";
	String emailServerPort="465";
	
	public void send(String receiverEmail, String subject, String emailBody) {
		Properties props= new Properties();
		props.put("mail.smtp.user", senderEmail);
		props.put("mail.smtp.host", emailSMTPserver);
		props.put("mail.smtp.starttls.enable", "true"); 
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.socketFactory.port", emailServerPort); 
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		props.put("mail.smtp.socketFactory.fallback", "false");
		
		
		 try{ 
		 Authenticator auth = new SMTPAuthenticator(); 
		 Session session = Session.getInstance(props, auth); 
		 MimeMessage msg = new MimeMessage(session); 
		 msg.setText(emailBody); 
		 msg.setSubject(subject); 
		 msg.setFrom(new InternetAddress(senderEmail)); 
		 msg.addRecipient(Message.RecipientType.TO, new InternetAddress(receiverEmail)); 
		 Transport.send(msg); 
		 System.out.println("Message sent Successfully:)"); 
		 } catch (Exception mex){ System.out.println("noooooo)"); mex.printStackTrace();}
		 
	}
	
	public class SMTPAuthenticator extends javax.mail.Authenticator { 
		public PasswordAuthentication getPasswordAuthentication() { 
		return new PasswordAuthentication(senderEmail, pwd); 
		} 
	}
	
}
