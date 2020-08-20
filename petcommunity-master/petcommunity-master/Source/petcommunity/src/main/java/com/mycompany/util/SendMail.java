package com.mycompany.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public SendMail() {
	}

	public static String [] getPassword() {
		FileReader fr = null;
		BufferedReader br = null;

		String mail [] = new String [2];
		try {
			fr = new FileReader("D:/mail.txt");
			br = new BufferedReader(fr);
			mail[0] = br.readLine();
			mail[1] = br.readLine();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mail;
	}

	public static void sendMail(String to, String subject, String mainContent) { // 받는 사람 메일 주소, 메일 내용을 받아와서 메일 전송
		String user = getPassword()[0];
		String password = getPassword()[1];
		String host = "smtp.naver.com";
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			// Subject
			// message.setSubject("임시 비밀번호 발급 메일입니다.");
			message.setSubject(subject);
			// Text
			message.setText(mainContent);
			// send the message
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}

