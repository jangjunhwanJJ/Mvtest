package www.jcoding.kr;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.apache.http.Header;
import org.apache.http.HttpHeaders;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicHeader;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

public class NaverApi {
	Logger logger = Logger.getLogger(NaverApi.class.getSimpleName());
	
	public String getMovieInfo(String query, int display, int start) {
		String result = new String();
		
		final String CLIENT_ID = "BNidahojeq2_rJKwP41X";
		final String CLIENT_SECRET = "gZ5_wDOEIB";
		
		StringBuilder sb = new StringBuilder();
		sb.append("https://openapi.naver.com/v1/search/movie.json");
		sb.append("?query=");
		String text = null;
		try {
			text = URLEncoder.encode(query, "UTF-8");
			sb.append(text);
		}catch(UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패");
		}
		Header jsonHeader = new BasicHeader("X-Naver-Client-Id", CLIENT_ID);
		Header authHeader = new BasicHeader("X-Naver-Client-Secret", CLIENT_SECRET);
		List<Header> headers = new ArrayList<Header>();
		headers.add(jsonHeader);
		headers.add(authHeader);
		
        HttpClient httpClient = HttpClientBuilder.create()
				.setMaxConnTotal(100)
				.setMaxConnPerRoute(5)
				.setDefaultHeaders(headers)
				.build();
		
		HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
		factory.setReadTimeout(5000); 		// 읽기 시간초과 5초
		factory.setConnectTimeout(3000); 	// 연결 시간초과 3초
		factory.setHttpClient(httpClient);
		
		RestTemplate restTemplate = new RestTemplate(factory);
		
		logger.info(sb.toString());
		
		String response = restTemplate.getForObject(sb.toString(), String.class);
		logger.info(response);
		return result;
	}
}
