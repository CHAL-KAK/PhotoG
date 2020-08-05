package ck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.AdministratorLoginBiz;
import ck.biz.ModelLoginBiz;
import ck.biz.PhotographerLoginBiz;
import ck.vo.AdministratorVO;
import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

@SessionAttributes(value="login_user")
@Controller
public class LoginController {
	@Autowired
	private ModelLoginBiz modelloginBiz;
	
	@Autowired
	private PhotographerLoginBiz photographerloginBiz;
	
	@Autowired
	private AdministratorLoginBiz administratorloginBiz;
	
	@RequestMapping(method = RequestMethod.POST, value = "/modelSearch.ck")
	public ModelAndView search(@ModelAttribute ModelVO vo) {
		System.out.println(vo);
		ModelVO res = modelloginBiz.searchModel(vo);
		String id = res.getM_id();
		System.out.println(res);
		ModelAndView mav = new ModelAndView("redirect:/index.jsp", "login_user", id);
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/photographerSearch.ck")
	public ModelAndView search(@ModelAttribute PhotographerVO vo) {
		System.out.println(vo);
		PhotographerVO res = photographerloginBiz.searchPhotographer(vo);
		String id = res.getP_id();
		System.out.println(res);
		ModelAndView mav = new ModelAndView("redirect:/index.jsp", "login_user", id);
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/administratorSearch.ck")
	public ModelAndView search(@ModelAttribute AdministratorVO vo) {
		System.out.println(vo);
		AdministratorVO res = administratorloginBiz.searchAdministrator(vo);
		String id = res.getId();
		System.out.println(res);
		ModelAndView mav = new ModelAndView("redirect:/index.jsp", "login_user", id);
		return mav;
	}
	

}
