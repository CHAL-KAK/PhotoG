package ck.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.NoticeBoardBiz;
import ck.vo.NoticeBoardVO;
import ck.vo.SessionType;

@Controller("myController")
@SessionAttributes("login_user")
public class MypageController {
	
	@Autowired
	private NoticeBoardBiz biz;

	@RequestMapping("/photo_mypage.ck")
	public ModelAndView photomypage(@SessionAttribute("login_user") SessionType vo) {
		List<NoticeBoardVO> list = null;
		ModelAndView mav = null;
		try {
			list = biz.photo_mypage(vo.getId());
			System.out.println("list" + list);
			mav = new ModelAndView("/mypage/photo_mypage", "list", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}
	
	@RequestMapping("/model_mypage.ck")
	public ModelAndView modelmypage(@SessionAttribute("login_user") SessionType vo) {
		List<NoticeBoardVO> list = null;
		ModelAndView mav = null;
		try {
			list = biz.model_mypage(vo.getId());
			mav = new ModelAndView("/mypage/model_mypage", "list", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}
}
