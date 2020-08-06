package ck.validate;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

// spring���� �������ִ� ��ȿ�� �˻� Ŭ������ implements
@Service("fileValidator")
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// ��ȿ�� ��� Ŭ����
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
				errors.rejectValue("file", "uploadForm", "�� ���� ������ ���ݾ�!");
			}

			if (file.getDesc().isEmpty()) {
				errors.rejectValue("desc", "uploadForm", "�� ������ ���ݾ�!");
			}
		}
	}
}