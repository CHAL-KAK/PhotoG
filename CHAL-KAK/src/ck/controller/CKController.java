package ck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ck.biz.ModelJoinBiz;
import ck.biz.NoticeBoardBiz;
import ck.biz.NoticeFormBiz;
import ck.biz.PhotographerJoinBiz;
import ck.vo.ModelVO;
import ck.vo.NoticeBoardVO;
import ck.vo.PhotographerVO;

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
		
		@RequestMapping(method = RequestMethod.POST, value="/modeljoin.ck")
		public String insertModel(@ModelAttribute ModelVO vo) {
			modeljoinbiz.insertModel(vo);
			return "redirect:/index.jsp";
		}
		
		@RequestMapping(method = RequestMethod.POST, value="/photographerjoin.ck")
		public String insertPhotographer(@ModelAttribute PhotographerVO vo) {
			photographerjoinbiz.insertPhotographer(vo);
			return "redirect:/index.jsp";
		}
		
		@RequestMapping(value="/noticeboard.ck")
		public String Board_All(Model model) {
			model.addAttribute("all", noticeboardbiz.boardAll());
			return "noticeboard/Board_all";
		}
		
	
		
		
		
		@RequestMapping(method = RequestMethod.POST, value= "/noticeForm.ck")
		public String InsertNoticeForm(NoticeBoardVO vo) {
			System.out.println("InsertNoticeForm");
			noticeformbiz.insertNoticeForm(vo);
			System.out.println(vo);
			return "redirect:/noticeboard.ck";
			
		}
		
	
}
