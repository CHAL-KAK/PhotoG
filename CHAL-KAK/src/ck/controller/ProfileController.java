package ck.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ck.biz.ProfileBiz;
import ck.validate.FileValidator;
import ck.vo.PictureVO;

@Service
public class ProfileController {
	
	@Autowired
	private ProfileBiz profileBiz;

	@Autowired
	private FileValidator fileValidator;
	
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
		fileobj.setFile_name(filename);

		InputStream inputStream = null;
		OutputStream outputStream = null;

		try {
			inputStream = file.getInputStream();
//			String path = "C:\\Users\\JAEWNG\\git\\PhotoG\\CHAL-KAK\\WebContent\\img";
//			String path = "C:\\Users\\Playdata\\git\\PhotoG\\CHAL-KAK\\WebContent\\img";
			String path = "C:\\Users\\Playdata\\git\\PhotoG\\CHAL-KAK\\WebContent\\img" + "/" + filename;
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
