package net.ourams.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.ourams.dao.CommunityDao;
import net.ourams.util.TimeUtile;
import net.ourams.vo.CommunityVo;
import net.ourams.vo.LocationVo;
import net.ourams.vo.UserVo;
import net.ourams.vo.fileUpLoadVo;

@Service
public class CommunityService {
	@Autowired
	private CommunityDao communityDao;
	
	
	
	public List<CommunityVo> getMainEatList() {
		List<CommunityVo> eatlist =communityDao.MainEatList();	
		
		List<fileUpLoadVo> fileList = communityDao.selectCommunityFileList();
		
		for(CommunityVo communityVo : eatlist) {
			List<fileUpLoadVo> communityFileList = new ArrayList<fileUpLoadVo>();
			for (fileUpLoadVo fileVo : fileList) {
				if (communityVo.getCpostNo() == fileVo.getCpostNo()) {
					communityFileList.add(fileVo);
				}
			}
			communityVo.setFileList(communityFileList);
			System.out.println(communityVo.getCpostTitle() + " 파일 리스트: " + communityVo.getFileList());
		}

		return eatlist;
	}
	
	public List<CommunityVo> getMaincafeList() {
		List<CommunityVo> cafelist=communityDao.MaincafeList();	
		
		List<fileUpLoadVo> fileList = communityDao.selectCommunityFileList();
		
		for(CommunityVo communityVo : cafelist) {
			List<fileUpLoadVo> communityFileList = new ArrayList<fileUpLoadVo>();
			for (fileUpLoadVo fileVo : fileList) {
				if (communityVo.getCpostNo() == fileVo.getCpostNo()) {
					communityFileList.add(fileVo);
				}
			}
			communityVo.setFileList(communityFileList);
			System.out.println(communityVo.getCpostTitle() + " 파일 리스트: " + communityVo.getFileList());
		}
		
		return cafelist;
	}

	
	public List<CommunityVo> getMainList() {
		List<CommunityVo> mainlist=communityDao.MainList();	
		
		List<fileUpLoadVo> fileList = communityDao.selectCommunityFileList();
		
		for(CommunityVo communityVo : mainlist) {
			List<fileUpLoadVo> communityFileList = new ArrayList<fileUpLoadVo>();
			for (fileUpLoadVo fileVo : fileList) {
				if (communityVo.getCpostNo() == fileVo.getCpostNo()) {
					communityFileList.add(fileVo);
				}
			}
			communityVo.setFileList(communityFileList);
			System.out.println(communityVo.getCpostTitle() + " 파일 리스트: " + communityVo.getFileList());
		}
		
		return mainlist;
	}
	
	public List<CommunityVo> getAllList(){
		return communityDao.allList();
	}
	
	public List<CommunityVo> getList(int cpostType) {
		List<CommunityVo> communityList=communityDao.communityList(cpostType);	
		
		return communityList;
	}
	
	
	public List<CommunityVo> getlikedList(int cpostType){
		List<CommunityVo> likedlist=communityDao.likedList(cpostType);	
		return likedlist;
	}


	public CommunityVo read(int cpostNo) {
		CommunityVo communityVo = communityDao.selectNotice(cpostNo);
		
		List<fileUpLoadVo> fileList = communityDao.selectCommunityFileList();
		List<fileUpLoadVo> communityFileList = new ArrayList<fileUpLoadVo>();
			for (fileUpLoadVo fileVo : fileList) {
				if (communityVo.getCpostNo() == fileVo.getCpostNo()) {
					communityFileList.add(fileVo);
				}
			}
			communityVo.setFileList(communityFileList);
			
		return communityVo;
	}
	
	public int updateliked(int cpostNo) {
		int count = communityDao.updateliked(cpostNo);
		return count;
	}

	public int updateunliked(int cpostNo) {
		int count= communityDao.updateunliked(cpostNo);
		return count;
	}
	
	@Transactional
	public int registerPost(UserVo authUser, CommunityVo vo) {
		vo.setUserNo(authUser.getUserNo());
		
		int locationNo;
		int cpostNo;
		int fileNo;
		List<fileUpLoadVo> fuList;
		
		LocationVo LV = communityDao.existLocation(vo.getAddress());
		
		if(LV == null){
			communityDao.registerLocation(vo);
			locationNo  = vo.getLocationNo();
			System.out.println("success to register location...");
			communityDao.registerPost(vo);
			cpostNo = vo.getCpostNo();
		}else {
			locationNo = LV.getLocationNo();
			System.out.println("already exist location...");
			int result = communityDao.registerPost(vo);
			cpostNo = vo.getCpostNo();
		}
		System.out.println("success to register post...");
		
		fuList = vo.getFileList();
		
		for(int i=0; i<fuList.size(); i++) {
			communityDao.registerFile(fuList.get(i));
			fileNo = fuList.get(i).getFileNo();
			System.out.println("success to register File...");
			
			Map<String, Object> cFileMap = new HashMap<String, Object>();
			cFileMap.put("cpostNo", cpostNo);
			cFileMap.put("fileNo", fileNo);
			
			System.out.println(cFileMap);
			communityDao.registerCommunityFile(cFileMap);
			System.out.println("success to register community file...");
		}
		

		Map<String, Object> lPostMap = new HashMap<String, Object>();
		lPostMap.put("locationNo", locationNo);
		lPostMap.put("cpostNo", cpostNo);
		
		return communityDao.registerLocationPost(lPostMap);
		
	}
	
	public List<CommunityVo> hotPlaces(int cpostType){
		List<CommunityVo> communityList = communityDao.hotPlaces(cpostType);
		List<CommunityVo> returnList = new ArrayList<CommunityVo>();
		int flag = 0;
		System.out.println("load hot places ... ");
		
		for(int i=0; i<communityList.size(); i++) {
			flag=0;
			communityList.get(i).setLocationNo(communityDao.loadLocationNo(communityList.get(i))); 
			communityList.get(i).setBusinessName(communityDao.loadBuisnessName(communityList.get(i)));
			communityList.get(i).setAddress(communityDao.loadAddress(communityList.get(i)));
			communityList.get(i).setLatitude(communityDao.loadLatitude(communityList.get(i)));
			communityList.get(i).setLongitude(communityDao.loadLongitude(communityList.get(i)));
			
			for(CommunityVo vo : returnList) {
				if(vo.getAddress().equals(communityList.get(i).getAddress())) {
					flag = 1;
					break;
				}
			}
			
			if(flag==0)
				returnList.add(communityList.get(i));
			
		}
		
		return returnList;
	}
	
	public List<CommunityVo> myPost(int cpostType, int userNo, String userName){
		CommunityVo vo = new CommunityVo();
		vo.setCpostType(cpostType);
		vo.setUserNo(userNo);
		
		List<CommunityVo> returnList = communityDao.myPost(vo);
		for(CommunityVo temp : returnList) {
			temp.setUserName(userName);
		}
		
		return returnList;
	}
	
	public CommunityVo loadLocationInfo(int cpostNo) {
		CommunityVo vo = new CommunityVo();
		vo.setCpostNo(cpostNo);
		
		vo.setLocationNo(communityDao.loadLocationNo(vo));
		vo.setBusinessName(communityDao.loadBuisnessName(vo));
		vo.setAddress(communityDao.loadAddress(vo));
		vo.setLatitude(communityDao.loadLatitude(vo));
		vo.setLongitude(communityDao.loadLongitude(vo));
		
		return vo;
	}
	
	@Transactional
	public int delete(CommunityVo communityvo) {
		System.out.println(communityvo.toString());
		int countReply = communityDao.countReply(communityvo);
		System.out.println("exist reply number: " + countReply);
		
		if(countReply != 0) {
		communityDao.deletereply(communityvo);
		System.out.println("success to delete all reply...  ");
		}
		
		communityDao.deleteLocationPost(communityvo);
		System.out.println("success to delete locationPost...  ");
		communityDao.deleteCommunityFile(communityvo);
		System.out.println("success to delete communityFile... ");
		int result = communityDao.delete(communityvo);
		System.out.println("success to delete post...  ");
		
		return result;
	}
	
	public Map<String, Object> selectPostPaging(int cpostType, int pageNo) throws ParseException{
		int listSize = 5 ;
		int pageNo1 = 1+listSize*(pageNo-1);
		int pageNo2 = listSize*pageNo;
		int countPage = communityDao.totalPostNumber(cpostType);
		System.out.println("countPage"+countPage);
		int maxPage = (int)Math.ceil((double)countPage/listSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cpostType", cpostType);
		map.put("pageNo1", pageNo1);
		map.put("pageNo2", pageNo2);
		
		List<CommunityVo> list = communityDao.selectPagingList(map);
		List<fileUpLoadVo> fileList = communityDao.selectCommunityFileList();
		
		// 사진(fileList) 추가 
		for(CommunityVo communityVo : list) {
			List<fileUpLoadVo> communityFileList = new ArrayList<fileUpLoadVo>();
			for (fileUpLoadVo fileVo : fileList) {
				if (communityVo.getCpostNo() == fileVo.getCpostNo()) {
					communityFileList.add(fileVo);
				}
			}
			communityVo.setFileList(communityFileList);
			System.out.println(communityVo.getCpostTitle() + " 파일 리스트: " + communityVo.getFileList());
		}
		
		// duedate 계산
		for (CommunityVo el : list) {
			System.out.println(el.getRegDate());
			String from = el.getRegDate();

			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Date to = transFormat.parse(from);
			System.out.println(to);
			System.out.println(to.getTime());
			el.setRegDate(TimeUtile.toDuration(new Date().getTime() - to.getTime()));
		};
		
		// 중복되는 게시글 삭제
		List<CommunityVo> returnList = new ArrayList<CommunityVo>();
		
		int flag = 0;
		int cpostNo;
		
		for(int i=0; i<list.size(); i++) {
			flag=0;
			
			cpostNo = list.get(i).getCpostNo();
			
			for(CommunityVo vo : returnList) {
				if(vo.getCpostNo() == cpostNo) {
					flag = 1;
					break;
				}
			}
			
			if(flag==0)
				returnList.add(list.get(i));
			System.out.println("return list: " + returnList +"\r");
			
		}
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", returnList);
		map2.put("maxPage", maxPage);
		return map2;
	}


}
