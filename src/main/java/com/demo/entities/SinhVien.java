package com.demo.entities;

import java.util.Date;

public class SinhVien {
	private int id;
	private String mssv;
	private String hoVaTen;
	private String soDienThoai;
	private String soDienThoaiPhuHuynh;
	private String parents;
	private Date birDate;
	private String gioiTinh;
	private String diaChi;
	private String email;
	private int idLopHoc;
	private String nameLopHoc;
	private String hinhAnh;
	private String birthday;
	
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public String getNameLopHoc() {
		return nameLopHoc;
	}
	public void setNameLopHoc(String nameLopHoc) {
		this.nameLopHoc = nameLopHoc;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHoVaTen() {
		return hoVaTen;
	}
	public void setHoVaTen(String hoVaTen) {
		this.hoVaTen = hoVaTen;
	}
	public String getSoDienThoai() {
		return soDienThoai;
	}
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	public Date getBirDate() {
		return birDate;
	}
	public void setBirDate(Date birDate) {
		this.birDate = birDate;
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
	public String getEmail() {
		return email;
	}
	
	
	
	public SinhVien(String mssv, String hoVaTen, String soDienThoai, String soDienThoaiPhuHuynh, String diaChi,
			String email, int idLopHoc, String hinhAnh, String birthday) {
		super();
		this.mssv = mssv;
		this.hoVaTen = hoVaTen;
		this.soDienThoai = soDienThoai;
		this.soDienThoaiPhuHuynh = soDienThoaiPhuHuynh;
		this.diaChi = diaChi;
		this.email = email;
		this.idLopHoc = idLopHoc;
		this.hinhAnh = hinhAnh;
		this.birthday = birthday;
	}
	public String getSoDienThoaiPhuHuynh() {
		return soDienThoaiPhuHuynh;
	}
	public void setSoDienThoaiPhuHuynh(String soDienThoaiPhuHuynh) {
		this.soDienThoaiPhuHuynh = soDienThoaiPhuHuynh;
	}
	public String getParents() {
		return parents;
	}
	public void setParents(String parents) {
		this.parents = parents;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getIdLopHoc() {
		return idLopHoc;
	}
	public void setIdLopHoc(int idLopHoc) {
		this.idLopHoc = idLopHoc;
	}
	
	public String getMssv() {
		return mssv;
	}
	public void setMssv(String mssv) {
		this.mssv = mssv;
	}

	
	@Override
	public String toString() {
		return "SinhVien [id=" + id + ", mssv=" + mssv + ", hoVaTen=" + hoVaTen + ", soDienThoai=" + soDienThoai
				+ ", soDienThoaiPhuHuynh=" + soDienThoaiPhuHuynh + ", parents=" + parents + ", birDate=" + birDate
				+ ", gioiTinh=" + gioiTinh + ", diaChi=" + diaChi + ", email=" + email + ", idLopHoc=" + idLopHoc
				+ ", nameLopHoc=" + nameLopHoc + ", hinhAnh=" + hinhAnh + "]";
	}
	public SinhVien(String hoVaTen, String soDienThoai, Date birDate, String gioiTinh, String diaChi,
			String email, int idLopHoc) {
		super();
		this.hoVaTen = hoVaTen;
		this.soDienThoai = soDienThoai;
		this.birDate = birDate;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.email = email;
		this.idLopHoc = idLopHoc;
	}
	public SinhVien() {
		super();
	}
	

	public SinhVien(String mssv, String hoVaTen, String soDienThoai, String soDienThoaiPhuHuynh, Date birDate,
			String gioiTinh, String diaChi, String email, int idLopHoc, String hinhAnh) {
		super();
		this.mssv = mssv;
		this.hoVaTen = hoVaTen;
		this.soDienThoai = soDienThoai;
		this.soDienThoaiPhuHuynh = soDienThoaiPhuHuynh;
		this.birDate = birDate;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.email = email;
		this.idLopHoc = idLopHoc;
		this.hinhAnh = hinhAnh;
	}
	
	public SinhVien(String mssv, String hoVaTen, String soDienThoai, String soDienThoaiPhuHuynh, Date birDate,
			String diaChi, String email, int idLopHoc, String hinhAnh, int id) {
		super();
		this.mssv = mssv;
		this.hoVaTen = hoVaTen;
		this.soDienThoai = soDienThoai;
		this.soDienThoaiPhuHuynh = soDienThoaiPhuHuynh;
		this.birDate = birDate;
		this.diaChi = diaChi;
		this.email = email;
		this.idLopHoc = idLopHoc;
		this.hinhAnh = hinhAnh;
		this.id = id;
	}
	public SinhVien(String hoVaTen, String soDienThoai, Date birDate, String gioiTinh, String diaChi,
			String email, int idLopHoc, String hinhAnh) {
		super();
		this.hoVaTen = hoVaTen;
		this.soDienThoai = soDienThoai;
		this.birDate = birDate;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.email = email;
		this.idLopHoc = idLopHoc;
		this.hinhAnh = hinhAnh;
	}


	

}
