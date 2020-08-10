package ck.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.ModelJoinBiz;
import ck.biz.NoticeBoardBiz;
import ck.biz.NoticeFormBiz;
import ck.biz.PhotographerJoinBiz;
import ck.biz.ReservationBiz;
import ck.vo.ModelVO;
import ck.vo.NoticeBoardVO;
import ck.vo.PhotographerVO;
import ck.vo.ReservationVO;

@Controller
public class CKController{

		@Autowired
		ModelJoinBiz modeljoinbiz;
		
		@Autowired
		PhotographerJoinBiz photographerjoinbiz;
		
		@Autowired
		NoticeBoardBiz noticeboardbiz;
		

		@Autowired
		NoticeFormBiz noticeformbiz;
		
		@Autowired
		ReservationBiz reservationbiz;
		

		// Join Model
		@RequestMapping(method = RequestMethod.POST, value="/modeljoin.ck")
		public String insertModel(@ModelAttribute ModelVO vo) {
			int res = modeljoinbiz.insertModel(vo);
			System.out.println(res);
			if (res == 0) { // ½ÇÆÐ
				return "/join/model_join_fail";
			} else {		// ¼º°ø		
				return "/join/model_join_success";
			}
		}
		
		// Join Photographer
		@RequestMapping(method = RequestMethod.POST, value="/photographerjoin.ck")
		public String insertPhotographer(@ModelAttribute PhotographerVO vo) {
			int res = photographerjoinbiz.insertPhotographer(vo);
			System.out.println(res);
			if (res == 0) { // ½ÇÆÐ
				return "/join/photographer_join_fail";
			} else {		// ¼º°ø		
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
		public ModelAndView Board_All() {
			ModelAndView mav = new ModelAndView("noticeboard/board_all");
			List<NoticeBoardVO> all = noticeboardbiz.boardAll();
			mav.addObject("all", all);
			return mav;
		}
		
		
		@RequestMapping(method = RequestMethod.POST, value= "/noticeForm.ck")
		public String InsertNoticeForm(NoticeBoardVO vo) {
			noticeformbiz.insertNoticeForm(vo);
			return "redirect:/noticeboard.ck";
			
		}
		
		@RequestMapping(method = RequestMethod.POST, value="/reservationForm.ck")
		public String insertReservationForm(ReservationVO vo) {
			reservationbiz.insertReservationForm(vo);
			return "redirect:/noticeboard.ck";
		}

}