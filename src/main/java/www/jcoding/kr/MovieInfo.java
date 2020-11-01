package www.jcoding.kr;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.json.JSONArray;
import org.json.JSONObject;

public class MovieInfo {
	private String boxofficeType;
	private String rank;
	private String movieNm;
	private String audiAcc; //누적매출액
	
	public String getBoxofficeType() {
		return boxofficeType;
	}
	public void setBoxofficeType(String boxofficeType) {
		this.boxofficeType = boxofficeType;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getAudiAcc() {
		return audiAcc;
	}
	public void setAudiAcc(String audiAcc) {
		this.audiAcc = audiAcc;
	}
	
	public static MovieInfo parse(JSONObject input) {
		MovieInfo info = new MovieInfo();
		if(input.has("boxofficeType")) {
			info.setBoxofficeType(input.getString("boxofficeType"));
		}
		if(input.has("rank")) {
			info.setRank(input.getString("rank"));
		}
		if(input.has("movieNm")) {
			info.setMovieNm(input.getString("movieNm"));
		}if(input.has("audiAcc")) {
			info.setAudiAcc(input.getString("audiAcc"));
		}
		return info;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
