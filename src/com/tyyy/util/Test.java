package com.tyyy.util;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date ����ʱ�䣺2017��1��3�� ����4:25:41 
 * @version 1.0 
*/
public class Test {
	public static void main(String[] args) throws Exception {  
		//������Java��ͷ,�����β���ַ��� ^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+; 
		 Pattern pattern = Pattern.compile("^(.*)+(/dist/){1}(.*)");
		 Matcher matcher = pattern.matcher("/jsp/messageContent.jsp");
		 boolean b= matcher.matches();
		 //����������ʱ��������true�����򷵻�false
		 System.out.println(b);
	}  
}
