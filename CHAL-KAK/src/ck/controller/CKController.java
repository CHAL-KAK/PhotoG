package ck.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.AdministratorBiz;
import ck.biz.CheckIDBiz;
import ck.biz.ModelJoinBiz;
import ck.biz.NoticeBoardBiz;
import ck.biz.NoticeFormBiz;
import ck.biz.PhotographerJoinBiz;
import ck.biz.PhotographerModifyBiz;
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
		
		@Autowired
		AdministratorBiz administratorbiz;
		
		@Autowired
		PhotographerModifyBiz photographermodifybiz;
		

		private CheckIDBiz checkIdBiz;


		// Join Model
		@RequestMapping(method = RequestMethod.POST, value="/modeljoin.ck")
		public String insertModel(@ModelAttribute ModelVO vo) {
			int res = modeljoinbiz.insertModel(vo);
			System.out.println(res);
			if (res == 0) { // 회원가입 실패
				return "/join/model_join_fail";
			} else {		// 회원가입 성공
				return "/join/model_join_success";
			}
		}
		
		// Join Photographer
		@RequestMapping(method = RequestMethod.POST, value="/photographerjoin.ck")
		public String insertPhotographer(@ModelAttribute PhotographerVO vo) {
			int res = photographerjoinbiz.insertPhotographer(vo);
			System.out.println(res);
			if (res == 0) { // 회원가입 실패
				return "/join/photographer_join_fail";
			} else {		// 회원가입 성공
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
		
		@RequestMapping(value="/board_one.ck")
		public ModelAndView Board_one(@RequestParam("seq") int seq) {
			ModelAndView mav = new ModelAndView("noticeboard/board_one");
			List<NoticeBoardVO> vo = noticeboardbiz.boardOne(seq);
			mav.addObject("one", vo);
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
		
		// Administrator
		@RequestMapping(value = "/admin_member_list.ck")
		public ModelAndView confirmMemberList() {
			ModelAndView mav = new ModelAndView("administrator/memberlist_all");
			List<ModelVO> model = administratorbiz.confirmModelList();
			mav.addObject("model", model);
			List<PhotographerVO> photographer = administratorbiz.confirmPhotographerList();
			mav.addObject("photographer", photographer);
			return mav;
		}
		
		@RequestMapping(value = "/deleteModel.ck")
		public String deleteModel(@RequestParam("seq") int seq) {
			administratorbiz.deleteModel(seq);
			return "redirect:/admin_member_list.ck";
		}
		
		@RequestMapping(value = "/deletePhotographer.ck")
		public String deletePhotographer(@RequestParam("seq") int seq) {
			administratorbiz.deletePhotographer(seq);
			return "redirect:/admin_member_list.ck";
		}
		
		@RequestMapping(value = "/admin_board_list.ck")
		public ModelAndView confirmBoardList() {
			ModelAndView mav = new ModelAndView("administrator/boardlist_all");
			List<NoticeBoardVO> all = administratorbiz.confirmBoardList();
			mav.addObject("all", all);
			return mav;
		}
		

		@RequestMapping(value = "/modifyform.ck")
		public ModelAndView selectPhotographer(@RequestParam("id") String id) {
			ModelAndView mav = new ModelAndView("modifyform/modify_form");
			List<PhotographerVO> one = photographermodifybiz.selectPhotographer(id);
			mav.addObject("one", one);
			return mav;
		}
		
		@RequestMapping(value="/modifyupdate.ck")
		public ModelAndView updatePhotographer(@ModelAttribute PhotographerVO vo) {
			int res = photographermodifybiz.updatePhotographer(vo);
				String path = "redirect:/photo_mypage.ck?id=" + vo.getP_id();
		//		String path = "redirect:/photo_mypage.ck";
				ModelAndView mav = new ModelAndView(path);
				return mav;


		@ResponseBody
		@RequestMapping(value = "/id_check.ck", method = RequestMethod.GET)
		public String IDCheck(@RequestParam("id") String id) {
			System.out.println("id 가져와"+id);
			int mret = checkIdBiz.model_idcheck(id);
			int pret = checkIdBiz.photo_idcheck(id);
			int ret = 0;
			System.out.println("여기도와");
			if (mret == 0 && pret == 0) {
				ret = 1;
				System.out.println("ret 인데");
			}
			return Integer.toString(ret);

		}

}