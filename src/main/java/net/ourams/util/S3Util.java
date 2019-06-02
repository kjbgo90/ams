package net.ourams.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.SdkClientException;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Component
public class S3Util {

	private AmazonS3 s3;

	// s3에 대한 기본 세팅
	public S3Util() {
		
		s3 = AmazonS3ClientBuilder.standard()
                .withRegion(Regions.AP_NORTHEAST_2)
                .build();
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
	public List<Bucket> getBucketlist(){
		return s3.listBuckets();
	}
	
		
	// 폴더 생성 (폴더는 파일명 뒤에 "/"를 붙여야한다.)
    public void createFolder(String bucketName, String folderName) {
    	s3.putObject(bucketName, folderName + "/", 
    			     new ByteArrayInputStream(new byte[0]), 
    			     new ObjectMetadata());
    }
     
    
    // 파일 업로드
    public void fileUpload(String bucketName, MultipartFile file, String saveName) {

    	try {
    		
    		PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, saveName, file.getInputStream(), new ObjectMetadata());
    		putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead); // file permission
			s3.putObject(putObjectRequest); // upload file
			
    	} catch (SdkClientException | IOException e) {
			e.printStackTrace();
		}
    }
    
    
    // 파일 삭제
    public void fileDelete(String bucketName, String fileName) {
    	s3.deleteObject(bucketName, fileName);
    }
     
    // 파일 URL
    public String getFileURL(String bucketName, String path, String fileName) {
    	//https://s3.ap-northeast-2.amazonaws.com/com.javaex.kjbbb.upload/img_test/image-2.jpg
    	
    	String url = "https://s3.ap-northeast-2.amazonaws.com/" + bucketName + "/" + path + "/" + fileName;
    	
    	
        return url;
    }
	
	


}
