package kh.spring.fongdang.common;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.ssl.SSLContextBuilder;
import org.apache.http.ssl.TrustStrategy;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


/**
 * 외부 API 요청 Util
 * 
 * @since 2020.12.18.
 */

@Component
public class ApiRequestUtil {
	
	private static final Logger logger = LoggerFactory.getLogger(ApiRequestUtil.class);
	
	/**
	 * HTTP timeout 설정
	 */
	private RequestConfig getRequestConfig() {
		// timeout 기본 설정 30초
		return RequestConfig.custom().setSocketTimeout(30000).setConnectTimeout(30000)
				.setConnectionRequestTimeout(30000).build();
	}

	/**
	 * 사업자 API 요청 - POST with body from String
	 * 
	 * @param String url 요청 주소
	 * @param String body
	 * @return
	 */
	public String requestPost(String url, String body) {
		String result = null;

		try {
			// 요청 객체 생성
			HttpClient client = HttpClients.createDefault();
			HttpPost request = new HttpPost(url);

			// body String 처리
			request.setHeader(HttpHeaders.CONTENT_TYPE, "application/json; charset=utf-8");
			request.setHeader(HttpHeaders.ACCEPT, "application/json");
			request.setHeader(HttpHeaders.AUTHORIZATION, "yokAkHtjTw0vyvU9zRTnifTovmWD2Zl8cR57jk85VMqARcRRe/dbu+1Agt+N/U7SXynB4NukTFd4qE4k5/MGRQ==");
			request.setConfig(getRequestConfig());
			request.setEntity(new StringEntity(body, StandardCharsets.UTF_8));
			
			// 요청 후 응답 처리
			HttpResponse response = client.execute(request);
			HttpEntity entity = response.getEntity();
			result = EntityUtils.toString(entity, StandardCharsets.UTF_8);
			logger.debug("requestPost: " + result);

		} catch (UnsupportedEncodingException unsupportedEncodingException) {
			logger.warn("외부 API POST - body 요청 중 UnsupportedEncodingException 발생");
			logger.warn(unsupportedEncodingException.getMessage());
		} catch (IOException ioException) {
			logger.warn("외부 API POST - body 요청 중 IOException 발생");
			logger.warn(ioException.getMessage());
		} catch (ParseException parseException) {
			logger.warn("외부 API POST - body 요청 중 ParseException 발생");
			logger.warn(parseException.getMessage());
		} catch (Exception e) {
			logger.warn("외부 API POST - body 요청 중 Exception 발생");
			logger.warn(e.getMessage());
		}
		return result;
	}
}
