package com.demo.entities;

public class GiaoVien {
	private int id;
	private String nameGiaoVien;
	private String ngaySinh;
	private String gioiTinh;
	private String diaChi;
	private String soDienThoai;
	private String email;
	private String anhDaiDien;
	public GiaoVien(int id, String nameGiaoVien, String ngaySinh, String gioiTinh, String diaChi, String soDienThoai,
			String email, String anhDaiDien) {
		super();
		this.id = id;
		this.nameGiaoVien = nameGiaoVien;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.anhDaiDien = anhDaiDien;
	}
	
	public GiaoVien() {
		super();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNameGiaoVien() {
		return nameGiaoVien;
	}
	public void setNameGiaoVien(String nameGiaoVien) {
		this.nameGiaoVien = nameGiaoVien;
	}
	public String getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(String ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getSoDienThoai() {
		return soDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAnhDaiDien() {
		return anhDaiDien;
	}
	public void setAnhDaiDien(String anhDaiDien) {
		this.anhDaiDien = anhDaiDien;
	}
	@Override
	public String toString() {
		return "GiaoVien [id=" + id + ", nameGiaoVien=" + nameGiaoVien + ", ngaySinh=" + ngaySinh + ", gioiTinh="
				+ gioiTinh + ", diaChi=" + diaChi + ", soDienThoai=" + soDienThoai + ", email=" + email
				+ ", anhDaiDien=" + anhDaiDien + "]";
	}
	public GiaoVien(String nameGiaoVien, String ngaySinh, String gioiTinh, String diaChi, String soDienThoai,
			String email, String anhDaiDien) {
		super();
		this.nameGiaoVien = nameGiaoVien;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.anhDaiDien = anhDaiDien;
	}

	public GiaoVien(int id, String ngaySinh, String diaChi, String soDienThoai, String email, String anhDaiDien) {
		super();
		this.id = id;
		this.ngaySinh = ngaySinh;
		this.diaChi = diaChi;
		this.soDienThoai = soDienThoai;
		this.email = email;
		this.anhDaiDien = anhDaiDien;
	}
	

}
