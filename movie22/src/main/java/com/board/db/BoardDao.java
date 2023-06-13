package com.board.db;

import java.sql.*;
import java.time.*;
import java.util.ArrayList;
public class BoardDao {
	private static final int paginationSize = 3;
	private static final int listSize = 5;


	private Connection getConnection() throws Exception {
		Class.forName("org.mariadb.jdbc.Driver");
		return DriverManager.getConnection(
                "jdbc:mariadb://localhost:3306/movieverse17", "root", "1234");
//		String url = "jdbc:mysql://localhost:3306/sample";

	}
	
	private String getCurrentTime() {
		return LocalDate.now() + " " + LocalTime.now().toString().substring(0,10);
	}
	
    public void insertReviewMovie(String nickname, String userId, int userNum, String review, int reviewStar, String id, String poster_path, String type) {
    	try (Connection conn = getConnection(); Statement stmt = conn.createStatement();) {
    		
			stmt.executeUpdate(String.format(
					"insert into movie_review (m_review_star, member_num, m_review_content, m_review_time, m_review_content_id, member_nick, member_id, poster_path, type)" +
								"values ('%d', '%d', '%s', '%s', '%s', '%s', '%s', '%s', '%s')",reviewStar, userNum, review, getCurrentTime(), id, nickname, userId, poster_path, type ));
			
		} catch(Exception e){
			e.printStackTrace();
		} 
	}
    
    public void insertReviewTv(String nickname, String userId, int userNum, String review, int reviewStar, String id, String poster_path, String type) {
    	try (Connection conn = getConnection(); Statement stmt = conn.createStatement();
		) {
    		
    		stmt.executeUpdate(String.format(
					"insert into tv_review (t_review_star, member_num, t_review_content, t_review_time, t_review_content_id, member_nick, member_id, poster_path, type)" +
								"values ('%d', '%d', '%s', '%s', '%s', '%s', '%s', '%s', '%s')",reviewStar, userNum, review, getCurrentTime(), id , nickname, userId, poster_path, type ));
    		
		} catch(Exception e){
			e.printStackTrace();
		} 
	}
    
    public ArrayList<BoardDto> selectMovieReview(String id, int start, int limit) {
    	
    	ArrayList<BoardDto> dtoList = new ArrayList<BoardDto>();
    	     try ( 
    	         Connection conn = getConnection();
    	         Statement stmt = conn.createStatement();
    	         ResultSet rs = stmt.executeQuery(String.format("select * from movie_review where m_review_content_id='%s' order by m_review_num desc limit %d, %d ", id, start, limit));
    	    		 // order by num desc;
    	     ) {
    	         while (rs.next()) {
    	         	BoardDto dto= new BoardDto();

    	        	dto.setReview_star(rs.getInt("m_review_star"));
    	        	dto.setMember_Num(rs.getInt("member_num"));
    	        	dto.setReview_time(rs.getString("m_review_time"));
    	        	dto.setReview_content_id(rs.getString("m_review_content_id"));
    	        	dto.setReview_content(rs.getString("m_review_content"));
    	        	dto.setMember_nick(rs.getString("member_nick"));

    	        	dtoList.add(dto);
    	         }
    	         
    	     } catch(Exception e) {
    	         e.printStackTrace();
    	     }
    	     return dtoList;
    }
    
    public ArrayList<BoardDto> selectTvReview(String id, int start, int limit) {
    	
    	ArrayList<BoardDto> dtoList = new ArrayList<BoardDto>();
    	
    	     try ( 
    	         Connection conn = getConnection();
    	         Statement stmt = conn.createStatement();
    	         ResultSet rs = stmt.executeQuery(String.format("select * from tv_review where t_review_content_id='%s' order by t_review_num desc limit %d, %d ", id, start, limit));
    	    		 // order by num desc;

    	     ) {
    	         while (rs.next()) {
    	         	BoardDto dto= new BoardDto();

    	        	dto.setReview_star(rs.getInt("t_review_star"));
    	        	dto.setMember_Num(rs.getInt("member_num"));
    	        	dto.setReview_time(rs.getString("t_review_time"));
    	        	dto.setReview_content_id(rs.getString("t_review_content_id"));
    	        	dto.setReview_content(rs.getString("t_review_content"));
    	        	dto.setMember_nick(rs.getString("member_nick"));

    	        	dtoList.add(dto);
    	         }
    	         
    	     } catch(Exception e) {
    	         e.printStackTrace();
    	     }
    	     return dtoList;
    }
    
    public ArrayList<BoardDto> selectUserMoiveReview(String userId, int start, int limit) {
    	ArrayList<BoardDto> dtoList = new ArrayList<BoardDto>();
    	     try ( 
    	         Connection conn = getConnection();
    	         Statement stmt = conn.createStatement();
    	         ResultSet rs = stmt.executeQuery(String.format("select * from movie_review where member_id='%s' limit %d, %d", userId, start, limit));

    	     ) {
    	    	 while (rs.next()) {
    	         	BoardDto dto= new BoardDto();

    	         	dto.setReview_star(rs.getInt("m_review_star"));
    	         	dto.setMember_Num(rs.getInt("member_num"));
    	         	dto.setReview_time(rs.getString("m_review_time"));
    	         	dto.setReview_content_id(rs.getString("m_review_content_id"));
    	         	dto.setPoster_path(rs.getString("poster_path"));
    	         	dto.setType(rs.getString("type"));
    	         	dto.setReview_content(rs.getString("m_review_content"));
    	         	dto.setMember_nick(rs.getString("member_nick"));
    	         	dtoList.add(dto);

    	         }
    	         
    	     } catch(Exception e) {
    	         e.printStackTrace();
    	     }
    	     return dtoList;
    }
    
    public ArrayList<BoardDto> selectUserTvReview(String userId, int start, int limit) {
    	ArrayList<BoardDto> dtoList = new ArrayList<BoardDto>();
    	     try ( 
    	         Connection conn = getConnection();
    	         Statement stmt = conn.createStatement();
    	         ResultSet rs = stmt.executeQuery(String.format("select * from tv_review where member_id='%s' limit %d, %d", userId, start, limit));

    	     ) {
    	    	 while (rs.next()) {
    	         	BoardDto dto= new BoardDto();

    	         	dto.setReview_star(rs.getInt("t_review_star"));
    	         	dto.setMember_Num(rs.getInt("member_num"));
    	         	dto.setReview_time(rs.getString("t_review_time"));
    	         	dto.setReview_content_id(rs.getString("t_review_content_id"));
    	         	dto.setPoster_path(rs.getString("poster_path"));
    	         	dto.setType(rs.getString("type"));
    	         	dto.setReview_content(rs.getString("t_review_content"));
    	         	dto.setMember_nick(rs.getString("member_nick"));

    	         	dtoList.add(dto);

    	         }
    	         
    	     } catch(Exception e) {
    	         e.printStackTrace();
    	     }
    	     return dtoList;
    }
    

    public ArrayList<Pagination> getUserMovieReviewPagination(int pageNo, String userId) {
     
    	ArrayList<Pagination> pgnList = new ArrayList<Pagination>();
        int numRecords = new BoardDao().getUserMovieNumRecords(userId);
  
    	int numPages = (int)Math.ceil((double)numRecords / listSize);

    	int firstLink = ((pageNo - 1) / paginationSize) 
    			* paginationSize + 1;
    	int lastLink = firstLink + paginationSize - 1;
    	if (lastLink > numPages) {
    		lastLink = numPages;
    	}

    	if (firstLink > 1) {
    		pgnList.add(new Pagination("이전", firstLink - 1, false));
    	}

    	for (int i = firstLink; i <= lastLink; i++) {
    		pgnList.add(new Pagination("" + i, i, i == pageNo));
    	}

    	if (lastLink < numPages) {
    		pgnList.add(new Pagination("다음", lastLink + 1, false));
    	}
    	return pgnList;
    }
    
    public int getUserMovieNumRecords(String userId) {
        int numRecords = 0;
        try (
            Connection conn = getConnection();
            Statement stmt = conn.createStatement();
        	
            ResultSet rs = stmt.executeQuery("select count(*) from movie_review where member_id="+userId);
        ) {
            if (rs.next()) {
                numRecords =  rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return numRecords;
    }
    
    public ArrayList<Pagination> getUserTvReviewPagination(int pageNo, String userId) {
        
    	ArrayList<Pagination> pgnList = new ArrayList<Pagination>();
        int numRecords = new BoardDao().getUserTvNumRecords(userId);
  
    	int numPages = (int)Math.ceil((double)numRecords / listSize);

    	int firstLink = ((pageNo - 1) / paginationSize) 
    			* paginationSize + 1;
    	int lastLink = firstLink + paginationSize - 1;
    	if (lastLink > numPages) {
    		lastLink = numPages;
    	}

    	if (firstLink > 1) {
    		pgnList.add(new Pagination("이전", firstLink - 1, false));
    	}

    	for (int i = firstLink; i <= lastLink; i++) {
    		pgnList.add(new Pagination("" + i, i, i == pageNo));
    	}

    	if (lastLink < numPages) {
    		pgnList.add(new Pagination("다음", lastLink + 1, false));
    	}
    	return pgnList;
    }
    
    public int getUserTvNumRecords(String userId) {
        int numRecords = 0;
        try (
            Connection conn = getConnection();
            Statement stmt = conn.createStatement();
        	
        		//이거아님
            ResultSet rs = stmt.executeQuery("select count(*) from tv_review where member_id="+userId);
        ) {
            if (rs.next()) {
                numRecords =  rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return numRecords;
    }
    
    
    public int getMovieNumRecords(String id) {
        int numRecords = 0;
        try (
            Connection conn = getConnection();
            Statement stmt = conn.createStatement();
        	
            ResultSet rs = stmt.executeQuery("select count(*) from movie_review where m_review_content_id="+id);
        ) {
            if (rs.next()) {
                numRecords =  rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return numRecords;
    }
    
    public int getTvNumRecords(String id) {
        int numRecords = 0;
        try (
            Connection conn = getConnection();
            Statement stmt = conn.createStatement();
        	
            ResultSet rs = stmt.executeQuery("select count(*) from tv_review where t_review_content_id="+id);
        ) {
            if (rs.next()) {
                numRecords =  rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return numRecords;
    }
    
    
    public ArrayList<Pagination> getMoviePagination(int pageNo, String id) {
     
    	ArrayList<Pagination> pgnList = new ArrayList<Pagination>();
        int numRecords = new BoardDao().getMovieNumRecords(id);
  
    	int numPages = (int)Math.ceil((double)numRecords / listSize);

    	int firstLink = ((pageNo - 1) / paginationSize) 
    			* paginationSize + 1;
    	int lastLink = firstLink + paginationSize - 1;
    	if (lastLink > numPages) {
    		lastLink = numPages;
    	}

    	if (firstLink > 1) {
    		pgnList.add(new Pagination("이전", firstLink - 1, false));
    	}

    	for (int i = firstLink; i <= lastLink; i++) {
    		pgnList.add(new Pagination("" + i, i, i == pageNo));
    	}

    	if (lastLink < numPages) {
    		pgnList.add(new Pagination("다음", lastLink + 1, false));
    	}
    	return pgnList;
    }

    
    public ArrayList<Pagination> getTvPagination(int pageNo, String id) {
     
    	ArrayList<Pagination> pgnList = new ArrayList<Pagination>();
        int numRecords = new BoardDao().getTvNumRecords(id);
  
    	int numPages = (int)Math.ceil((double)numRecords / listSize);

    	int firstLink = ((pageNo - 1) / paginationSize) 
    			* paginationSize + 1;
    	int lastLink = firstLink + paginationSize - 1;
    	if (lastLink > numPages) {
    		lastLink = numPages;
    	}

    	if (firstLink > 1) {
    		pgnList.add(new Pagination("이전", firstLink - 1, false));
    	}

    	for (int i = firstLink; i <= lastLink; i++) {
    		pgnList.add(new Pagination("" + i, i, i == pageNo));
    	}

    	if (lastLink < numPages) {
    		pgnList.add(new Pagination("다음", lastLink + 1, false));
    	}
    	return pgnList;
    }

	public void setBookmark(String id, String userId, String poster_path, String type) {
		try (Connection conn = getConnection();Statement stmt = conn.createStatement();
				) {
					stmt.executeUpdate(String.format(
							"insert into mark (member_id, poster_path, mark_time, type, data_id)" +
										"values ('%s', '%s', '%s', '%s', '%s')",userId, poster_path, getCurrentTime(), type, id));
				} catch(Exception e){
					e.printStackTrace();
				} 
	}

	
	
	public void deleteBookmark(String id, String userId) {
	try (Connection	conn = getConnection(); Statement stmt = conn.createStatement();
	) {
		stmt.executeUpdate(String.format("delete from mark where member_id='%s' and data_id='%s'", userId, id));

	} catch(Exception e){
		e.printStackTrace();
	} 
	
}


    public void checkBookmark(String id, String userId, String poster_path, String type) {
    	     try ( 
    	         Connection conn = getConnection();
    	         Statement stmt = conn.createStatement();
    	         ResultSet rs = stmt.executeQuery(String.format("select * from mark where member_id='%s' and data_id='%s'", userId, id));
    	     ) {
    	         if (rs.next()) {
    	        	 deleteBookmark(id, userId);
    	         }else {
    	        	 setBookmark(id, userId, poster_path, type);
    	         }
    	         
    	     } catch(Exception e) {
    	         e.printStackTrace();
    	     }
    }
    
    public ArrayList<BoardDto> selectBookmark(String userId, int start, int limit) {
    	ArrayList<BoardDto> dtoList = new ArrayList<BoardDto>();
    	     try ( 
    	         Connection conn = getConnection();
    	         Statement stmt = conn.createStatement();
    	         ResultSet rs = stmt.executeQuery(String.format("select * from mark where member_id='%s' limit %d, %d", userId, start, limit));
    	     ) {
    	         while (rs.next()) {
    	         	BoardDto dto= new BoardDto();

    	        	dto.setPoster_path(rs.getString("poster_path"));
    	        	dto.setMark_time(rs.getString("mark_time"));
    	        	dto.setType(rs.getString("type"));
    	        	dto.setData_id(rs.getString("data_id"));
    	        	dto.setMember_id(rs.getString("member_id"));

    	        	dtoList.add(dto);
    	         }
    	         
    	     } catch(Exception e) {
    	         e.printStackTrace();
    	     }
    	     return dtoList;
    }
    
    public int getBookmarkNumRecords(String userId) {
        int numRecords = 0;
        try (
            Connection conn = getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select count(*) from mark where member_id="+userId);
        ) {
            if (rs.next()) {
                numRecords =  rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return numRecords;
    }
    
    public ArrayList<Pagination> getBookmarkPagination(int pageNo, String userId) {
        
    	ArrayList<Pagination> pgnList = new ArrayList<Pagination>();
        int numRecords = new BoardDao().getBookmarkNumRecords(userId);
  
    	int numPages = (int)Math.ceil((double)numRecords / listSize);

    	int firstLink = ((pageNo - 1) / paginationSize) 
    			* paginationSize + 1;
    	int lastLink = firstLink + paginationSize - 1;
    	if (lastLink > numPages) {
    		lastLink = numPages;
    	}

    	if (firstLink > 1) {
    		pgnList.add(new Pagination("이전", firstLink - 1, false));
    	}

    	for (int i = firstLink; i <= lastLink; i++) {
    		pgnList.add(new Pagination("" + i, i, i == pageNo));
    	}

    	if (lastLink < numPages) {
    		pgnList.add(new Pagination("다음", lastLink + 1, false));
    	}
    	return pgnList;
    }
    
        public void setShareHeader(int userNum, String bank, String accountNum, String userId) {
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement();
              ) {
                 stmt.executeQuery(String.format(
                 "insert into shareHeader (member_num, shareHeader_bankName, shareHeader_accountNum, member_id) values (%d,'%s','%s','%s');",
                userNum, bank, accountNum, userId));
              } catch(Exception e){
                 e.printStackTrace();
              } 
     }
      
     public void setShareParty(int userNum, int ottprice, String selectOption) {
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement();
              ) {
                 String curTime = LocalDate.now() +  LocalTime.now().toString().substring(0,8);
                 stmt.executeQuery(String.format(
                 "insert into shareParty (header_num, ottprice, ott_name,shareParty_time, shareParty_gauge) values (%d, %d,'%s', '%s', 1);",
                userNum, ottprice, selectOption, curTime));
              } catch(Exception e){
                 e.printStackTrace();
              } 
     }
     
     public void setShareMember(int userNum, int shareParty_num) {
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement();
              ) {
                 stmt.executeQuery(String.format(
                 "insert into shareMember (member_num, shareParty_num) values (%d,%d);",
                userNum, shareParty_num));
              } catch(Exception e){
                 e.printStackTrace();
              } 
     }
      
     public void setPartyUpdate(int shareParty_gauge) {
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement();
              ) {
                
                 stmt.executeUpdate(String.format(
                 "update shareParty set shareParty_gauge =%d",
                             shareParty_gauge));
                 
              } catch(Exception e){
                 e.printStackTrace();
              } 
     }
     public ArrayList<Integer> selectMyOttCheck(String userNum) {
     	ArrayList<Integer> List = new ArrayList<Integer>();
     	
     	     try ( 
     	         Connection conn = getConnection();
     	         Statement stmt = conn.createStatement();
     	         ResultSet rs = stmt.executeQuery(String.format("select * from shareMember where member_num='%s'", userNum));
         	     ResultSet rs1 = stmt.executeQuery(String.format("select * from shareMember where member_num='%s'", userNum));

     	     ) {
     	    	 if(rs.next()) {
     	    		 while (rs1.next()) {
     	    			 List.add(rs1.getInt("shareParty_num"));
     	    		 }
     	    	 }else {
     	    		 return null;
     	    	 }
     	     } catch(Exception e) {
     	         e.printStackTrace();
     	     }
     	     return List;
     }

public ArrayList<BoardDto> selectMyOtt(ArrayList<Integer> dtoList1) {
 	ArrayList<BoardDto> dtoList = new ArrayList<BoardDto>();
 	
        for (int i : dtoList1) {
 	     try ( 
 	         Connection conn = getConnection();
 	         Statement stmt = conn.createStatement();
 	         ResultSet rs = stmt.executeQuery("select * from shareParty where shareParty_num="+i);
 	     ) {
 	    	while(rs.next()) {
 	         	 BoardDto dto= new BoardDto();
 	         	 
 	        	 dto.setShareParty_gauge(rs.getInt("shareParty_gauge"));
 	        	 dto.setOtt_name(rs.getString("ott_name"));
 	        	 dto.setOtt_id(rs.getString("ott_id"));
 	        	 dto.setOtt_pw(rs.getString("ott_pw"));
 	        	 dto.setOtt_price((rs.getInt("ott_price")/rs.getInt("shareParty_gauge")));
 	        	 dto.setShareParty_num(rs.getInt("shareParty_num"));
 	        	 

 	     	    dtoList.add(dto);

 	         }
 	         
 	     } catch(Exception e) {
 	         e.printStackTrace();
 	     }
    }
    return dtoList;
}

public ArrayList<BoardDto> selectMyOttLeader(String userNum) {
 	ArrayList<BoardDto> dtoList = new ArrayList<BoardDto>();
 	
 	     try ( 
 	         Connection conn = getConnection();
 	         Statement stmt = conn.createStatement();
 	         ResultSet rs = stmt.executeQuery("select * from shareParty where header_num="+userNum);
 	     ) {
 	    	while(rs.next()) {
 	         	 BoardDto dto= new BoardDto();
 	         	 
 	        	 dto.setShareParty_gauge(rs.getInt("shareParty_gauge"));
 	        	 dto.setOtt_name(rs.getString("ott_name"));
 	        	 dto.setOtt_id(rs.getString("ott_id"));
 	        	 dto.setOtt_pw(rs.getString("ott_pw"));
 	        	 dto.setOtt_price((rs.getInt("ott_price")/rs.getInt("shareParty_gauge")));
 	        	 dto.setShareParty_num(rs.getInt("shareParty_num"));
 	        	 

 	     	     dtoList.add(dto);

 	         }
 	         
 	     } catch(Exception e) {
 	         e.printStackTrace();
 	     }
    return dtoList;
    
}


	public void deleteShare(String userNum, String id) {
		try (	
				Connection	conn = getConnection();
				Statement stmt = conn.createStatement();
				) {
			stmt.executeUpdate(String.format("delete from shareMember where member_num='%s' and shareParty_num='%s'", userNum, id));

		} catch(Exception e){
			e.printStackTrace();
		}
	}
	public void deleteShareLeader(String id) {
		try (	
				Connection	conn = getConnection();
				Statement stmt = conn.createStatement();
				) {
			stmt.executeUpdate(String.format("delete from shareParty where shareParty_num='%s'",id));
			stmt.executeUpdate(String.format("delete from shareMember where shareParty_num='%s'", id));
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	

	public void updateShare(String shareParty_num, int gauge) {
		try (	
				Connection	conn = getConnection();
				Statement stmt = conn.createStatement();
				) {
			stmt.executeUpdate(String.format(
					"update shareParty set shareParty_gauge='%s' where shareParty_num='%s'", gauge-1,shareParty_num));

		} catch(Exception e){
			e.printStackTrace();
		} 

	}
	
	
	public ArrayList<BoardDto> adminSelect() {
	 	ArrayList<BoardDto> dtoList = new ArrayList<BoardDto>();
	 	
	 	     try ( 
	 	         Connection conn = getConnection();
	 	         Statement stmt = conn.createStatement();
	 	         ResultSet rs = stmt.executeQuery("select * from shareMember");
	 	     ) {
	 	    	while(rs.next()) {
	 	         	BoardDto dto= new BoardDto();
	 	        	dto.setShareParty_num(rs.getInt("shareParty_num"));
	 	        	dto.setMem_num(rs.getString("member_num"));
	 	     	    dtoList.add(dto);
	 	         }
	 	         
	 	     } catch(Exception e) {
	 	         e.printStackTrace();
	 	     }
	    return dtoList;
	}
	

	public ArrayList<BoardDto> adminSelect2() {
		
		ArrayList<BoardDto> list = adminSelect();
		
	 	ArrayList<BoardDto> dtoList = new ArrayList<BoardDto>();
        for (BoardDto i : list) {
        	
	 	     try ( 
	 	         Connection conn = getConnection();
	 	         Statement stmt = conn.createStatement();
	 	         ResultSet rs = stmt.executeQuery("select * from shareParty where shareParty_num="+i.getShareParty_num());
	 	     ) {
	 	    	while(rs.next()) {
	 	         	BoardDto dto= new BoardDto();
	 	        	dto.setMoney(rs.getInt("ott_price")/rs.getInt("shareParty_gauge"));
	 	        	dto.setMem_num(i.getMem_num());
	 	     	    dtoList.add(dto);
	 	         }
	 	         
	 	     } catch(Exception e) {
	 	         e.printStackTrace();
	 	     }
        }
	    return dtoList;
	}


	public void adminSelect3() {
		
		ArrayList<BoardDto> list = adminSelect2();
        for (BoardDto i : list) {
        	
        	try (	
    				Connection	conn = getConnection();
    				Statement stmt = conn.createStatement();
        			ResultSet rs = stmt.executeQuery("select * from member where member_num="+i.getMem_num());
    				) {
        		while(rs.next()) {
        			stmt.executeUpdate(String.format(
        					"update member set member_money='%s' where member_num='%s'",rs.getInt("member_money")-i.getMoney(), i.getMem_num()));
        		}
    			
    		} catch(Exception e){
    			e.printStackTrace();
    		} 
        }
	}
	public ArrayList<BoardDto> adminSelect4() {		
	 	ArrayList<BoardDto> dtoList = new ArrayList<BoardDto>();
        	
	 	     try ( 
	 	         Connection conn = getConnection();
	 	         Statement stmt = conn.createStatement();
	 	         ResultSet rs = stmt.executeQuery("select * from shareParty");
	 	     ) {
	 	    	while(rs.next()) {
	 	         	BoardDto dto= new BoardDto();
	 	        	dto.setMoney(rs.getInt("ott_price")/rs.getInt("shareParty_gauge"));
	 	        	dto.setMem_num(rs.getString("header_num"));
	 	     	    dtoList.add(dto);
	 	         }
	 	         
	 	     } catch(Exception e) {
	 	         e.printStackTrace();
	 	     }

	    return dtoList;
	}

	public void adminSelect5() {
		
		ArrayList<BoardDto> list = adminSelect4();
        for (BoardDto i : list) {
        	
        	try (	
    				Connection	conn = getConnection();
    				Statement stmt = conn.createStatement();
        			ResultSet rs = stmt.executeQuery("select * from member where member_num="+i.getMem_num());
    				) {
        		while(rs.next()) {
        			stmt.executeUpdate(String.format(
        					"update member set member_money='%s' where member_num='%s'",rs.getInt("member_money")-i.getMoney(), i.getMem_num()));
        		}
    			
    		} catch(Exception e){
    			e.printStackTrace();
    		} 
        }
	}
	

	}

