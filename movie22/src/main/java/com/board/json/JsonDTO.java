package com.board.json;

import java.util.ArrayList;


public class JsonDTO {
	
	
	private String title ="";
	private String poster_path = "";
	private String backdrop_path = "";
	private String overview = "";
	private ArrayList<String> genre = null;
	private String release_date ="";
	private String vote_average = "";
	private String id = "";
	private ArrayList<String> genreName = null;
	private String personName = "";
	private String characterName = "";
	private String profile_path = "";
	private String job = "";
	private String known_for_department = "";
	private String tvName = "";
	private String homePage = "";
	private String first_air_date ="";
	private ArrayList<String> logo_path = null;
	private String type ="";
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public ArrayList<String> getLogo_path() {
		return logo_path;
	}
	public void setLogo_path(ArrayList<String> logo_path) {
		this.logo_path = logo_path;
	}
	public String getFirst_air_date() {
		return first_air_date;
	}
	public void setFirst_air_date(String first_air_date) {
		this.first_air_date = first_air_date;
	}
	public ArrayList<String> getGenre() {
		return genre;
	}
	public void setGenre(ArrayList<String> genre) {
		this.genre = genre;
	}
	public String getHomePage() {
		return homePage;
	}
	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}
	public String getTvName() {
		return tvName;
	}
	public void setTvName(String tvName) {
		this.tvName = tvName;
	}
	public String getKnown_for_department() {
		return known_for_department;
	}
	public void setKnown_for_department(String known_for_department) {
		this.known_for_department = known_for_department;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public String getCharacterName() {
		return characterName;
	}
	public void setCharacterName(String characterName) {
		this.characterName = characterName;
	}
	public String getProfile_path() {
		return profile_path;
	}
	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public ArrayList<String> getGenreName() {
		return genreName;
	}
	public void setGenreName(ArrayList<String> genreName) {
		this.genreName = genreName;
	}
	public String getRelease_date() {
		return release_date;
	}
	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}
	public String getVote_average() {
		return vote_average;
	}
	public void setVote_average(String vote_average) {
		this.vote_average = vote_average;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster_path() {
		return poster_path;
	}
	public void setPoster_path(String poster_path) {
		this.poster_path = poster_path;
	}
	public String getBackdrop_path() {
		return backdrop_path;
	}
	public void setBackdrop_path(String backdrop_path) {
		this.backdrop_path = backdrop_path;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String movieInfo) {
		this.overview = movieInfo;
	}

	public void setGenres(ArrayList<String> genre) {
		this.genre = genre;
	}
	public ArrayList<String> getGenrse() {
		return genre;

		
	}
	
}
