package ck.validate;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import ck.vo.PictureVO;

@Service("fileValidator")
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object pictureVO, Errors errors) {
		PictureVO file = (PictureVO) pictureVO;

		if (file != null) {
			if (file.getFile().getSize() == 0) {
				errors.rejectValue("file", "profile_enroll", "WRONG!");
			}

//			if (file.getDesc().isEmpty()) {
//				errors.rejectValue("desc", "uploadForm", "�� ������ ���ݾ�!");
//			}
		}
	}
}