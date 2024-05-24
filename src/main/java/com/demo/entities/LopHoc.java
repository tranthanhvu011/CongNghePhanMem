package com.demo.entities;

public class LopHoc {
	private int id;
	private String giaoVienChuNhiem;
	private String tenLopHoc;
	private String nameGiaoVien;
	public int getId() {
		return id;
	}
	
	public String getNameGiaoVien() {
		return nameGiaoVien;
	}

	public void setNameGiaoVien(String nameGiaoVien) {
		this.nameGiaoVien = nameGiaoVien;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getGiaoVienChuNhiem() {
		return giaoVienChuNhiem;
	}
	public void setGiaoVienChuNhiem(String giaoVienChuNhiem) {
		this.giaoVienChuNhiem = giaoVienChuNhiem;
	}
	public String getTenLopHoc() {
		return tenLopHoc;
	}
	public void setTenLopHoc(String tenLopHoc) {
		this.tenLopHoc = tenLopHoc;
	}

	@Override
	public String toString() {
		return "LopHoc [id=" + id + ", giaoVienChuNhiem=" + giaoVienChuNhiem + ", tenLopHoc=" + tenLopHoc
				+ ", nameGiaoVien=" + nameGiaoVien + "]";
	}

	public LopHoc(String giaoVienChuNhiem, String tenLopHoc) {
		super();
		this.giaoVienChuNhiem = giaoVienChuNhiem;
		this.tenLopHoc = tenLopHoc;
	}
	public LopHoc() {
		super();
	}
	

}
