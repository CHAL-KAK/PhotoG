package ck.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.NoticeBoardBiz;
import ck.vo.NoticeBoardVO;
import ck.vo.ReservationVO;

@Controller
public class NoticeBoardController {
	
	@Autowired
	NoticeBoardBiz noticeboardbiz;

	// Board Access Fail
	@RequestMapping(value = "/board_access_fail.ck")
	public String Board_Access_Fail() {
		return "noticeboard/board_access_fail";
	}

	// Board All
	@RequestMapping(value = "/noticeboard.ck")
	public ModelAndView Board_All() {
		ModelAndView mav = new ModelAndView("noticeboard/board_all");
		List<NoticeBoardVO> all = noticeboardbiz.boardAll();
		mav.addObject("all", all);
		return mav;
	}

	@RequestMapping(value = "/board_one.ck")
	public ModelAndView Board_one(@RequestParam("seq") int seq) {
		ModelAndView mav = new ModelAndView("noticeboard/board_one");
		List<NoticeBoardVO> vo = noticeboardbiz.boardOne(seq);
		mav.addObject("one", vo);
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/noticeForm.ck")
	public String InsertNoticeForm(NoticeBoardVO vo) {
		noticeboardbiz.insertNoticeForm(vo);
		return "redirect:/noticeboard.ck";

	}

	@RequestMapping(method = RequestMethod.POST, value = "/reservationForm.ck")
	public String insertReservationForm(ReservationVO vo) {
		noticeboardbiz.insertReservationForm(vo);
		return "redirect:/noticeboard.ck";
	}

}
