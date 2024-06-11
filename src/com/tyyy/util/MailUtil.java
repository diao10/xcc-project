package com.tyyy.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date ����ʱ�䣺2017��1��6�� ����12:00:46 
 * @version 1.0 
*/
public class MailUtil {
	public static void sendMail(String fromMail, String user, String password,  
            String toMail,  
            String mailTitle,  
            String mailContent ) throws Exception {  
			
		
			Properties props = new Properties(); //���Լ���һ�������ļ�  
			// ʹ��smtp�����ʼ�����Э��  
			props.put("mail.smtp.host", "smtp.163.com");//�洢�����ʼ�����������Ϣ  
			props.put("mail.smtp.auth", "true");//ͬʱͨ����֤  
			
			props.setProperty("mail.debug", "true");
			props.setProperty("mail.transport.protocol", "smtp");
			Session session = Session.getInstance(props);//���������½�һ���ʼ��Ự  
			//session.setDebug(true); //�������ӡһЩ������Ϣ��  
			
			MimeMessage message = new MimeMessage(session);//���ʼ��Ự�½�һ����Ϣ����  
			message.setFrom(new InternetAddress(fromMail));//���÷����˵ĵ�ַ  
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));//�����ռ���,���������������ΪTO  
			message.setSubject(mailTitle);//���ñ���  
			//�����ż�����  
			//message.setText(mailContent); //���� ���ı� �ʼ� todo  
			message.setContent(mailContent, "text/html;charset=gbk"); //����HTML�ʼ���������ʽ�ȽϷḻ  
			message.setSentDate(new Date());//���÷���ʱ��  
			message.saveChanges();//�洢�ʼ���Ϣ  
			
			//�����ʼ�  
			//Transport transport = session.getTransport("smtp");  
			Transport transport = session.getTransport();  
			transport.connect(user, password);  
			transport.sendMessage(message, message.getAllRecipients());//�����ʼ�,���еڶ�����������������õ��ռ��˵�ַ  
			transport.close();  
	}  
	public static void main(String[] args) throws Exception {  
		sendMail("att_master@163.com", "att_master", "ve7474748",  
		"372944573@qq.com",  
		"����ҩҵ�˺ż����ʼ�",  
		"<a>html Ԫ��</a>��<b>�ʼ�����</b>");
	}  
}
