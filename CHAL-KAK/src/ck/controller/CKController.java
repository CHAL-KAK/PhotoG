package ck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ck.biz.ModelJoinBiz;
import ck.biz.NoticeBoardBiz;
import ck.vo.ModelVO;

@Controller("cKController")
public class CKController{

		@Autowired
		ModelJoinBiz modeljoinbiz;
		
		@Autowired
		NoticeBoardBiz noticeboardbiz;
		
		@RequestMapping(method = RequestMethod.POST, value="/modeljoin.ck")
		public String insertModel(@ModelAttribute ModelVO vo) {
			modeljoinbiz.insertModel(vo);
			return "redirect:/index.jsp";
		}
		
//		@RequestMapping(method = RequestMethod.GET, value="/modeljoin.ck")
//		public String insertModel(@RequestParam("m_id") String m_id, 
//				@RequestParam("m_password") String m_password, 
//				@RequestParam("m_name") String m_name, 
//				@RequestParam("m_gender") String m_gender, 
//				@RequestParam(value = "m_bday", required = false) Date m_bday, 
//				@RequestParam("m_ka_id") String m_ka_id) {
//			
//			System.out.println(m_id);
//			ModelVO vo = new ModelVO();
//			vo.setM_id(m_id);
//			vo.setM_password(m_password);
//			vo.setM_name(m_name);
//			vo.setM_gender(m_gender);
//			vo.setM_bday(m_bday);
//			vo.setM_ka_id(m_ka_id);
//			System.out.println(vo.getM_id());
//			modeljoinbiz.insertModel(vo);
////			return "/CHAL-KAK/index.jsp";
//			return "/index.jsp";
//		}
		
		@RequestMapping(value="/noticeboard.ck")
		public String Board_All(Model model) {
			model.addAttribute("all", noticeboardbiz.boardAll());
			return "/WEB-INF/view/noticeboard/Board_all.jsp";
		}
		
	
}
