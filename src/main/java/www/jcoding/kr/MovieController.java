package www.jcoding.kr;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Logger;

import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

public class MovieController {
	Logger logger = Logger.getLogger(MovieController.class.getSimpleName());
	
	public String getMovieInfo(String repNationCd, int when) {
		final String KEY = "bb02836a778e48413215de69285f2126";
		String result = new String();
		
		StringBuilder sb = new StringBuilder();
		sb.append("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json");
		sb.append("?key=").append(KEY);
		
		
		sb.append("&targetDt=").append(getDate(when));
		sb.append("&repNationCd=").append(repNationCd);
		
        HttpClient httpClient = HttpClientBuilder.create()
				.setMaxConnTotal(100)
				.setMaxConnPerRoute(5)
				.build();
		
		HttpComponentsClientHttpRequestFactory factory = new HttpComponentsClientHttpRequestFactory();
		factory.setReadTimeout(10000); 		// 읽기 시간초과 5초
		factory.setConnectTimeout(50000); 	// 연결 시간초과 3초
		factory.setHttpClient(httpClient);
		
		RestTemplate restTemplate = new RestTemplate(factory);
		
		logger.info(sb.toString());
		
		result = restTemplate.getForObject(sb.toString(), String.class);
		logger.info(result);
		return result;
	}
	/**
	 * 
	 * @param days : 0 -> today, -1 -> yesterday, -2 -> two days ago
	 * @return
	 */
	private String getDate(int days) {
		LocalDate today = LocalDate.now();
		LocalDate targetDay = today.minusDays(1);
		if(days < 0) {
			targetDay = today.minusDays(Math.abs(days));
		}
		return targetDay.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
	}
}
