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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.NoticeBoardBiz;
import ck.biz.PhotoSaveBiz;
import ck.validate.UploadFile;
import ck.vo.NoticeBoardVO;
import ck.vo.PhotoSaveVO;
import ck.vo.SessionType;
import ck.validate.FileValidator;

@Controller("myController")
public class MypageController {
	@Autowired
	private NoticeBoardBiz biz;

	@Autowired
	private FileValidator fileValidator; // 유효성 검사

	@Autowired
	private PhotoSaveBiz photoSaveBiz;

	@RequestMapping("/photo_mypage.ck")
	public ModelAndView photmypage(@SessionAttribute("login_user") SessionType loginuser) {
		List<NoticeBoardVO> list = null;
		ModelAndView mav = null;
		try {
			list = biz.select(loginuser.getId());
			System.out.println(loginuser.getId());
			System.out.println("list" + list);
			mav = new ModelAndView("/mypage/photo_mypage", "list", list);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return mav;
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView fileUpload(@ModelAttribute("uploadFile") UploadFile uploadFile, BindingResult result)
			throws IOException, ClassNotFoundException, SQLException {
		// 1. 유효성 검사
		fileValidator.validate(uploadFile, result);
		if (result.hasErrors()) {
			return new ModelAndView("redirect:/CHAL-KAK/profile/profile_enroll.jsp");
		}

		// 2. 업로드 VO의 객체 중 MultipartFile로 getFile()을 리턴 받는다.
		MultipartFile file = uploadFile.getFile();

		// 3. 리턴 받은 MultipartFile의 객체의 원본 파일 이름을 리턴 받는다.
		String filename = file.getOriginalFilename();

		// 4. uploadFile.jsp 에서 사용할 객체를 생성한 후 VO에 입력한다.
		UploadFile fileobj = new UploadFile();
		fileobj.setFilename(filename);
		fileobj.setDesc(uploadFile.getDesc());

		// 5. 저장장소를 지정하고 File의 객체를 통해 읽어서 저장한다.
		InputStream inputStream = null;
		// InputStream inputStream2 = null;
		OutputStream outputStream = null;

		try {
			inputStream = file.getInputStream();
			String path = "C:\\Users\\JAEWNG\\git\\PhotoG\\CHAL-KAK\\WebContent\\img";
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

			// File f = new File("C:\\webproject\\temp\\WebContent\\img\\aaa.png");
			// FileInputStream fis = new FileInputStream(f);
			// inputStream2 = file.getInputStream();

			PhotoSaveVO ps = new PhotoSaveVO();
			ps.setLat(37.606212997293056);
			ps.setLon(126.96724803443617);
			ps.setPath("");
			ps.setP_id("");
						
			int res = photoSaveBiz.insertPhoto(ps);

			/*
			 * stmt.setString(1, filename); stmt.setBinaryStream(2, inputStream, (int)
			 * newFile.length());
			 */

			//int rownum = stmt.executeUpdate();

			if (res > 0) {
				System.out.println("삽입성공");
			} else {
				System.out.println("실패");
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			outputStream.close();
			inputStream.close();
			// 사용한 객체 close
			try {
				//if (con != null)
				//	con.close();
				//if (stmt != null)
				//	stmt.close();
			} catch (Exception e) {

			}
		}
		return new ModelAndView("upload/uploadFile", "fileobj1", fileobj);
	} // upload end
}
