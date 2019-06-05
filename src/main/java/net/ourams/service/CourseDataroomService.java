package net.ourams.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseDataroomDao;

@Service
public class CourseDataroomService {

	@Autowired
	private CourseDataroomDao courseDataroomDao;
	
}
