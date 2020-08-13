package ck.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

//	@ResponseBody
	@RequestMapping(method = RequestMethod.POST, value = "/searchNotice.ck")
	public ModelAndView searchNotice(@RequestParam("date") String date, @RequestParam("cnt") int max,
			@RequestParam("con") int concept) throws ParseException {
		SimpleDateFormat fm = new SimpleDateFormat("yy-MM-dd");
		Date day = fm.parse(date);

		NoticeBoardVO vo = new NoticeBoardVO();
		vo.setDay(day);
		vo.setMax(max);
		vo.setConcept(concept);
		List<NoticeBoardVO> list = noticeboardbiz.searchBoard(vo);
		System.out.println(list);
		ModelAndView mav = new ModelAndView("/noticeboard/searchResult", "result", list);
		return mav;
	}
}
