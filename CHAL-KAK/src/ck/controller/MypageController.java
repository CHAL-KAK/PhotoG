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

//	@Autowired
//	private NoticeBoardBiz noticeBoardBiz;

	@Autowired
	private MypageListBiz mypagelistBiz;

	@Autowired
	private ProfileBiz profileBiz;

	@Autowired
	private FileValidator fileValidator;

	@RequestMapping("/photo_mypage.ck")
	public ModelAndView photomypage(@SessionAttribute("login_user") SessionType vo) {
		List<NoticeBoardVO> list = null;
		ModelAndView mav = null;
		try {
			list = mypagelistBiz.photo_mypage(vo.getId());
			System.out.println("photo_mypage" + list);
			mav = new ModelAndView("/mypage/photo_mypage", "list", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping("/model_mypage.ck")
	public ModelAndView modelmypage(@SessionAttribute("login_user") SessionType vo) {
		List<ReservationVO> list = null;
		ModelAndView mav = null;
		try {
			list = mypagelistBiz.model_mypage(vo.getId());
			System.out.println("model_mypage" + list);
			mav = new ModelAndView("/mypage/model_mypage", "list", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}

	// brd_seq to reservation list

	@RequestMapping(value = "/board_reservlist.ck", method = RequestMethod.POST)
	@ResponseBody
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

	@RequestMapping(value = "/reserv_matching.ck", method = RequestMethod.POST)
	public int ReservMapping(@RequestParam("reseq") String rseq) {
		System.out.println("rseq" + rseq);
		int res = mypagelistBiz.reserv_update(Integer.parseInt(rseq));
		int ret = 0;
		if (res > 0) {
			System.out.println("성공" + res);
			return ret = 1;
		} else {
			System.out.println("실패");
			return ret = 0;
		}
//		return ret;

	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String getPictureList(@ModelAttribute PictureVO pictureVO) {
		return "profile/profile_enroll";
	}

	@RequestMapping(value = "/pictureUpload", method = RequestMethod.POST)
	public ModelAndView fileUpload(@ModelAttribute("pictureVO") PictureVO pictureVO, BindingResult result)
			throws IOException, ClassNotFoundException, SQLException {

		fileValidator.validate(pictureVO, result);
		if (result.hasErrors()) {
			return new ModelAndView("/profile/profile_enroll");
		}

		MultipartFile file = pictureVO.getFile();
		String filename = file.getOriginalFilename();

		PictureVO fileobj = new PictureVO();
//		fileobj.setFile_name(filename);

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			inputStream = file.getInputStream();
//			String path = "C:\\Users\\JAEWNG\\git\\PhotoG\\CHAL-KAK\\WebContent\\img";
			String path = "C:\\Users\\Playdata\\git\\PhotoG\\CHAL-KAK\\WebContent\\img";
			File newFile = new File(path + "/" + filename);
			if (!newFile.exists()) {
				newFile.createNewFile();
			}
			outputStream = new FileOutputStream(newFile);
			int read = 0;
			byte[] b = new byte[(int) file.getSize()];
			while ((read = inputStream.read(b)) != -1) {
				outputStream.write(b, 0, read);
			}

			// 디비에 저장하는 것
			// biz 적는 것부터 시작해 그리고 우선 vo에 저장부터해

			// File f = new File("C:\\webproject\\temp\\WebContent\\img\\aaa.png");
			// FileInputStream fis = new FileInputStream(f);
			// inputStream2 = file.getInputStream();

//			PhotoSaveVO ps = new PhotoSaveVO();
//			ps.setLat(37.606212997293056);
//			ps.setLon(126.96724803443617);
//			ps.setP_id("");

//			int res = photoSaveBiz.insertPhoto(ps);

			/*
			 * stmt.setString(1, filename); stmt.setBinaryStream(2, inputStream, (int)
			 * newFile.length());
			 */

			// int rownum = stmt.executeUpdate();

			/*
			 * if (res > 0) { System.out.println("�궫�엯 �꽦怨�"); } else {
			 * System.out.println("�떎�뙣"); }
			 */

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			outputStream.close();
			inputStream.close();
			// 占쏙옙占쏙옙占� 占쏙옙체 close
			try {
				// if (con != null)
				// con.close();
				// if (stmt != null)
				// stmt.close();
			} catch (Exception e) {

			}
		}
		// 여기경로 고쳐야해요!
		return new ModelAndView("redirect:/CHAL-KAK/photo_mypage.ck");
	} // upload end
}
