package www.jcoding.kr;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.Header;
import org.apache.http.HttpHeaders;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicHeader;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

public class BookController {
	
	public List<BookInfo> getBookList(String query, String page, String sort, String size){
		final String APP_KEY = "KakaoAK ";
		StringBuilder sb = new StringBuilder();
		sb.append("https://dapi.kakao.com");
		sb.append("/v3/search/book");
		sb.append("?query=").append(query);
		sb.append("&page=").append(page)
			.append("&sort=").append(sort)
			.append("&size=").append(size);
		
//		System.out.println(sb.toString());
		Header jsonHeader = new BasicHeader(HttpHeaders.CONTENT_TYPE, "application/json");
		Header authHeader = new BasicHeader(HttpHeaders.AUTHORIZATION, APP_KEY);
		List<Header> headers = new ArrayList<Header>();
		headers.add(jsonHeader);
		headers.add(authHeader);
		
		HttpClient httpClient = HttpClientBuilder.create()
				.setMaxConnTotal(100)
				.setMaxConnPerRoute(5)
				.setDefaultHeaders(headers)
				.build();
		
		HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
		factory.setReadTimeout(5000); // 읽기 시간초과 5초
		factory.setConnectTimeout(3000); // 연결 시간초과 3초
		factory.setHttpClient(httpClient);
		
		RestTemplate restTemplate = new RestTemplate(factory);
		
		String response = restTemplate.getForObject(sb.toString(), String.class);
		System.out.println(response);
		JSONObject json = new JSONObject(response);
		JSONArray bookArray = json.getJSONArray("documents");
		
		List<BookInfo> result = new ArrayList<BookInfo>();
		for(int i=0; i<bookArray.length(); i++) {
			JSONObject item = bookArray.getJSONObject(i);
			BookInfo info = BookInfo.parse(item);
			result.add(info);
		}
		
		return result;
	}
}
