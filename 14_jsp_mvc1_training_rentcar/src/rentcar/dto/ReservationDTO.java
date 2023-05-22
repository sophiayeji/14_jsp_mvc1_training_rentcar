package rentcar.dto;

import java.sql.Date;

public class ReservationDTO {
	
	private long reserveCd;	
	private Date reserveDt;
	private String rentalStartDt;
	private int period;	
	private int carCd;
	private String memberId;
	public long getReserveCd() {
		return reserveCd;
	}
	public void setReserveCd(long reserveCd) {
		this.reserveCd = reserveCd;
	}
	public Date getReserveDt() {
		return reserveDt;
	}
	public void setReserveDt(Date reserveDt) {
		this.reserveDt = reserveDt;
	}
	public String getRentalStartDt() {
		return rentalStartDt;
	}
	public void setRentalStartDt(String rentalStartDt) {
		this.rentalStartDt = rentalStartDt;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public int getCarCd() {
		return carCd;
	}
	public void setCarCd(int carCd) {
		this.carCd = carCd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	@Override
	public String toString() {
		return "ReservationDTO [reserveCd=" + reserveCd + ", reserveDt=" + reserveDt + ", rentalStartDt="
				+ rentalStartDt + ", period=" + period + ", carCd=" + carCd + ", memberId=" + memberId + "]";
	}
	
	
	
}
