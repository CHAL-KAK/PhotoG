package ck.validate;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

// spring에서 제공해주는 유효성 검사 클래스를 implements
@Service("fileValidator")
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// 유효성 대상 클래스
		return false;
	}

	@Override
	public void validate(Object uploadFile, Errors errors) {
		UploadFile file = (UploadFile) uploadFile;
		System.out.println(file.getDesc() + " 1");
		System.out.println(file.getFilename() + " 2");
		System.out.println(file.getFile().getName() + " 3");

		if (file != null) {
			if (file.getFile().getSize() == 0) {
				errors.rejectValue("file", "uploadForm", "야 파일 내용이 없잖아!");
			}

			if (file.getDesc().isEmpty()) {
				errors.rejectValue("desc", "uploadForm", "야 설명이 없잖아!");
			}
		}
	}
}