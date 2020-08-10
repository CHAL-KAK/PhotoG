package ck.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import ck.dao.ReservationDao;
import ck.vo.ReservationVO;

@Service
public class ReservationBiz {
	
	@Autowired
	@Qualifier(value="reservationDaoImpl")
	private ReservationDao reservationDao;
	
	public int insertReservationForm(ReservationVO vo) {
		return reservationDao.insertReservationForm(vo);
	}

}
