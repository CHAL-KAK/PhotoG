package ck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ck.biz.JoinBiz;
import ck.vo.ModelVO;
import ck.vo.PhotographerVO;

@Controller
public class JoinController {

	@Autowired
	JoinBiz joinbiz;

	@RequestMapping(method = RequestMethod.POST, value = "/modeljoin.ck")
	public String insertModel(@ModelAttribute ModelVO vo) {
		int res = joinbiz.insertModel(vo);
		if (res == 0) { // 회원가입 실패
			return "/join/model_join_fail";
		} else { // 회원가입 성공
			return "/join/model_join_success";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/photographerjoin.ck")
	public String insertPhotographer(@ModelAttribute PhotographerVO vo) {
		int res = joinbiz.insertPhotographer(vo);
		if (res == 0) { // 회원가입 실패
			return "/join/photographer_join_fail";
		} else { // 회원가입 성공
			return "/join/photographer_join_success";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/id_check.ck", method = RequestMethod.GET)
	public String IDCheck(@RequestParam("id") String id) {
		int mret = joinbiz.model_idcheck(id);
		int pret = joinbiz.photo_idcheck(id);
		int ret = 0;
		if (mret == 0 && pret == 0) {
			ret = 1;
		}
		return Integer.toString(ret);
	}
	
}
