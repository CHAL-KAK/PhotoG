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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.MypageBiz;
import ck.validate.FileValidator;
import ck.vo.NoticeBoardVO;
import ck.vo.PhotographerVO;
import ck.vo.PictureVO;
import ck.vo.ReservationVO;

@Controller
public class MypageController {

	@Autowired
	private MypageBiz mypagebiz;

	@Autowired
	private FileValidator fileValidator;

	@RequestMapping("/photo_mypage.ck")
	public ModelAndView Photo_Mypage(@RequestParam("id") String id) {
		List<NoticeBoardVO> list = null;
		ModelAndView mav = null;
		try {
			list = mypagebiz.Photo_Mypage(id);
			int reg = mypagebiz.findProfile(id);
			mav = new ModelAndView("/mypage/photo_mypage", "list", list);
			mav.addObject("reg", reg);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping("/model_mypage.ck")
	public ModelAndView Model_Mypage(@RequestParam("id") String id) {
		List<ReservationVO> list = null;
		ModelAndView mav = null;
		try {
			list = mypagebiz.Model_Mypage(id);

			mav = new ModelAndView("/mypage/model_mypage", "list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	// brd_seq to reservation list
	@RequestMapping(value = "/board_reservlist.ck", method = RequestMethod.POST)
	public ModelAndView Reserv_List(@RequestParam("bseq") int bseq, @RequestParam("prog") int pro) {
		List<ReservationVO> list = null;
		ModelAndView mav = null;
		try {
			list = mypagebiz.Reserv_List(bseq);
			if (pro == 1) {
				// reservation complete
				mav = new ModelAndView("/mypage/board_reslist_comp", "list", list);
			} else {
				mav = new ModelAndView("/mypage/board_reslist_ing", "list", list);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	// update reservation, notice_board progress
	@ResponseBody
	@RequestMapping(value = "/reserv_matching.ck", method = RequestMethod.POST)
	public String updateReser(@RequestParam("reseq") String rseq) {
		int res = mypagebiz.updateReser(Integer.parseInt(rseq));
		int ret = 0;
		if (res > 0) {
			ret = 1;
		} else {
			ret = 0;
		}
		return Integer.toString(ret);
	}

	@RequestMapping(value = "/modifyform.ck")
	public ModelAndView selectPhotographer(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView("mypage/modify_form");
		List<PhotographerVO> one = mypagebiz.selectPhotographer(id);
		mav.addObject("one", one);
		return mav;
	}

	@RequestMapping(value = "/modifyupdate.ck")
	public ModelAndView updatePhotographer(@ModelAttribute PhotographerVO vo) {
		int res = mypagebiz.updatePhotographer(vo);
		String path = "redirect:/photo_mypage.ck?id=" + vo.getP_id();
		ModelAndView mav = new ModelAndView(path);
		return mav;
	}

	@RequestMapping(value = "/upload.ck", method = RequestMethod.POST)
	public String getPictureList(@ModelAttribute PictureVO pictureVO) {
		return "mypage/profile_enroll";
	}

	@RequestMapping(value = "/pictureUpload.ck", method = RequestMethod.POST)
	public ModelAndView fileUpload(@ModelAttribute("pictureVO") PictureVO pictureVO, BindingResult result)
			throws IOException, ClassNotFoundException, SQLException {

		fileValidator.validate(pictureVO, result);
		if (result.hasErrors()) {
			return new ModelAndView("/mypage/profile_enroll");
		}

		MultipartFile file = pictureVO.getFile();
		String filename = file.getOriginalFilename();

		PictureVO fileobj = new PictureVO();
		fileobj.setFile_name(filename);
		fileobj.setP_id(pictureVO.getP_id());

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			inputStream = file.getInputStream();
			String path = "C:\\Users\\Playdata\\git\\PhotoG\\CHAL-KAK\\WebContent\\uploadImage" + "/" + filename;
			fileobj.setFile_path(path);
			File newFile = new File(path);
			if (!newFile.exists()) {
				newFile.createNewFile();
			}
			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] b = new byte[(int) file.getSize()];
			while ((read = inputStream.read(b)) != -1) {
				outputStream.write(b, 0, read);
			}

			int res = mypagebiz.insertSaveProfile(fileobj);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			outputStream.close();
			inputStream.close();
		}
		String p_id = pictureVO.getP_id();
		String addr = "redirect:/photo_mypage.ck?id=" + p_id;
		return new ModelAndView(addr);
	}

	@RequestMapping(value = "/confirmProfile.ck")
	public ModelAndView confirmProfile(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView("mypage/profile");
		String file_name = mypagebiz.confirmProfile(id);
		mav.addObject("file_name", file_name);
		return mav;
	}

}
