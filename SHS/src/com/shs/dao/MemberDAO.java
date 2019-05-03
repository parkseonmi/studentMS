package com.shs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shs.dto.MemberDTO;
import com.shs.mybatis.SqlMapConfig;

public class MemberDAO {
	// MyBatis 세팅값 호출
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	
	// mapper에 접근하기 위한 SqlSession
	SqlSession sqlSession;
	
	// Singleton패턴을 활용한 DAO객체 사용
	// : 객체생성은 1회만 동작하고 생성된 객체를 빌려쓰는 형태
	// : + 외부에서는 객체생성이 불가능하게 잠금!
	private MemberDAO() { } // 외부에서 객체생성 못하게 막음
	
	// 외부에서 빌려서 사용할 객체 생성(instance)
	private static MemberDAO instance = new MemberDAO();
	
	// 외부에서 getInstance()를 호출하면 객체를 빌려줌
	public static MemberDAO getInstance() {
		return instance;
	}
	
	int result = 0;
	
	// 학생등록
	public int memInsert(MemberDTO mDto) {
		
		// (11) mybatis를 사용하기 위해 sqlSessionFactory를 사용하여 sqlSession을 생성
		// 		매개변수로 true를 넣어 auto commit 기능 추가
		// mybatis공장(sqlSessionFactory)에서 일할 노동자를 하나 만듦
		sqlSession = sqlSessionFactory.openSession(true); // commit방법 1(true)
		// sqlSession.commit(); // commit방법 2
		
		try {
			// 이름이 memInsert인 sql문에 mDto를 가지고 실행
			// 성공하면 result값은 1
			// (12) 생성된 sqlSession을 사용하여 mybatis insert 구문을 실행(**Mapper.xml),
			//		memInsert를  ID값으로 가지는 SQL문을 실행
			//		SQL문 바인딩변수(ex. #{sid})에 들어갈 값은 mDto
			// 결론 : Mapper.xml로 가서 memInsert SQL문의 mDto값을 바인딩변수로 채워주고 SQL문을 실행해라
			result = sqlSession.insert("memInsert", mDto);
			// (14) DB에서 실행한 SQL문의 결과가 result 변수에 담김
			
			if (result > 0) {
				System.out.println("등록 성공");
			} else {
				System.out.println("등록 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close(); // 자원반납
		}
		// (15) DB에서 SQL문 실행 결과가 담긴 result 변수를 호출했던 곳(InsertPlayAction)으로 전송
		return result;
	}
	
	// 출석부(학생 전체 출력)
	public List<MemberDTO> memSelect() {
		
		sqlSession = sqlSessionFactory.openSession();
		List<MemberDTO> list = null;
		try {
			// selectList: mybatis 함수
			list = sqlSession.selectList("memSelect");
			
			// 전체 출력하고 싶을 때 foreach
			for (MemberDTO memberDTO : list) {
				System.out.print(memberDTO.getSid() + ", ");
				System.out.print(memberDTO.getSname() + ", ");
				System.out.print(memberDTO.getSphone());
				System.out.println();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}
	
	// 학생정보 출력(1명)-Update페이지 출력시 사용
	public MemberDTO memInfo(int id) {
		sqlSession = sqlSessionFactory.openSession();
		MemberDTO mDto = null;
		
		try {
			// 한 줄 값은 DTO, 여러줄은 list, 하나는 변수로 넣는다.
			mDto = sqlSession.selectOne("memInfo", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return mDto;
	}
	
	// 학생정보 수정
	public int memUpdate(MemberDTO mDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.update("memUpdate", mDto);
			
			if(result > 0) {
				System.out.println("수정성공");
			} else {
				System.out.println("수정실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 학생 제적
	public int memDelete(int id) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.delete("memDelete", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 학생검색(이름)
	public List<MemberDTO> memSearch(String name) {
		
		List<MemberDTO> list = null;
		sqlSession = sqlSessionFactory.openSession();
		
		 try {
			 
			list = sqlSession.selectList("memSearch", name);
			
			for (MemberDTO memberDTO : list) {
				System.out.print(memberDTO.getSid() + ", ");
				System.out.print(memberDTO.getSname() + ", ");
				System.out.print(memberDTO.getSphone());
				System.out.println();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		 return list;
	}
}
