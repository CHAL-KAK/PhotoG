package ck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.LoginBiz;
import ck.vo.AdministratorVO;
import ck.vo.ModelVO;
import ck.vo.PhotographerVO;
import ck.vo.SessionType;

@SessionAttributes(value = "login_user")
@Controller
public class LoginController {

	@Autowired
	private LoginBiz loginbiz;

	@RequestMapping(method = RequestMethod.POST, value = "/modelSearch.ck")
	public ModelAndView search(@ModelAttribute ModelVO vo) {
		ModelVO res = loginbiz.searchModel(vo);
		if (res == null) {
			ModelAndView mav = new ModelAndView("login/model_login_fail");
			return mav;
		} else {
			String id = res.getM_id();
			SessionType st = new SessionType(id, "M");
			ModelAndView mav = new ModelAndView("redirect:/index.jsp", "login_user", st);
			return mav;
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/photographerSearch.ck")
	public ModelAndView search(@ModelAttribute PhotographerVO vo) {
		PhotographerVO res = loginbiz.searchPhotographer(vo);
		if (res == null) {
			ModelAndView mav = new ModelAndView("login/photographer_login_fail");
			return mav;
		} else {
			String id = res.getP_id();
			SessionType st = new SessionType(id, "P");
			ModelAndView mav = new ModelAndView("redirect:/index.jsp", "login_user", st);
			return mav;
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/administratorSearch.ck")
	public ModelAndView search(@ModelAttribute AdministratorVO vo) {
		AdministratorVO res = loginbiz.searchAdministrator(vo);
		if (res == null) {
			ModelAndView mav = new ModelAndView("login/administrator_login_fail");
			return mav;
		} else {
			String id = res.getId();
			SessionType st = new SessionType(id, "A");
			ModelAndView mav = new ModelAndView("administrator/admin_index", "login_user", st);
			return mav;
		}
	}
	
	@RequestMapping(value = "/logout.ck")
	public ModelAndView logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		ModelAndView mav = new ModelAndView("redirect:/index.jsp");
		return mav;
	}

}
