package ck.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.MypageListBiz;
import ck.biz.NoticeBoardBiz;
import ck.biz.ProfileBiz;
import ck.validate.FileValidator;
import ck.vo.NoticeBoardVO;
import ck.vo.PictureVO;
import ck.vo.ReservationVO;
import ck.vo.SessionType;

@Controller("myPageController")
public class MypageController {

	@Autowired
	private MypageListBiz mypagelistBiz;

	@RequestMapping("/photo_mypage.ck")
	public ModelAndView photomypage(@RequestParam("id") String id) {
		List<NoticeBoardVO> list = null;
		ModelAndView mav = null;
		try {
			list = mypagelistBiz.photo_mypage(id);
			System.out.println("photo_mypage" + list);
			mav = new ModelAndView("/mypage/photo_mypage", "list", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping("/model_mypage.ck")
	public ModelAndView modelmypage(@RequestParam("id") String id) {
		List<ReservationVO> list = null;
		ModelAndView mav = null;
		try {
			list = mypagelistBiz.model_mypage(id);
			System.out.println("model_mypage" + list);
			mav = new ModelAndView("/mypage/model_mypage", "list", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}

	// brd_seq to reservation list

	@RequestMapping(value = "/board_reservlist.ck", method = RequestMethod.POST)
	public ModelAndView ReservList(@RequestParam("bseq") int bseq) {
		List<ReservationVO> list = null;
		ModelAndView mav = null;
		try {
			list = mypagelistBiz.reserv_list(bseq);
			System.out.println("reserv_list" + list);
			mav = new ModelAndView("/mypage/board_reslist", "list", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/reserv_matching.ck", method = RequestMethod.POST)
	public String ReservMapping(@RequestParam("reseq") String rseq) {
		System.out.println("rseq" + rseq);
		int res = mypagelistBiz.reserv_update(Integer.parseInt(rseq));
		int ret = 0;
		if (res > 0) {
			System.out.println("성공" + res);
			ret = 1;
		} else {
			System.out.println("실패");
			ret = 0;
		}
		return Integer.toString(ret);
	}
}
