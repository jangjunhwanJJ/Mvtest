package www.jcoding.kr;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.json.JSONArray;
import org.json.JSONObject;

public class mvNvInfo {
	private String items;
	private String title;
	private String link;
	private String image;
	private String subtitle;
	private String pubDate;
	private String director;
	private Double userRating;
	
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public Double getUserRating() {
		return userRating;
	}
	public void setUserRating(Double userRating) {
		this.userRating = userRating;
	}
	
	public static mvNvInfo parse(JSONObject input) {
		mvNvInfo NmvInfo = new mvNvInfo();
		if(input.has("items")) {
			NmvInfo.setItems(input.getString("items"));
		}
		if(input.has("title")) {
			NmvInfo.setTitle(input.getString("title"));
		}
		if(input.has("link")) {
			NmvInfo.setLink(input.getString("link"));
		}
		if(input.has("image")) {
			NmvInfo.setImage(input.getString("image"));
		}
		if(input.has("subtitle")) {
			NmvInfo.setSubtitle(input.getString("subtitle"));
		}
		if(input.has("pubDate")) {
			NmvInfo.setPubDate(input.getString("pubDate"));
		}
		if(input.has("director")) {
			NmvInfo.setDirector(input.getString("director"));
		}
		if(input.has("userRating")) {
			NmvInfo.setUserRating(input.getDouble("userRating"));
		}	
		return NmvInfo;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
