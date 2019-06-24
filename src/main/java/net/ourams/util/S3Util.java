package net.ourams.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.SdkClientException;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;

import net.ourams.vo.CourseDataroomVo;

@Component
public class S3Util {

	private static AmazonS3 s3;

	// s3에 대한 기본 세팅
	public S3Util() {

		s3 = AmazonS3ClientBuilder.standard().withRegion(Regions.AP_NORTHEAST_2).build();
	}

	// 버킷생성
	public Bucket createBucket(String bucketName) {

		if (s3.doesBucketExist(bucketName)) {
			System.out.println("버킷이 있습니다.");
			return getBucket(bucketName);
		}
		return s3.createBucket(bucketName);
	}

	// 버킷1개 가져오기
	public Bucket getBucket(String bucketName) {
		Bucket named_bucket = null;
		List<Bucket> buckets = s3.listBuckets();
		for (Bucket b : buckets) {
			if (b.getName().equals(bucketName)) {
				named_bucket = b;
			}
		}
		return named_bucket;

	}

	// 버킷리스트
	public List<Bucket> getBucketlist() {
		return s3.listBuckets();
	}

	// 폴더 생성 (폴더는 파일명 뒤에 "/"를 붙여야한다.)
	public void createFolder(String bucketName, String folderName) {
		s3.putObject(bucketName, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
	}

	// 파일 업로드
	public void fileUpload(String bucketName, MultipartFile file) {
		try {
			
			//확장자
			String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			System.out.println("exName: " + exName);
			
			//저장파일명
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			System.out.println("saveName: " + saveName);
			
			
			PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, saveName,
					file.getInputStream(), new ObjectMetadata());
			putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
			s3.putObject(putObjectRequest); // upload file

		} catch (SdkClientException | IOException e) {
			e.printStackTrace();
		}
	}

	// 파일 다운로
	public void fileDownload(HttpServletResponse response, String filePath, String bucketName, String keyName)
			throws IOException {
		System.out.println("=======================================+");
		System.out.println("filedown se util");
		keyName = "tmp.jpg";

		try {

			S3Object s3object = s3.getObject(bucketName, keyName); // #1 - 파일을 다운로드함
			S3ObjectInputStream inputStream = s3object.getObjectContent();
			System.out.println("=======================================+");

			System.out.println(s3object);
			System.out.println(inputStream);

			InputStream in = new FileInputStream("/Users/thisisspear/webdb3.sql");
			BufferedInputStream bin = new BufferedInputStream(in);
			// BufferedInputStream bin = new BufferedInputStream(inputStream);

			OutputStream out = response.getOutputStream();
			BufferedOutputStream bout = new BufferedOutputStream(out);
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition",
					"attachment; filename=" + URLEncoder.encode("/Users/thisisspear/abcdefg.jpg", "utf-8") + ";");
			response.setHeader("Content-Transfer-Encoding", "binary");

			int bData;
			while (true) {
				bData = bin.read();

				if (bData == -1) {
					System.out.println("복사완료");
					break;
				}

				bout.write(bData);
			}

			bout.flush();
			bin.close();
			bout.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 파일 삭제
	public void fileDelete(String bucketName, String fileName) {
		s3.deleteObject(bucketName, fileName);
	}

	// 파일 URL
	public String getFileURL(String bucketName, String fileName) {
		// https://s3.ap-northeast-2.amazonaws.com/mybucket/puppy.jpg
		String url = "https://s3.ap-northeast-2.amazonaws.com/" + bucketName + "/" + fileName;
		return url;
	}

	// 파일다운로드 관련
	public static synchronized void cvplFileDownload(HttpServletRequest request, HttpServletResponse response
		,CourseDataroomVo vo ) throws Exception {
		System.out.println("cvplFileDownload");

		// FileVo 값
		String bucketName = "net.ourams.upload";
		String key = vo.getFileName(); // 저장된 파일값
		String orgFileName = vo.getFileName(); // 오리지널 파일값

		S3Object fullObject = s3.getObject(new GetObjectRequest(bucketName, key));
		InputStream inputStream = fullObject.getObjectContent();

		String mimetype = "application/x-msdownload";
		response.setContentType(mimetype);
		setDisposition(orgFileName, request, response);

		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		try {

			in = new BufferedInputStream(inputStream);
			out = new BufferedOutputStream(response.getOutputStream());
			FileCopyUtils.copy(in, out);
			out.flush();
		} catch (IOException ex) {
			System.out.println("IO Exception" + ex);
		} finally {
			in.close();
			out.close();
		}

	}

	/**
	 * 브라우저 구분 얻기.
	 *
	 * @param request
	 * @return
	 */
	private static String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
			return "Trident";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		}
		return "Firefox";
	}

	/**
	 * Disposition 지정하기.
	 *
	 * @param filename
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	private static void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			throw new IOException("Not supported browser");
		}

		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}

}
