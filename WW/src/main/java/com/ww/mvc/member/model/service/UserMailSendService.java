package com.ww.mvc.member.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ww.mvc.member.model.dao.MemberMapper;
import com.ww.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Repository
public class UserMailSendService {
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private SqlSessionTemplate sql;
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	public void mailSendWithPassword(String id, String email, HttpServletRequest request) {
		log.info("usermail서비스로 들어는 오니???");
		// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
				String key = getKey(false, 6);
				String key1 = getKey(false, 6);
				log.info("key는 찍혀?"+key);
				log.info("key1는 찍혀?"+key1);

			mapper = sql.getMapper(MemberMapper.class);
				
				// 회원 이름 꺼내는 코드
				Member m = mapper.selectMember(id);
				log.info("M:"+m);
				String name = m.getName();
				log.info("M.:"+m.getName());		
				MimeMessage mail = mailSender.createMimeMessage();
				String htmlStr = "<h2>안녕하세요 '"+ name +"' 님</h2><br><br>" 
						+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
						+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
						+ "<h3><a href='http://localhost:8088/mvc/member/login'>WhereWare :p 홈페이지 접속 ^0^</a></h3><br><br>"
						+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
				try {
					mail.setSubject("[MS :p] 임시 비밀번호가 발급되었습니다", "utf-8");
					mail.setText(htmlStr, "utf-8", "html");
					mail.addRecipient(RecipientType.TO, new InternetAddress(email));
					mailSender.send(mail);
				} catch (MessagingException e) { 
					e.printStackTrace();
				}
				// 비밀번호 암호화해주는 메서드

				key = passwordEncoder.encode(key);

				log.info("memberDao.searchPassword의 이전");
			
				mapper.searchPassword(id, email, key);
				log.info("memberDao.searchPassword의 이후");
			
}

		// 이메일 난수 만드는 메서드
			private String init() {
				Random ran = new Random();
				StringBuffer sb = new StringBuffer();
				int num = 0;

				do {
			    	num = ran.nextInt(75) + 48;
						if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
							sb.append((char) num);
						} else {
					continue;
				}

			} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();
		}
		// 난수를 이용한 키 생성
		private boolean lowerCheck;
		private int size;

		public String getKey(boolean lowerCheck, int size) {
			this.lowerCheck = lowerCheck;
			this.size = size;
			return init();
		}

	}


