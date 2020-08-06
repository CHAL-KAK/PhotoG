package ck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ck.biz.ModelJoinBiz;
import ck.biz.NoticeBoardBiz;
import ck.biz.PhotographerJoinBiz;
import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

@Controller("cKController")
public class CKController{

		@Autowired
		ModelJoinBiz modeljoinbiz;
		
		@Autowired
		PhotographerJoinBiz photographerjoinbiz;
		
		@Autowired
		NoticeBoardBiz noticeboardbiz;
		
		// Join Model
		@RequestMapping(method = RequestMethod.POST, value="/modeljoin.ck")
		public String insertModel(@ModelAttribute ModelVO vo) {
			int res = modeljoinbiz.insertModel(vo);
			System.out.println(res);
			if (res == 0) { // 실패
				return "/join/model_join_fail";
			} else {		// 성공		
				return "/join/model_join_success";
			}
		}
		
		// Join Photographer
		@RequestMapping(method = RequestMethod.POST, value="/photographerjoin.ck")
		public String insertPhotographer(@ModelAttribute PhotographerVO vo) {
			int res = photographerjoinbiz.insertPhotographer(vo);
			System.out.println(res);
			if (res == 0) { // 실패
				return "/join/photographer_join_fail";
			} else {		// 성공		
				return "/join/photographer_join_success";
			}
		}
		
		// Board Access Fail
		@RequestMapping(value="/board_access_fail.ck")
		public String Board_Access_Fail() {
			return "noticeboard/board_access_fail";
		}
		
		// Board All
		@RequestMapping(value="/noticeboard.ck")
		public String Board_All(Model model) {
			model.addAttribute("all", noticeboardbiz.boardAll());
			return "noticeboard/board_all";
		}
}