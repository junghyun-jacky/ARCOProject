package com.member.dao;

import java.util.List;

import com.member.vo.CalendarVO;

public interface CalendarDAO {
	
	public List<CalendarVO> calendarList(String userId);
}
