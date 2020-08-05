package ck.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.NoticeBoardBiz;
import ck.vo.NoticeBoardVO;

@Controller("myController")
public class MypageController {
	@Autowired
	private NoticeBoardBiz biz;

	@RequestMapping("/photo_mypage.ck")
	public ModelAndView photmypage(@SessionAttribute("login_user") String id) {
		List<NoticeBoardVO> list = null;
		ModelAndView mav = null;
		try {
			list = biz.select(id);
			System.out.println(id);
			System.out.println("list" + list);
			mav = new ModelAndView("/mypage/photo_mypage", "list", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}

}
