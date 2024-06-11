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
 * @date 创建时间：2017年1月3日 下午4:25:41 
 * @version 1.0 
*/
public class Test {
	public static void main(String[] args) throws Exception {  
		//查找以Java开头,任意结尾的字符串 ^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+; 
		 Pattern pattern = Pattern.compile("^(.*)+(/dist/){1}(.*)");
		 Matcher matcher = pattern.matcher("/jsp/messageContent.jsp");
		 boolean b= matcher.matches();
		 //当条件满足时，将返回true，否则返回false
		 System.out.println(b);
	}  
}
