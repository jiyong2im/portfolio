package com.board.json;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
//import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


//영화종류 숫자 분류
/*

	
name	:	Western
디즈니 :337
넷플 : 8 
왓챠 :97
*/
/*
 영화 하나 당 종목별 숫자 부유받은게있음 그걸 dto 메소드 배열로 넣고다시 사용 할 땐 그 배열에 있는 값을 루프돌려서
 사용한다.	
 여기서 genrse를 보내 줄 때 list형식으로 보내 줄지, 아니면 그냥 스트링으로 하나의 문자열로 보내줄지 정해야한다. 
 */
// 이거 dao 중복제거해야함 우선 확실히 이걸로 쓸지 모르니까 우선 냅두는데 너무 중복이 많음. !

//for (JsonDTO dto: infoList) { 
//	System.out.println(dto.getMovieInfo());
public class JsonDAO {
	

	public static List<JsonDTO> getTvPasingData(String providers, String genre){
		String result = "";
		String api = "";
		ArrayList<JsonDTO> infoList = new ArrayList<JsonDTO>();
		int pages = 1;
		
		try {
		
			api = "https://api.themoviedb.org/3/discover/tv?api_key=02861a69e27f1507cbb1a900a685746c"+providers+"&watch_region=KR&language=ko&page="+pages+genre;
			URL url = new URL(api);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONArray list = (JSONArray) jsonObject.get("results");
			
			for (int j = 0; j < list.size(); j++) {
				
			JsonDTO jsonDto = new JsonDTO();
			JSONObject contents = (JSONObject) list.get(j);
			
			if(contents.get("poster_path") != null){
				
				jsonDto.setTvName(String.valueOf(contents.get("name")));
				jsonDto.setPoster_path(String.valueOf(contents.get("poster_path")));
				jsonDto.setBackdrop_path(String.valueOf(contents.get("backdrop_path")));
				jsonDto.setId(String.valueOf(contents.get("id")));
				infoList.add(jsonDto);

			}
			

			}

		}catch (Exception e) {
			System.out.println(e);
		}
		
		return infoList;

		
	}
	
	public List<JsonDTO> getMoviePasingData(String providers, String genre){
		String result = "";
		String api = "";
		ArrayList<JsonDTO> infoList = new ArrayList<JsonDTO>();
		int pages = 1;
		
		try {
		
			api = "https://api.themoviedb.org/3/discover/movie?api_key=02861a69e27f1507cbb1a900a685746c"+providers+"&watch_region=KR&language=ko&page="+pages+genre;
			URL url = new URL(api);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONArray list = (JSONArray) jsonObject.get("results");      
			
			for (int j = 0; j < list.size(); j++) {
				
			JsonDTO jsonDto = new JsonDTO();
			JSONObject contents = (JSONObject) list.get(j);
			
			if(contents.get("poster_path") != null){
			
				jsonDto.setPoster_path(String.valueOf(contents.get("poster_path")));
				jsonDto.setBackdrop_path(String.valueOf(contents.get("backdrop_path")));
				jsonDto.setTitle(String.valueOf(contents.get("title")));
				jsonDto.setId(String.valueOf(contents.get("id")));
				infoList.add(jsonDto);
			}
			}

		}catch (Exception e) {
			System.out.println(e);
		}
		
		return infoList;
//		}
		
	}
	// 이거 중간에 포문 없애고 검색했을 떄로 바꿔야함 메인에서 클릭해서 왔을 때는 아이디값으로 와야함. 서치 쿼리 쓰면 걍 다 검색되어서 옴
	public ArrayList<JsonDTO> getSearchData(String title){
		String result = "";
		String api = "";
		ArrayList<JsonDTO> infoList = new ArrayList<JsonDTO>();
		String type = "movie";
		// movie로 한번 돌리고 tv로 한번 돌리는 내생각인데...
		for(int sex = 0; sex <2; sex++) {
		try {
			//영화 시리즈 검색 할 때 만약 movie 지워서 안되면 걍두번 실행하자
			api ="https://api.themoviedb.org/3/search/"+type+"?api_key=02861a69e27f1507cbb1a900a685746c&language=ko-KR&page=1&query="+title;

			URL url = new URL(api);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONArray list = (JSONArray) jsonObject.get("results");
			for (int j = 0; j < list.size(); j++) {
			// 이친구 뭔지...
			JsonDTO jsonDto = new JsonDTO();
			JSONObject contents = (JSONObject) list.get(j);
			jsonDto.setType(type);
			
			if(!contents.get("poster_path").equals(null)){
			jsonDto.setId(String.valueOf(contents.get("id")));
			jsonDto.setPoster_path(String.valueOf(contents.get("poster_path")));
			jsonDto.setBackdrop_path(String.valueOf(contents.get("backdrop_path")));
			if(type.equals("movie")) {
			jsonDto.setTitle(String.valueOf(contents.get("title")));
			}else {
				jsonDto.setTitle(String.valueOf(contents.get("name")));
				}
			}
			infoList.add(jsonDto);
			}
		}catch (Exception e) {
			System.out.println(e);}
		type = "tv";
		}
		return infoList;		
	}
	
	public int getSearchNumber(String title){
		String result = "";
		String api = "";
		String type = "movie";
		int num =0;

		// movie로 한번 돌리고 tv로 한번 돌리는 내생각인데...
		for(int sex = 0; sex <2; sex++) {
		try {
			//영화 시리즈 검색 할 때 만약 movie 지워서 안되면 걍두번 실행하자
			api ="https://api.themoviedb.org/3/search/"+type+"?api_key=02861a69e27f1507cbb1a900a685746c&language=ko-KR&page=1&query="+title;

			URL url = new URL(api);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONArray list = (JSONArray) jsonObject.get("results");
			for (int j = 0; j < list.size(); j++) {
				// 이친구 뭔지...
				JsonDTO jsonDto = new JsonDTO();
				JSONObject contents = (JSONObject) list.get(j);
				jsonDto.setType(type);
				
				if(!contents.get("poster_path").equals(null)){
				num = num +1;   
				}
				}
			}catch (Exception e) {
				System.out.println(e);}
			type = "tv";
			}
		return num;		
	}

//중요 !!!!!!!!!!!!!!!tv 시리즈는 제목이 title가 아니기 떄문에 새로 하나 더 만들어야 한다 !!!!!안 되면 이점 주목!!!!!!!!

	public JsonDTO getClickItem(String id, String type){
		String result = "";
		String api = "";
		JsonDTO jsonDto = new JsonDTO();
		ArrayList<String> genreList = null;
		ArrayList<String> networkList = null;

		try {

			api ="https://api.themoviedb.org/3/"+type+"/"+id+"?api_key=02861a69e27f1507cbb1a900a685746c&language=ko&region=KR";
			URL url = new URL(api);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			
			jsonDto.setId(String.valueOf(jsonObject.get("id")));
			jsonDto.setVote_average(String.valueOf(jsonObject.get("vote_average")));
			jsonDto.setOverview(String.valueOf(jsonObject.get("overview")));
			jsonDto.setPoster_path(String.valueOf(jsonObject.get("poster_path")));
			jsonDto.setBackdrop_path(String.valueOf(jsonObject.get("backdrop_path")));
			jsonDto.setHomePage(String.valueOf(jsonObject.get("homepage")));

			// 장르 id를 List<integer> 형태로 저장 → 장르 비교를 위한 작업
			JSONArray genre_list = (JSONArray) jsonObject.get("genres");
            genreList = new ArrayList<String>();
			for (int k = 0; k < genre_list.size(); k++) {
//		        JSONObject jsonObj = (JSONObject)jsonArray.get(i);
//		        
//		        System.out.println((String)jsonObj.get("name")); 
				JSONObject jsonObj = (JSONObject)(genre_list.get(k));
				genreList.add(String.valueOf(jsonObj.get("name")));
				
			}
			jsonDto.setGenres(genreList);

			if(type.equals("movie")) {
				jsonDto.setTitle(String.valueOf(jsonObject.get("title")));
				jsonDto.setRelease_date(String.valueOf(jsonObject.get("release_date")));
			}else {
			jsonDto.setTitle(String.valueOf(jsonObject.get("name")));
			jsonDto.setRelease_date(String.valueOf(jsonObject.get("first_air_date")));
			
			
//			System.out.print(221);

			
			JSONArray network_list = (JSONArray) jsonObject.get("networks");
			networkList = new ArrayList<String>();
			for (int ii = 0; ii < network_list.size(); ii++) {
				JSONObject jsonobj = (JSONObject)(network_list.get(ii));
				networkList.add(String.valueOf(jsonobj.get("logo_path")));
//				System.out.print(String.valueOf(jsonobj.get("logo_path"))+11);
			}
			jsonDto.setLogo_path(networkList);
			}
		}catch (Exception e) {System.out.println(e);}

		return jsonDto;
	}
	
	public ArrayList<JsonDTO> getCredits(String id, String type){
		String result = "";
		String api = "";
		ArrayList<JsonDTO> infoList = new ArrayList<JsonDTO>();
		
		try {
			api ="https://api.themoviedb.org/3/"+type+"/"+id+"/credits?api_key=02861a69e27f1507cbb1a900a685746c&language=ko&region=KR";
			URL url = new URL(api);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
		
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONArray list = (JSONArray) jsonObject.get("cast");
			
			for (int j = 0; j < list.size(); j++) {

				JsonDTO jsonDto = new JsonDTO();
				JSONObject contents = (JSONObject) list.get(j);
			
					jsonDto.setProfile_path(String.valueOf(contents.get("profile_path")));
					jsonDto.setPersonName(String.valueOf(contents.get("name")));
					jsonDto.setCharacterName(String.valueOf(contents.get("charcter")));	
//					System.out.println(jsonDto.getProfile_path());
            infoList.add(jsonDto);
			}
		}catch (Exception e) {
			System.out.println(e);
		}
       


		return infoList;
	}
	
	public JsonDTO getCreditsCrew(String id, String type){
		String result = "";
		String api = "";
		JsonDTO jsonDto = new JsonDTO();

		try {
			api ="https://api.themoviedb.org/3/"+type+"/"+id+"/credits?api_key=02861a69e27f1507cbb1a900a685746c&language=ko&region=KR";
			URL url = new URL(api);
			BufferedReader bf;
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			result = bf.readLine();
		
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONArray list = (JSONArray) jsonObject.get("crew");
			
			for (int j = 0; j < list.size(); j++) {
				
				JSONObject contents = (JSONObject) list.get(j);
				
				if(String.valueOf(contents.get("job")).toString().equals("Director")) {
					jsonDto.setJob(String.valueOf(contents.get("job")));
					jsonDto.setProfile_path(String.valueOf(contents.get("profile_path")));
					jsonDto.setPersonName(String.valueOf(contents.get("name")));
					break;
				}			
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return jsonDto;
	}
	
	
	}

