package ck.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.AdministratorBiz;
import ck.vo.ModelVO;
import ck.vo.NoticeBoardVO;
import ck.vo.PhotographerVO;

@Controller
public class AdministratorController {

	@Autowired
	AdministratorBiz administratorbiz;

	@RequestMapping(value = "/admin_model_list.ck")
	public ModelAndView confirmModelList() {
		ModelAndView mav = new ModelAndView("administrator/model_list");
		List<ModelVO> model = administratorbiz.confirmModelList();
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/admin_photographer_list.ck")
	public ModelAndView confirmMemberList() {
		ModelAndView mav = new ModelAndView("administrator/photographer_list");
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
	
	@RequestMapping(value = "/admin_index.ck")
	public ModelAndView adminIndex() {
		ModelAndView mav = new ModelAndView("administrator/admin_index");
		return mav;
	}
	
}
