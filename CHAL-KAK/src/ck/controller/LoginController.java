package ck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.LoginBiz;
import ck.vo.ModelVO;

@SessionAttributes(value="login_user")
@Controller
public class LoginController {
	@Autowired
	private LoginBiz loginBiz;
	
	@RequestMapping(method = RequestMethod.POST, value = "/modelSearch.ck")
	public ModelAndView search(@ModelAttribute ModelVO vo) {
		System.out.println(vo);
		ModelVO res = loginBiz.searchModel(vo);
		String id = res.getM_id();
		System.out.println(res);
		ModelAndView mav = new ModelAndView("redirect:/index.jsp", "login_user", id);
		return mav;
	}

}
