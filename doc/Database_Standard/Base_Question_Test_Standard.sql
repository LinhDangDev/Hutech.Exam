USE [master]
GO


IF DB_ID('HUTECH_EXAM_PASS') IS NOT NULL
BEGIN
    ALTER DATABASE HUTECH_EXAM_PASS SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE HUTECH_EXAM_PASS;
END

CREATE DATABASE [HUTECH_EXAM_PASS]
go

USE [HUTECH_EXAM_PASS]
GO
/****** Object:  Table [dbo].[ca_thi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ca_thi](
	[ma_ca_thi] [int] IDENTITY(1,1) NOT NULL,
	[ten_ca_thi] [nvarchar](50) NULL,
	[ma_chi_tiet_dot_thi] [int] NOT NULL,
	[thoi_gian_bat_dau] [datetime] NOT NULL,
	[MaDeThi] [int] NOT NULL,
	[IsActivated] [bit] NOT NULL,
	[ActivatedDate] [datetime] NULL,
	[ThoiGianThi] [int] NOT NULL,
	[KetThuc] [bit] NOT NULL,
	[ThoiDiemKetThuc] [datetime] NULL,
	[MatMa] [nvarchar](128) NULL,
	[Approved] [bit] NOT NULL,
	[ApprovedDate] [date] NULL,
	[ApprovedComments] [nvarchar](500) NULL,
 CONSTRAINT [PK_shift] PRIMARY KEY CLUSTERED 
(
	[ma_ca_thi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chi_tiet_bai_thi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_bai_thi](
	[MaChiTietBaiThi] [bigint] IDENTITY(1,1) NOT NULL,
	[ma_chi_tiet_ca_thi] [int] NOT NULL,
	[MaDeHV] [bigint] NOT NULL,
	[MaNhom] [int] NOT NULL,
	[MaCauHoi] [int] NOT NULL,
	[CauTraLoi] [int] NULL,
	[NgayTao] [datetime] NOT NULL,
	[NgayCapNhat] [datetime] NULL,
	[KetQua] [bit] NULL,
	[ThuTu] [int] NOT NULL,
 CONSTRAINT [PK_task_detail] PRIMARY KEY CLUSTERED 
(
	[MaChiTietBaiThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chi_tiet_ca_thi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_ca_thi](
	[ma_chi_tiet_ca_thi] [int] IDENTITY(1,1) NOT NULL,
	[ma_ca_thi] [int] NULL,
	[ma_sinh_vien] [bigint] NULL,
	[ma_de_thi] [bigint] NULL,
	[thoi_gian_bat_dau] [datetime] NULL,
	[thoi_gian_ket_thuc] [datetime] NULL,
	[da_thi] [bit] NOT NULL,
	[da_hoan_thanh] [bit] NOT NULL,
	[diem] [float] NOT NULL,
	[tong_so_cau] [int] NULL,
	[so_cau_dung] [int] NULL,
	[gio_cong_them] [int] NOT NULL,
	[thoi_diem_cong] [datetime] NULL,
	[ly_do_cong] [nvarchar](max) NULL,
 CONSTRAINT [PK_shift_detail] PRIMARY KEY CLUSTERED 
(
	[ma_chi_tiet_ca_thi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chi_tiet_dot_thi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_dot_thi](
	[ma_chi_tiet_dot_thi] [int] IDENTITY(1,1) NOT NULL,
	[ten_chi_tiet_dot_thi] [nvarchar](200) NOT NULL,
	[ma_lop_ao] [int] NOT NULL,
	[ma_dot_thi] [int] NOT NULL,
	[lan_thi] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_phase_detail] PRIMARY KEY CLUSTERED 
(
	[ma_chi_tiet_dot_thi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dot_thi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dot_thi](
	[ma_dot_thi] [int] IDENTITY(1,1) NOT NULL,
	[ten_dot_thi] [nvarchar](150) NULL,
	[thoi_gian_bat_dau] [datetime] NULL,
	[thoi_gian_ket_thuc] [datetime] NULL,
	[NamHoc] [int] NULL,
 CONSTRAINT [PK_dot_thi] PRIMARY KEY CLUSTERED 
(
	[ma_dot_thi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khoa]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khoa](
	[ma_khoa] [int] IDENTITY(1,1) NOT NULL,
	[ten_khoa] [nvarchar](30) NULL,
	[ngay_thanh_lap] [datetime] NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[ma_khoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lop]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lop](
	[ma_lop] [int] IDENTITY(1,1) NOT NULL,
	[ten_lop] [nvarchar](50) NULL,
	[ngay_bat_dau] [datetime] NULL,
	[ma_khoa] [int] NULL,
 CONSTRAINT [PK_class] PRIMARY KEY CLUSTERED 
(
	[ma_lop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lop_ao]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lop_ao](
	[ma_lop_ao] [int] IDENTITY(1,1) NOT NULL,
	[ten_lop_ao] [nvarchar](200) NULL,
	[ngay_bat_dau] [datetime] NULL,
	[ma_mon_hoc] [int] NULL,
 CONSTRAINT [PK_class_virtual] PRIMARY KEY CLUSTERED 
(
	[ma_lop_ao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[menu_id] [int] IDENTITY(1,1) NOT NULL,
	[menu_title] [nvarchar](100) NOT NULL,
	[menu_description] [nvarchar](200) NULL,
	[menu_url] [nvarchar](100) NULL,
	[menu_valuepath] [nvarchar](100) NULL,
	[menu_parent_id] [int] NULL,
	[menu_order] [int] NOT NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mon_hoc]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_hoc](
	[ma_mon_hoc] [int] IDENTITY(1,1) NOT NULL,
	[ma_so_mon_hoc] [nvarchar](50) NULL,
	[ten_mon_hoc] [nvarchar](200) NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[ma_mon_hoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sinh_vien]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sinh_vien](
	[ma_sinh_vien] [bigint] IDENTITY(1,1) NOT NULL,
	[ho_va_ten_lot] [nvarchar](300) NULL,
	[ten_sinh_vien] [nvarchar](50) NULL,
	[gioi_tinh] [smallint] NULL,
	[ngay_sinh] [datetime] NULL,
	[ma_lop] [int] NULL,
	[dia_chi] [text] NULL,
	[email] [nvarchar](200) NULL,
	[dien_thoai] [nvarchar](50) NULL,
	[ma_so_sinh_vien] [nvarchar](50) NULL,
	[student_id] [uniqueidentifier] NULL,
	[is_logged_in] [bit] NULL,
	[last_logged_in] [datetime] NULL,
	[last_logged_out] [datetime] NULL,
	[Photo] [image] NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[ma_sinh_vien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sinh_vien_lop_ao]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sinh_vien_lop_ao](
	[ma_sinh_vien_lop_ao] [bigint] IDENTITY(1,1) NOT NULL,
	[ma_sinh_vien] [bigint] NOT NULL,
	[ma_lop_ao] [int] NOT NULL,
 CONSTRAINT [PK_sinh_vien_lop_ao] PRIMARY KEY CLUSTERED 
(
	[ma_sinh_vien_lop_ao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_AudioListened]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_AudioListened](
	[ListenID] [bigint] IDENTITY(1,1) NOT NULL,
	[MaChiTietCaThi] [int] NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[ListenedCount] [int] NOT NULL,
 CONSTRAINT [PK_tbl_AudioListened] PRIMARY KEY CLUSTERED 
(
	[ListenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CauHoi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CauHoi](
	[MaCauHoi] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](250) NULL,
	[KieuNoiDung] [int] NOT NULL,
	[NoiDung] [ntext] NULL,
	[GhiChu] [nvarchar](100) NULL,
	[HoanVi] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CauHoi] PRIMARY KEY CLUSTERED 
(
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CauHoiMa]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CauHoiMa](
	[MaCauHoiMa] [int] IDENTITY(1,1) NOT NULL,
	[MaNhom] [int] NOT NULL,
	[ThuTu] [int] NOT NULL,
	[MaChiTietCaThi] [int] NOT NULL,
 CONSTRAINT [PK_tbl_CauHoiMa] PRIMARY KEY CLUSTERED 
(
	[MaCauHoiMa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CauTraLoi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CauTraLoi](
	[MaCauTraLoi] [int] IDENTITY(1,1) NOT NULL,
	[MaCauHoi] [int] NOT NULL,
	[ThuTu] [int] NOT NULL,
	[NoiDung] [ntext] NULL,
	[LaDapAn] [bit] NOT NULL,
	[HoanVi] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CauTraLoi] PRIMARY KEY CLUSTERED 
(
	[MaCauTraLoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ChiTietCauHoiMa]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ChiTietCauHoiMa](
	[MaCauHoiMa] [int] NOT NULL,
	[MaChiTietBaiThi] [bigint] NOT NULL,
 CONSTRAINT [PK_tbl_ChiTietCauHoiMa] PRIMARY KEY CLUSTERED 
(
	[MaCauHoiMa] ASC,
	[MaChiTietBaiThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ChiTietDeThi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ChiTietDeThi](
	[MaNhom] [int] NOT NULL,
	[MaCauHoi] [int] NOT NULL,
	[ThuTu] [int] NOT NULL,
 CONSTRAINT [PK_tbl_ChiTietDeThi] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC,
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ChiTietDeThiHoanVi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ChiTietDeThiHoanVi](
	[MaDeHV] [bigint] NOT NULL,
	[MaNhom] [int] NOT NULL,
	[MaCauHoi] [int] NOT NULL,
	[ThuTu] [int] NOT NULL,
	[HoanViTraLoi] [nvarchar](4) NULL,
	[DapAn] [int] NULL,
 CONSTRAINT [PK_tbl_ChiTietDeThiHoanVi] PRIMARY KEY CLUSTERED 
(
	[MaDeHV] ASC,
	[MaNhom] ASC,
	[MaCauHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_danhmuc_CaThiTrongNgay]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_danhmuc_CaThiTrongNgay](
	[MaCaTrongNgay] [int] IDENTITY(1,1) NOT NULL,
	[TenCaTrongNgay] [nvarchar](100) NOT NULL,
	[GioBatDau] [int] NOT NULL,
	[PhutBatDau] [int] NOT NULL,
	[GioKetThuc] [int] NOT NULL,
	[PhutKetThuc] [int] NOT NULL,
	[CaThiCode] [int] NOT NULL,
 CONSTRAINT [PK_tbl_CaThiTrongNgay] PRIMARY KEY CLUSTERED 
(
	[MaCaTrongNgay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DeThi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DeThi](
	[MaDeThi] [int] IDENTITY(1,1) NOT NULL,
	[MaMonHoc] [int] NOT NULL,
	[TenDeThi] [nvarchar](250) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[NguoiTao] [int] NOT NULL,
	[GhiChu] [ntext] NULL,
	[LuuTam] [bit] NOT NULL,
	[DaDuyet] [bit] NOT NULL,
	[TongSoDeHoanVi] [int] NULL,
	[BoChuongPhan] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_DeThi] PRIMARY KEY CLUSTERED 
(
	[MaDeThi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_DeThiHoanVi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_DeThiHoanVi](
	[MaDeHV] [bigint] IDENTITY(1,1) NOT NULL,
	[MaDeThi] [int] NOT NULL,
	[KyHieuDe] [nvarchar](50) NULL,
	[NgayTao] [datetime] NOT NULL,
	[Guid] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_DeThiHoanVi] PRIMARY KEY CLUSTERED 
(
	[MaDeHV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_NhomCauHoi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhomCauHoi](
	[MaNhom] [int] IDENTITY(1,1) NOT NULL,
	[MaDeThi] [int] NOT NULL,
	[TenNhom] [nvarchar](250) NOT NULL,
	[NoiDung] [ntext] NULL,
	[SoCauHoi] [int] NOT NULL,
	[HoanVi] [bit] NOT NULL,
	[ThuTu] [int] NOT NULL,
	[MaNhomCha] [int] NOT NULL,
	[SoCauLay] [int] NOT NULL,
	[LaCauHoiNhom] [bit] NULL,
 CONSTRAINT [PK_tbl_NhomCauHoi] PRIMARY KEY CLUSTERED 
(
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_NhomCauHoiHoanVi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NhomCauHoiHoanVi](
	[MaDeHV] [bigint] NOT NULL,
	[MaNhom] [int] NOT NULL,
	[ThuTu] [int] NOT NULL,
 CONSTRAINT [PK_tbl_NhomHoanVi] PRIMARY KEY CLUSTERED 
(
	[MaDeHV] ASC,
	[MaNhom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[LastActivityDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[LastPasswordChangedDate] [datetime] NULL,
	[LastLockoutDate] [datetime] NULL,
	[FailedPwdAttemptCount] [int] NULL,
	[FailedPwdAttemptWindowStart] [datetime] NULL,
	[FailedPwdAnswerCount] [int] NULL,
	[FailedPwdAnswerWindowStart] [datetime] NULL,
	[PasswordSalt] [nvarchar](255) NULL,
	[Comment] [ntext] NULL,
	[IsBuildInUser] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ca_thi] ON 

INSERT [dbo].[ca_thi] ([ma_ca_thi], [ten_ca_thi], [ma_chi_tiet_dot_thi], [thoi_gian_bat_dau], [MaDeThi], [IsActivated], [ActivatedDate], [ThoiGianThi], [KetThuc], [ThoiDiemKetThuc], [MatMa], [Approved], [ApprovedDate], [ApprovedComments]) VALUES (1, N'Thứ 5, 27/06/2024 - 20:00 ', 1, CAST(N'2024-08-26T00:00:00.000' AS DateTime), 1, 0, NULL, 90, 0, CAST(N'2024-05-27T15:20:36.270' AS DateTime), NULL, 0, NULL, NULL)
INSERT [dbo].[ca_thi] ([ma_ca_thi], [ten_ca_thi], [ma_chi_tiet_dot_thi], [thoi_gian_bat_dau], [MaDeThi], [IsActivated], [ActivatedDate], [ThoiGianThi], [KetThuc], [ThoiDiemKetThuc], [MatMa], [Approved], [ApprovedDate], [ApprovedComments]) VALUES (2, N'Thứ 7, 25/12/2024 - 15:00', 1, CAST(N'2024-12-25T15:00:00.000' AS DateTime), 1, 0, NULL, 120, 0, CAST(N'2024-05-27T15:15:39.437' AS DateTime), NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ca_thi] OFF
GO
SET IDENTITY_INSERT [dbo].[chi_tiet_bai_thi] ON 

INSERT [dbo].[chi_tiet_bai_thi] ([MaChiTietBaiThi], [ma_chi_tiet_ca_thi], [MaDeHV], [MaNhom], [MaCauHoi], [CauTraLoi], [NgayTao], [NgayCapNhat], [KetQua], [ThuTu]) VALUES (41, 3, 5, 8, 34, 125, CAST(N'2024-08-26T10:35:58.420' AS DateTime), CAST(N'2024-08-26T10:35:58.453' AS DateTime), 0, 1)
INSERT [dbo].[chi_tiet_bai_thi] ([MaChiTietBaiThi], [ma_chi_tiet_ca_thi], [MaDeHV], [MaNhom], [MaCauHoi], [CauTraLoi], [NgayTao], [NgayCapNhat], [KetQua], [ThuTu]) VALUES (42, 3, 5, 14, 67, 258, CAST(N'2024-08-26T10:35:58.430' AS DateTime), CAST(N'2024-08-26T10:35:58.457' AS DateTime), 0, 2)
INSERT [dbo].[chi_tiet_bai_thi] ([MaChiTietBaiThi], [ma_chi_tiet_ca_thi], [MaDeHV], [MaNhom], [MaCauHoi], [CauTraLoi], [NgayTao], [NgayCapNhat], [KetQua], [ThuTu]) VALUES (43, 3, 5, 14, 64, 245, CAST(N'2024-08-26T10:35:58.443' AS DateTime), CAST(N'2024-08-26T10:35:58.460' AS DateTime), 0, 3)
SET IDENTITY_INSERT [dbo].[chi_tiet_bai_thi] OFF
GO
SET IDENTITY_INSERT [dbo].[chi_tiet_ca_thi] ON 

INSERT [dbo].[chi_tiet_ca_thi] ([ma_chi_tiet_ca_thi], [ma_ca_thi], [ma_sinh_vien], [ma_de_thi], [thoi_gian_bat_dau], [thoi_gian_ket_thuc], [da_thi], [da_hoan_thanh], [diem], [tong_so_cau], [so_cau_dung], [gio_cong_them], [thoi_diem_cong], [ly_do_cong]) VALUES (1, 1, 1, 7, NULL, NULL, 0, 0, -1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[chi_tiet_ca_thi] ([ma_chi_tiet_ca_thi], [ma_ca_thi], [ma_sinh_vien], [ma_de_thi], [thoi_gian_bat_dau], [thoi_gian_ket_thuc], [da_thi], [da_hoan_thanh], [diem], [tong_so_cau], [so_cau_dung], [gio_cong_them], [thoi_diem_cong], [ly_do_cong]) VALUES (2, 1, 2, 6, NULL, NULL, 0, 0, -1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[chi_tiet_ca_thi] ([ma_chi_tiet_ca_thi], [ma_ca_thi], [ma_sinh_vien], [ma_de_thi], [thoi_gian_bat_dau], [thoi_gian_ket_thuc], [da_thi], [da_hoan_thanh], [diem], [tong_so_cau], [so_cau_dung], [gio_cong_them], [thoi_diem_cong], [ly_do_cong]) VALUES (3, 1, 3, 5, NULL, NULL, 0, 0, -1, 0, 0, 0, NULL, NULL)
INSERT [dbo].[chi_tiet_ca_thi] ([ma_chi_tiet_ca_thi], [ma_ca_thi], [ma_sinh_vien], [ma_de_thi], [thoi_gian_bat_dau], [thoi_gian_ket_thuc], [da_thi], [da_hoan_thanh], [diem], [tong_so_cau], [so_cau_dung], [gio_cong_them], [thoi_diem_cong], [ly_do_cong]) VALUES (4, 1, 4, 8, NULL, NULL, 0, 0, -1, 0, 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[chi_tiet_ca_thi] OFF
GO
SET IDENTITY_INSERT [dbo].[chi_tiet_dot_thi] ON 

INSERT [dbo].[chi_tiet_dot_thi] ([ma_chi_tiet_dot_thi], [ten_chi_tiet_dot_thi], [ma_lop_ao], [ma_dot_thi], [lan_thi]) VALUES (1, N'', 1, 1, N'1')
SET IDENTITY_INSERT [dbo].[chi_tiet_dot_thi] OFF
GO
SET IDENTITY_INSERT [dbo].[dot_thi] ON 

INSERT [dbo].[dot_thi] ([ma_dot_thi], [ten_dot_thi], [thoi_gian_bat_dau], [thoi_gian_ket_thuc], [NamHoc]) VALUES (1, N'THI ĐỒ ÁN CƠ SỞ', CAST(N'2024-04-11T00:00:00.000' AS DateTime), CAST(N'2024-04-11T00:00:00.000' AS DateTime), 2024)
SET IDENTITY_INSERT [dbo].[dot_thi] OFF
GO
SET IDENTITY_INSERT [dbo].[lop_ao] ON 

INSERT [dbo].[lop_ao] ([ma_lop_ao], [ten_lop_ao], [ngay_bat_dau], [ma_mon_hoc]) VALUES (1, N'E1-04.04', CAST(N'2024-04-11T22:12:49.787' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[lop_ao] OFF
GO
SET IDENTITY_INSERT [dbo].[mon_hoc] ON 

INSERT [dbo].[mon_hoc] ([ma_mon_hoc], [ma_so_mon_hoc], [ten_mon_hoc]) VALUES (1, N'ENC106', N'Tổng Hợp Ngôn Ngữ')
INSERT [dbo].[mon_hoc] ([ma_mon_hoc], [ma_so_mon_hoc], [ten_mon_hoc]) VALUES (2, N'SUM165', N'Tổng Hợp')
SET IDENTITY_INSERT [dbo].[mon_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[sinh_vien] ON 

INSERT [dbo].[sinh_vien] ([ma_sinh_vien], [ho_va_ten_lot], [ten_sinh_vien], [gioi_tinh], [ngay_sinh], [ma_lop], [dia_chi], [email], [dien_thoai], [ma_so_sinh_vien], [student_id], [is_logged_in], [last_logged_in], [last_logged_out], [Photo]) VALUES (1, N'Cao Hiển ', N'Đạt', 0, CAST(N'2003-03-18T00:00:00.000' AS DateTime), NULL, NULL, N'hiendatcao13@gmail.com', NULL, N'2180608276', N'd07c9341-52de-4e49-a3fc-b2fd3c83fe39', 1, CAST(N'2024-08-25T22:16:02.507' AS DateTime), CAST(N'2024-06-26T23:19:41.357' AS DateTime), NULL)
INSERT [dbo].[sinh_vien] ([ma_sinh_vien], [ho_va_ten_lot], [ten_sinh_vien], [gioi_tinh], [ngay_sinh], [ma_lop], [dia_chi], [email], [dien_thoai], [ma_so_sinh_vien], [student_id], [is_logged_in], [last_logged_in], [last_logged_out], [Photo]) VALUES (2, N'Đỗ Thùy', N'Dung', 1, CAST(N'2003-11-11T00:00:00.000' AS DateTime), NULL, NULL, N'dothuydung14@gmail.com', NULL, N'2180607359', N'21c952e2-bb45-4cbc-be49-3d4089e1ec1d', 0, CAST(N'2024-06-26T22:35:54.867' AS DateTime), CAST(N'2024-06-26T23:19:45.087' AS DateTime), NULL)
INSERT [dbo].[sinh_vien] ([ma_sinh_vien], [ho_va_ten_lot], [ten_sinh_vien], [gioi_tinh], [ngay_sinh], [ma_lop], [dia_chi], [email], [dien_thoai], [ma_so_sinh_vien], [student_id], [is_logged_in], [last_logged_in], [last_logged_out], [Photo]) VALUES (3, N'Đặng Duy', N'Linh', 0, CAST(N'2003-07-15T00:00:00.000' AS DateTime), NULL, NULL, N'dangduylinh15@gmail.com', NULL, N'2180608877', N'29cff326-4ba2-426c-847b-d2270d4e5720', 0, CAST(N'2024-08-26T10:35:36.417' AS DateTime), CAST(N'2024-08-26T10:37:00.227' AS DateTime), NULL)
INSERT [dbo].[sinh_vien] ([ma_sinh_vien], [ho_va_ten_lot], [ten_sinh_vien], [gioi_tinh], [ngay_sinh], [ma_lop], [dia_chi], [email], [dien_thoai], [ma_so_sinh_vien], [student_id], [is_logged_in], [last_logged_in], [last_logged_out], [Photo]) VALUES (4, N'Vương Khả', N'Thạch', 0, CAST(N'2003-09-08T00:00:00.000' AS DateTime), NULL, NULL, N'vuongkhathach16@gmail.com', NULL, N'2180608012', N'47c11564-5180-4b24-8577-f610cf0ba4bb', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[sinh_vien] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_AudioListened] ON 

INSERT [dbo].[tbl_AudioListened] ([ListenID], [MaChiTietCaThi], [FileName], [ListenedCount]) VALUES (1, 1, N'What_are_you_going_to_do.mp3', 3)
INSERT [dbo].[tbl_AudioListened] ([ListenID], [MaChiTietCaThi], [FileName], [ListenedCount]) VALUES (2, 2, N'What_are_you_going_to_do.mp3', 3)
INSERT [dbo].[tbl_AudioListened] ([ListenID], [MaChiTietCaThi], [FileName], [ListenedCount]) VALUES (3, 3, N'What_are_you_going_to_do.mp3', 3)
INSERT [dbo].[tbl_AudioListened] ([ListenID], [MaChiTietCaThi], [FileName], [ListenedCount]) VALUES (4, 4, N'What_are_you_going_to_do.mp3', 3)
SET IDENTITY_INSERT [dbo].[tbl_AudioListened] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CauHoi] ON 

INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (1, N'Phần 1: phát âm', -1, N'<p>Choose difference sound</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (2, N'Phần 1: phát âm', -1, N'<p>Choose difference sound</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (3, N'Phần 2: ngữ pháp', -1, N'<p>I _______ there once a long time ago and _______ back since.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (4, N'Phần 2: ngữ pháp', -1, N'<p>It is recommended that this machine ______ checked every year.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (5, N'Phần 2: ngữ pháp', -1, N'<p>_______ is writing brief entries about the daily activities of an individual or company.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (6, N'Phần 2: ngữ pháp', -1, N'<p>There are people who choose to abandon their heritage culture and assimilate _______ the new culture of the majority.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (7, N'Phần 2: ngữ pháp', -1, N'<p>You don’t get a lot of _______ from a news report on radio or TV.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (8, N'Phần 2: ngữ pháp', -1, N'<p>Only after food has been dried or canned _______.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (9, N'Phần 2: ngữ pháp', -1, N'<p>The areas _______ are destroyed suffer a lot from soil erosion.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (10, N'Phần 2: ngữ pháp', -1, N'<p><Equation Value="\frac{d}{dx}\left( \int_{0}^{x} f(u)\,du\right)=f(x)" ></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (11, N'Phần 2: ngữ pháp', -1, N'<p>We managed to finish the exercise on time and passed the exam. ________, it was very difficult.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (12, N'Phần 2: ngữ pháp', -1, N'<p>He has the  ________ face and skin of an old traveller.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (13, N'Phần 2: ngữ pháp', -1, N'<p>It is stated that we are now in the first stages of a battle for the _______ of life on the earth.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (14, N'Phần 2: ngữ pháp', -1, N'<p>_______ Women’s Day is on _______ eighth of March.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (15, N'Phần 3: từ trái nghĩa', -1, N'<p>One of the reasons why families break up is that parents are always critical of each other.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (16, N'Phần 3: từ trái nghĩa', -1, N'<p>Urbanization has resulted in massive problems besides the benefits.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (17, N'Phần 4: từ đồng nghĩa', -1, N'<p>Under the major''s able leadership, the soldiers found safety.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (18, N'Phần 4: từ đồng nghĩa', -1, N'<p>Adverts on Facebook seem to be more efficient than billboards or TV ads because of its enormous number of users.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (19, N'Phần 5: câu hỏi nhóm', -1, N'', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (20, N'Phần 5: câu hỏi nhóm', -1, N'', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (21, N'Phần 5: câu hỏi nhóm', -1, N'', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (22, N'Phần 5: câu hỏi nhóm', -1, N'', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (23, N'Phần 5: câu hỏi nhóm', -1, N'', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (24, N'Phần 6: nghe', -1, N'<p>The Clavie is __________________.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (25, N'Phần 6: nghe', -1, N'<p>In the Up Helly Aa festival, they burn __________________.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (26, N'Phần 6: nghe', -1, N'<p>During a pancake race, you have to __________________.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (27, N'Phần 6: nghe', -1, N'<p>Nowadays, the people who win the cheese rolling competition are usually _______________.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (28, N'Phần 6: nghe', -1, N'<p>The fastest snail in the Snail Racing is __________________.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (29, N'Phần 6: nghe', -1, N'<p>Black Pudding throwing is similar to __________________.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (30, N'Phần 6: nghe', -1, N'<p>To win the best gurner competition, one man __________________.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (31, N'Phần 6: nghe', -1, N'<p>The Burning of the Clocks festival is __________________.</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (32, N'Thuộc nhóm chương 1', -1, N'<p>Tìm từ khác nghĩa với các từ còn lại</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (33, N'Thuộc nhóm chương 1', -1, N'<p>Tìm từ khác nghĩa với các từ còn lại</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (34, N'Thuộc nhóm chương 2', -1, N'<p>Cho lược đồ quan hệ R(U), với U = (A,B,D,C), F= {A→BCD, C→D}. Lược đồ quan hệ R(U)  ở dạng chuẩn nào?<p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (35, N'Thuộc nhóm chương 2', -1, N'<p>Trong thực tế cài đặt, một lược đồ cơ sở dữ liệu ít nhất phải đạt dạng chuẩn nào trong các dạng chuẩn sau:</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (36, N'Thuộc nhóm chương 2', -1, N'<p>Cho lược đồ quan hệ R(U), với U = {A,B,D,C,E}, F = {A→BC, C→D, AC→E}. Lược đồ quan hệ R(U)  ở dạng chuẩn nào?</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (37, N'Thuộc nhóm chương 2', -1, N'<p>Cho loại quan hệ SINHVIEN(MSSV, HoTen, Ngaysinh, NgayVaoDoan). Phát biểu: “Ngày vào Đoàn (NgayVaoDoan) > Ngày sinh (Ngaysinh)” thuộc loại ràng buộc toàn vẹn gì?</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (38, N'Thuộc nhóm chương 3', -1, N'<p>Choose difference</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (39, N'Thuộc nhóm chương 4', -1, N'<p>Cho lược đồ quan hệ SACH gồm các thuộc tính: Mã sách, tên tên sách, giá, mã nhà xuất bản, tên nhà xuất bản và tập PTH</p><p>F={Mã sách → tên sách, giá, mã nhà xuất bản; mã nhà xuất bản → tên nhà xuất bản}. Lược đồ quan hệ trên ở dạng chuẩn nào? </p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (40, N'Thuộc nhóm chương 4', -1, N'<p>Cho lược đồ quan hệ HOADON(SOHD: Số hóa đơn, NGAY: Ngày lập hóa đơn, NOIDUNG: Nội dung). Ràng buộc: “Ngày lập hóa đơn phải nhỏ hơn hoặc bằng ngày hiện hành“. Hãy chỉ ra phát biểu mô tả đúng nhất?</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (41, N'Thuộc nhóm chương 4', -1, N'<p>Cho lược đồ quan hệ Q(A,B,C,D,E,I) và tập phụ thuộc hàm F={ACD→EBI, CE→AD}. Q đạt dạng mấy?</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (42, N'Thuộc nhóm chương 4', -1, N'<p>Dạng chuẩn đạt được của một lược đồ cơ sở dữ liệu là:</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (43, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (44, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (45, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (46, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (47, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (48, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (49, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (50, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (51, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (52, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (53, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (54, N'Thuộc nhóm chương 5.1', -1, N'<p></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (55, N'Thuộc nhóm chương 6', 1, N'<p>Nghiệm của phương trình<span class= “latex”>2^x = 3.</latex></p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (56, N'Thuộc nhóm chương 6', 1, N'<p>Cho a là số thực dương. Giá trị rút gọn của biểu thức <latex> P = a_4^3\sqrt{a}</latex>bằng</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (57, N'Thuộc nhóm chương 6', 1, N'Bồn hoa của một trường X có dạng hình tròn bán kính bằng 8m. Người ta chia bồn hoa thành các phần như hình vẽ dưới đây và có ý định trồng hoa như sau: Phần diện tích bên trong hình vuông ABCD để trồng hoa. Phần diện tích kéo dài từ 4 cạnh của hình vuông đến đường tròn dùng để trồng cỏ. Ở bốn góc còn lại, mỗi góc trồng một cây cọ. Biết AB = 4m, giá trồng hoa là 200.000đ/<latex>m^2</latex>, giá trồng cỏ là 100.000đ/<latex>m^2</latex>, mỗi cây cọ giá 150.000đ. Hỏi cần bao nhiêu tiền để thực hiện việc trang trí bồn hoa đó.<br><br/><img src="./images/garden_radius.png">
', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (58, N'Thuộc nhóm chương 6', -1, N'<p>Trong không gian Oxyz, đường thẳng Oz có phương trình là</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (59, N'Thuộc nhóm chương 6', -1, N'<p>Tính thể tích V của khối lăng trụ có đáy là một lục giác đều cạnh a và chiều cao của khối lăng trụ 4a</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (60, N'Thuộc nhóm chương 6', -1, N'<p>Đồ thị sau đây là đồ thị của hàm số nào?</p><br><br/><img src="./images/map_Oxy.png">', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (61, N'Thuộc nhóm chương 6', 1, N'<p>Một sóng cơ truyền dọc theo trục Ox với phương trình <latex> u=4\cos(20\pi t-2\pi x)</latex>(mm). Biên độ của sóng này là</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (62, N'Thuộc nhóm chương 7', -1, N'<p>Mark is going to...</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (63, N'Thuộc nhóm chương 7', -1, N'<p>Mark is also going to...</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (64, N'Thuộc nhóm chương 7', -1, N'<p>James is going to...</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (65, N'Thuộc nhóm chương 7', -1, N'<p>Sam is going to...</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (66, N'Thuộc nhóm chương 7', -1, N'<p>Jake is going to...</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (67, N'Thuộc nhóm chương 7', -1, N'<p>Carla is going to...</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (68, N'Thuộc nhóm chương 7', -1, N'<p>Tom is not going to…</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (69, N'Thuộc nhóm chương 7', -1, N'<p>Daniel and Tom are going to…</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (70, N'Thuộc nhóm chương 8', 1, N'<p>Hỗn hợp <latex>X</latex> gồm <latex>Al, Al_{2}O_{3}, Fe, FeO, Fe_{3}O_{4}</latex> và <latex> Fe_{2}O_{3}</latex> trong đó <latex>O</latex> chiếm 18,49% về khối lượng. Hòa tan hết 12,98 gam <latex>X</latex> cần vừa đủ 627,5 ml dung dịch <latex> HNO_{3} </latex> 1M thu được dung dịch Y và 0,448 lít hỗn hợp khí <latex>Z</latex> (đktc) gồm <latex>NO</latex> và<latex> N_{2}</latex> có tỷ lệ mol tương ứng là 1:1. Làm bay hơi dung dịch <latex>Y</latex> thu được m gam muối. Giá trị của m là:</p>', NULL, 1)
INSERT [dbo].[tbl_CauHoi] ([MaCauHoi], [TieuDe], [KieuNoiDung], [NoiDung], [GhiChu], [HoanVi]) VALUES (71, N'Thuộc nhóm chương 8', 1, N'<p>Hỗn hợp <latex>X</latex> gồm <latex>Cu</latex> và <latex>Fe_{3}O_{4} </latex>. Hoà tan m gam hỗn hợp <latex>X</latex> bằng dung dịch <latex> H_{2}SO_{4}</latex> loãng dư thu được dung dịch <latex>Y</latex> và<latex>\frac{8}{45}</latex>m gam chất rắn không tan. Hoà tan m gam hỗn hợp <latex>X</latex> bằng dung dịch <latex>HNO_{3}</latex>dư thu được 0,05 mol<latex>NO_{2}</latex>(sản phẩm khử duy nhất). Giá trị của m là :</p>', NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_CauHoi] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CauTraLoi] ON 

INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (1, 1, 1, N'sl<u><b>u</b></u>m', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (2, 1, 2, N'<u><b>u</b></u>rban', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (3, 1, 3, N'b<u><b>u</b></u>lb', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (4, 1, 4, N'cl<u><b>u</b></u>tter', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (5, 2, 1, N'de<u><b>t</b></u>ermine', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (6, 2, 2, N'cos<u><b>t</b></u>ume', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (7, 2, 3, N'cul<u><b>t</b></u>ure', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (8, 2, 4, N'cri<u><b>t</b></u>ical', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (9, 3, 1, N'went / wasn’t', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (10, 3, 2, N'was going / had not been', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (11, 3, 3, N'have gone / wasn’t                   ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (12, 3, 4, N'went / have not been', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (13, 4, 1, N'to be            ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (14, 4, 2, N'is', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (15, 4, 3, N'be', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (16, 4, 4, N'are', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (17, 5, 1, N'App', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (18, 5, 2, N'Mass media', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (19, 5, 3, N' Advent', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (20, 5, 4, N'Microblogging', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (21, 6, 1, N'on', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (22, 6, 2, N'in', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (23, 6, 3, N'with', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (24, 6, 4, N'to', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (25, 7, 1, N'inform', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (26, 7, 2, N'informative  ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (27, 7, 3, N'information', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (28, 7, 4, N'informatively', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (29, 8, 1, N'that it should be stored for future use', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (30, 8, 2, N'it should be stored for future use', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (31, 8, 3, N'should it be stored for future use', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (32, 8, 4, N'should it store for future', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (33, 9, 1, N'whose trees', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (34, 9, 2, N'trees of which', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (35, 9, 3, N'which trees', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (36, 9, 4, N'that trees', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (37, 10, 1, N'spirits', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (38, 10, 2, N'customs', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (39, 10, 3, N'national prides', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (40, 10, 4, N'behaviors', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (41, 11, 1, N'But', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (42, 11, 2, N'However', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (43, 11, 3, N'So', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (44, 11, 4, N'Therefore', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (45, 12, 1, N'thought-provoking', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (46, 12, 2, N'year-round', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (47, 12, 3, N'overloaded', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (48, 12, 4, N'weather-beaten', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (49, 13, 1, N'sustainability', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (50, 13, 2, N'conservation', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (51, 13, 3, N'responsibility', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (52, 13, 4, N'purification', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (53, 14, 1, N'&Oslash /the', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (54, 14, 2, N'&Oslash /an', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (55, 14, 3, N'The/ an', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (56, 14, 4, N'The/ &Oslash', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (57, 15, 1, N'intolerant', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (58, 15, 2, N'supportive', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (59, 15, 3, N'tired', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (60, 15, 4, N'unawar', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (61, 16, 1, N'major', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (62, 16, 2, N'serious', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (63, 16, 3, N'a few', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (64, 16, 4, N'minor', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (65, 17, 1, N'guidance', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (66, 17, 2, N'intensity', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (67, 17, 3, N'flagship', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (68, 17, 4, N'ability', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (69, 18, 1, N'disorganized', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (70, 18, 2, N'successful', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (71, 18, 3, N'connected', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (72, 18, 4, N'updated', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (73, 19, 1, N'carried out', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (74, 19, 2, N'carried over', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (75, 19, 3, N'carried off', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (76, 19, 4, N'carry back', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (77, 20, 1, N'industrialize', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (78, 20, 2, N'industrial', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (79, 20, 3, N'industrialisation', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (80, 20, 4, N'industry', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (81, 21, 1, N'Because', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (82, 21, 2, N'However', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (83, 21, 3, N'Therefore', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (84, 21, 4, N'Although', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (85, 22, 1, N'appearance', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (86, 22, 2, N'plenty', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (87, 22, 3, N'loss', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (88, 22, 4, N'lack', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (89, 23, 1, N'on', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (90, 23, 2, N'about', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (91, 23, 3, N'with', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (92, 23, 4, N'for', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (93, 24, 1, N'a whisky container', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (94, 24, 2, N'a wooden cross', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (95, 24, 3, N'a bonfire made of things people don''t need', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (96, 25, 1, N'a wooden man', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (97, 25, 2, N'a Viking boat', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (98, 25, 3, N'a line in the grass', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (99, 26, 1, N'eat as many pancakes as possible', 0, 1)
GO
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (100, 26, 2, N'run as fast as possible while tossing a pancake in a pan', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (101, 26, 3, N'run and jump over ropes without dropping the pancake', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (102, 27, 1, N'top athletes', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (103, 27, 2, N'people from the village', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (104, 27, 3, N'visitors from all over the world', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (105, 28, 1, N'cooked with garlic and butter', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (106, 28, 2, N'rescued from the barbecue', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (107, 28, 3, N'given a prize of extra lettuce', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (108, 29, 1, N'pancake tossing', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (109, 29, 2, N'Olympic sports like javelin and shotput', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (110, 29, 3, N'bowling', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (111, 30, 1, N'had all his teeth removed', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (112, 30, 2, N'grew a really long beard', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (113, 30, 3, N'had a lot of facial piercings', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (114, 31, 1, N'2 years old', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (115, 31, 2, N'20 years old', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (116, 31, 3, N'200 years old', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (117, 32, 1, N'Good bye', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (118, 32, 2, N'こんにちは', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (119, 32, 3, N'안녕하세요', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (120, 32, 4, N'你好', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (121, 33, 1, N'Apple', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (122, 33, 2, N'オレンジ', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (123, 33, 3, N'사과', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (124, 33, 4, N'Quả táo', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (125, 34, 1, N'Dạng chuẩn 1 (1NF)', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (126, 34, 2, N'Dạng chuẩn 2 (2NF)', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (127, 34, 3, N'Dạng chuẩn 3 (3NF)', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (128, 34, 4, N'Không ở dạng chuẩn nào', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (129, 35, 1, N'Dạng chuẩn 1 (1NF)', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (130, 35, 2, N'Dạng chuẩn 2 (2NF)', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (131, 35, 3, N'Dạng chuẩn 3 (3NF)', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (132, 35, 4, N'Dạng chuẩn Boyce-Codd (BCNF)', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (133, 36, 1, N'Dạng chuẩn 1 (1NF)', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (134, 36, 2, N'Dạng chuẩn 2 (2NF)', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (135, 36, 3, N'Dạng chuẩn 3 (3NF)', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (136, 36, 4, N'Không ở dạng chuẩn nào', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (137, 37, 1, N'Liên quan đến miền giá trị', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (138, 37, 2, N'Liên thuộc tính trên cùng loại quan hệ', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (139, 37, 3, N'Liên thuộc tính liên quan hệ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (140, 37, 4, N'Do thuộc tính tổng hợp', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (141, 38, 1, N'de<u><b>t</b></u>ermine       ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (142, 38, 2, N'cos<u><b>t</b></u>ume     ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (143, 38, 3, N'cul<u><b>t</b></u>ure      ', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (144, 38, 4, N'cri<u><b>t</b></u>ical     ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (145, 39, 1, N'1NF', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (146, 39, 2, N'2NF', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (147, 39, 3, N'3NF', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (148, 39, 4, N'Không ở dạng chuẩn nào', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (149, 40, 1, N'<latex>\forall</latex> h <latex> \exists</latex> HOADON: h.NGAY<=Getdate()', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (150, 40, 2, N'<latex> \exists</latex> h <latex> \exists</latex> HOADON: h.NGAY<=Getdate()', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (151, 40, 3, N'<latex>\forall</latex> h <latex> \exists</latex> HOADON: h.NGAY>=Getdate()', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (152, 40, 4, N'<latex> \exists</latex> h <latex> \exists</latex> HOADON: h.NGAY>=Getdate() ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (153, 41, 1, N'Dạng chuẩn 1 (1NF)', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (154, 41, 2, N'Dạng chuẩn 2 (2NF)', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (155, 41, 3, N'Dạng chuẩn 3 (3NF)', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (156, 41, 4, N'Dạng chuẩn Boyce-Codd (BCNF)', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (157, 42, 1, N'MIN (dạng chuẩn Qi), với Qi là các lược đồ quan hệ của cơ sở dữ liệu', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (158, 42, 2, N'MAX (dạng chuẩn Qi), với Qi là các lược đồ quan hệ của cơ sở dữ liệu', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (159, 42, 3, N'Trung bình (dạng chuẩn Qi), với Qi là các lược đồ quan hệ của cơ sở dữ liệu', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (160, 42, 4, N'Tùy vào quyết định của người phân tích', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (161, 43, 1, N'most', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (162, 43, 2, N'almost ', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (163, 43, 3, N'the most', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (164, 43, 4, N'mostly', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (165, 44, 1, N'widely', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (166, 44, 2, N'hardly', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (167, 44, 3, N'legally', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (168, 44, 4, N'nationally ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (169, 45, 1, N'translated', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (170, 45, 2, N'transferred', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (171, 45, 3, N'transformed', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (172, 45, 4, N'transited', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (173, 46, 1, N'increase ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (174, 46, 2, N'upbringing', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (175, 46, 3, N'rising', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (176, 46, 4, N'grow', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (177, 47, 1, N'dropped in', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (178, 47, 2, N'dropped up ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (179, 47, 3, N'dropped out ', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (180, 47, 4, N'dropped by ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (181, 48, 1, N'hardly', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (182, 48, 2, N'truly', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (183, 48, 3, N'effortlessly ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (184, 48, 4, N'frequently ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (185, 49, 1, N'massly-produced', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (186, 49, 2, N'mass-produced ', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (187, 49, 3, N'massive-produced ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (188, 49, 4, N'mass-producing ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (189, 50, 1, N'Generally', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (190, 50, 2, N'Frankly', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (191, 50, 3, N'Fortunately', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (192, 50, 4, N'Unfortunately', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (193, 51, 1, N'few', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (194, 51, 2, N'a few ', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (195, 51, 3, N'a little', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (196, 51, 4, N'little', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (197, 52, 1, N'was allowing ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (198, 52, 2, N'has allowed ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (199, 52, 3, N'allowed', 1, 1)
GO
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (200, 52, 4, N'had allowed ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (201, 53, 1, N'for', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (202, 53, 2, N'since', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (203, 53, 3, N'during', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (204, 53, 4, N'of ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (205, 54, 1, N'devil', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (206, 54, 2, N'deviation', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (207, 54, 3, N'deviant', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (208, 54, 4, N'device', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (209, 55, 1, N'<latex> x  = \log_{2}{3}.</latex>', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (210, 55, 2, N'<latex> x = \log_{3}{2}.</latex>        ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (211, 55, 3, N'<latex>x = 2^3.</latex>        ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (212, 55, 4, N'<latex>x = 3^2.</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (213, 56, 1, N'<latex> a_{6}^{5}.</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (214, 56, 2, N'<latex> a_{6}^{11}.</latex>', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (215, 56, 3, N'<latex>a_{3}^{10}.</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (216, 56, 4, N'<latex>a_{3}^{7}.</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (217, 57, 1, N'14.865.000 đồng', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (218, 57, 2, N'12.218.000 đồng', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (219, 57, 3, N'14.465.000 đồng', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (220, 57, 4, N'13.265.000 đồng', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (221, 58, 1, N'<latex> \begin{cases}x=t\\y= 0\\z = 0\end{cases}</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (222, 58, 2, N'<latex> \begin{cases}x=0\\y=t\\z = 0\end{cases} </latex>        ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (223, 58, 3, N'<latex> \begin{cases}x=0\\y= t\\z = t\end{cases} </latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (224, 58, 4, N'<latex> \begin{cases}x=0\\y=0\\z=1+t\end{cases} </latex>', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (225, 59, 1, N'V = <latex>12a^{3}\sqrt{3}</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (226, 59, 2, N'V = <latex> 6a^{3}\sqrt{3} </latex>', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (227, 59, 3, N'V = <latex>2a^{3}\sqrt{3}</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (228, 59, 4, N'V = <latex>24a^{3}\sqrt{3}</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (229, 60, 1, N'y = <latex> -x^{4}+2x^{2}</latex>', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (230, 60, 2, N'y = <latex> x^{4}-2x^{2}</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (231, 60, 3, N'y = <latex> x^{4}-2x^{2}+1</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (232, 60, 4, N'y = <latex> -x^{4}+2x^{2}+1</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (233, 61, 1, N'<latex> 20\pi mm</latex> ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (234, 61, 2, N'<latex> 4mm</latex>', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (235, 61, 3, N'<latex>8mm</latex> ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (236, 61, 4, N'<latex> 2\pi mm</latex>', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (237, 62, 1, N'Visit his family', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (238, 62, 2, N'Travel', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (239, 62, 3, N'Buy a new car', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (240, 62, 4, N'Not going anywhere', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (241, 63, 1, N'Ride a bike', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (242, 63, 2, N'Buy a new bike for his daughter', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (243, 63, 3, N'Buy a new furniture', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (244, 63, 4, N'Buy a new car', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (245, 64, 1, N'Spend one month with his grandparents', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (246, 64, 2, N'Go fishing', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (247, 64, 3, N'Read a book', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (248, 64, 4, N'Go to buy some food', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (249, 65, 1, N'Call James', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (250, 65, 2, N'Visit her family for a few days', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (251, 65, 3, N'Read a book', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (252, 65, 4, N'Go fishing', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (253, 66, 1, N'Help his dad', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (254, 66, 2, N'Go to the cinema', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (255, 66, 3, N'Cook piza', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (256, 66, 4, N'Do some housework', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (257, 67, 1, N'Make popcorn', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (258, 67, 2, N'Visit a friend', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (259, 67, 3, N'Go to the beach', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (260, 67, 4, N'Do some homework', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (261, 68, 1, N'Have a shower', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (262, 68, 2, N'Eat dinner with his family', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (263, 68, 3, N'Drive to Tom’s place', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (264, 68, 4, N'Do some housework', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (265, 69, 1, N'Travel together', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (266, 69, 2, N'Go to the pub', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (267, 69, 3, N'Watch a match', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (268, 69, 4, N'Have a date', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (269, 70, 1, N'44,688', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (270, 70, 2, N'46,888', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (271, 70, 3, N'48,686', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (272, 70, 4, N'48,666', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (273, 71, 1, N'8,4 ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (274, 71, 2, N'3,6 ', 1, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (275, 71, 3, N'4,8 ', 0, 1)
INSERT [dbo].[tbl_CauTraLoi] ([MaCauTraLoi], [MaCauHoi], [ThuTu], [NoiDung], [LaDapAn], [HoanVi]) VALUES (276, 71, 4, N'2,3', 0, 1)
SET IDENTITY_INSERT [dbo].[tbl_CauTraLoi] OFF
GO
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 1, 1, 2, N'1234', 2)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 1, 2, 1, N'4321', 7)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 3, 14, N'1243', 12)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 4, 13, N'1234', 15)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 5, 3, N'4123', 20)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 6, 4, N'2341', 24)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 7, 5, N'2341', 27)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 8, 6, N'1243', 31)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 9, 7, N'3412', 33)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 10, 8, N'2413', 38)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 11, 9, N'2413', 42)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 12, 10, N'1243', 48)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 13, 11, N'4123', 50)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 2, 14, 12, N'2314', 53)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 3, 15, 16, N'1234', 58)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 3, 16, 15, N'1234', 64)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 4, 17, 17, N'3214', 65)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 4, 18, 18, N'3412', 70)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 5, 19, 19, N'3214', 73)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 5, 20, 20, N'1234', 77)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 5, 21, 21, N'1234', 82)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 5, 22, 22, N'4123', 88)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 5, 23, 23, N'2314', 92)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 6, 24, 24, N'123', 93)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 6, 25, 26, N'123', 97)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 6, 26, 28, N'213', 100)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 6, 27, 30, N'123', 103)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 6, 28, 31, N'321', 107)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 6, 29, 25, N'123', 108)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 6, 30, 27, N'132', 111)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (1, 6, 31, 29, N'213', 115)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 1, 1, 1, N'1234', 2)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 1, 2, 2, N'4321', 7)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 3, 3, N'1243', 12)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 4, 4, N'1234', 15)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 5, 5, N'4123', 20)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 6, 6, N'2341', 24)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 7, 7, N'2341', 27)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 8, 8, N'1243', 31)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 9, 9, N'3412', 33)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 10, 10, N'2413', 38)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 11, 11, N'2413', 42)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 12, 12, N'1243', 48)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 13, 13, N'4123', 50)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 2, 14, 14, N'2314', 53)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 3, 15, 15, N'1234', 58)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 3, 16, 16, N'1234', 64)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 4, 17, 17, N'3214', 65)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 4, 18, 18, N'3412', 70)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 5, 19, 27, N'3214', 73)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 5, 20, 28, N'1234', 77)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 5, 21, 29, N'1234', 82)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 5, 22, 30, N'4123', 88)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 5, 23, 31, N'2314', 92)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 6, 24, 19, N'123', 93)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 6, 25, 20, N'123', 97)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 6, 26, 21, N'213', 100)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 6, 27, 22, N'123', 103)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 6, 28, 23, N'321', 107)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 6, 29, 24, N'123', 108)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 6, 30, 25, N'132', 111)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (2, 6, 31, 26, N'213', 115)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 1, 1, 31, N'1234', 2)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 1, 2, 30, N'4321', 7)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 3, 29, N'1243', 12)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 4, 28, N'1234', 15)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 5, 27, N'4123', 20)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 6, 26, N'2341', 24)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 7, 25, N'2341', 27)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 8, 24, N'1243', 31)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 9, 23, N'3412', 33)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 10, 22, N'2413', 38)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 11, 21, N'2413', 42)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 12, 20, N'1243', 48)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 13, 19, N'4123', 50)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 2, 14, 18, N'2314', 53)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 3, 15, 17, N'1234', 58)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 3, 16, 16, N'1234', 64)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 4, 17, 15, N'3214', 65)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 4, 18, 14, N'3412', 70)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 5, 19, 9, N'3214', 73)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 5, 20, 10, N'1234', 77)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 5, 21, 11, N'1234', 82)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 5, 22, 12, N'4123', 88)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 5, 23, 13, N'2314', 92)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 6, 24, 8, N'123', 93)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 6, 25, 7, N'123', 97)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 6, 26, 6, N'213', 100)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 6, 27, 5, N'123', 103)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 6, 28, 4, N'321', 107)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 6, 29, 3, N'123', 108)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 6, 30, 2, N'132', 111)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (3, 6, 31, 1, N'213', 115)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 1, 1, 2, N'1234', 2)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 1, 2, 1, N'4321', 7)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 3, 14, N'1243', 12)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 4, 13, N'1234', 15)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 5, 12, N'4123', 20)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 6, 11, N'2341', 24)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 7, 10, N'2341', 27)
GO
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 8, 9, N'1243', 31)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 9, 8, N'3412', 33)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 10, 7, N'2413', 38)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 11, 6, N'2413', 42)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 12, 5, N'1243', 48)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 13, 4, N'4123', 50)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 2, 14, 3, N'2314', 53)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 3, 15, 15, N'1234', 58)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 3, 16, 16, N'1234', 64)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 4, 17, 18, N'3214', 65)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 4, 18, 17, N'3412', 70)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 5, 19, 27, N'3214', 73)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 5, 20, 28, N'1234', 77)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 5, 21, 29, N'1234', 82)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 5, 22, 30, N'4123', 88)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 5, 23, 31, N'2314', 92)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 6, 24, 26, N'123', 93)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 6, 25, 25, N'123', 97)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 6, 26, 19, N'213', 100)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 6, 27, 20, N'123', 103)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 6, 28, 21, N'321', 107)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 6, 29, 22, N'123', 108)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 6, 30, 23, N'132', 111)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (4, 6, 31, 24, N'213', 115)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 7, 32, 10, N'1234', 118)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 7, 33, 9, N'2314', 122)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 8, 34, 1, N'1234', 126)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 8, 35, 24, N'2314', 131)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 8, 36, 23, N'1234', 134)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 8, 37, 25, N'1432', 138)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 9, 38, 27, N'1234', 143)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 10, 39, 37, N'2314', 146)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 10, 40, 36, N'2314', 149)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 10, 41, 35, N'1234', 156)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 10, 42, 38, N'1234', 157)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 43, 11, N'1432', 162)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 44, 12, N'3214', 165)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 45, 13, N'1234', 171)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 46, 14, N'1432', 174)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 47, 15, N'3214', 179)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 48, 16, N'1234', 181)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 49, 17, N'1234', 186)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 50, 18, N'2314', 192)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 51, 19, N'3214', 194)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 52, 20, N'1234', 199)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 53, 21, N'1432', 201)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 12, 54, 22, N'3214', 208)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 13, 55, 30, N'1234', 209)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 13, 56, 31, N'1234', 214)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 13, 57, 33, N'3214', 220)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 13, 58, 34, N'1234', 224)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 13, 59, 28, N'2314', 226)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 13, 60, 32, N'1432', 229)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 13, 61, 29, N'3214', 234)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 14, 62, 3, N'1234', 238)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 14, 63, 7, N'3214', 244)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 14, 64, 2, N'3214', 246)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 14, 65, 6, N'1234', 251)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 14, 66, 4, N'1234', 256)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 14, 67, 1, N'1234', 257)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 14, 68, 8, N'2314', 262)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 14, 69, 5, N'3214', 268)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 15, 70, 40, N'3214', 270)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (5, 15, 71, 39, N'1234', 274)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 7, 32, 1, N'1234', 118)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 7, 33, 2, N'3214', 122)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 8, 34, 38, N'1234', 126)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 8, 35, 40, N'1234', 131)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 8, 36, 37, N'3214', 134)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 8, 37, 39, N'1234', 138)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 9, 38, 34, N'3214', 143)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 10, 39, 25, N'3214', 146)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 10, 40, 22, N'1234', 149)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 10, 41, 24, N'2314', 156)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 10, 42, 23, N'1234', 157)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 43, 10, N'2314', 162)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 44, 11, N'1432', 165)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 45, 12, N'3214', 171)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 46, 13, N'1234', 174)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 47, 14, N'1432', 179)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 48, 15, N'3214', 181)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 49, 16, N'1234', 186)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 50, 17, N'1234', 192)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 51, 18, N'2314', 194)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 52, 19, N'3214', 199)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 53, 20, N'1234', 201)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 12, 54, 21, N'1432', 208)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 13, 55, 4, N'3214', 209)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 13, 56, 3, N'1234', 214)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 13, 57, 7, N'1234', 220)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 13, 58, 5, N'1234', 224)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 13, 59, 6, N'2314', 226)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 13, 60, 8, N'3214', 229)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 13, 61, 9, N'1234', 234)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 14, 62, 29, N'1432', 238)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 14, 63, 28, N'1234', 244)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 14, 64, 31, N'1234', 246)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 14, 65, 27, N'1234', 251)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 14, 66, 32, N'3214', 256)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 14, 67, 26, N'1234', 257)
GO
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 14, 68, 30, N'2314', 262)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 14, 69, 33, N'1432', 268)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 15, 70, 35, N'2314', 270)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (6, 15, 71, 36, N'2314', 274)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 7, 32, 7, N'1234', 118)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 7, 33, 6, N'2314', 122)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 8, 34, 37, N'1234', 126)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 8, 35, 38, N'1234', 131)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 8, 36, 40, N'3214', 134)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 8, 37, 39, N'1234', 138)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 9, 38, 1, N'1234', 143)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 10, 39, 5, N'3214', 146)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 10, 40, 3, N'3214', 149)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 10, 41, 2, N'1234', 156)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 10, 42, 4, N'1234', 157)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 43, 17, N'1234', 162)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 44, 18, N'2314', 165)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 45, 19, N'3214', 171)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 46, 20, N'1234', 174)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 47, 21, N'1432', 179)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 48, 22, N'3214', 181)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 49, 23, N'1234', 186)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 50, 24, N'2314', 192)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 51, 25, N'1234', 194)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 52, 26, N'1432', 199)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 53, 27, N'1234', 201)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 12, 54, 28, N'1234', 208)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 13, 55, 15, N'2314', 209)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 13, 56, 12, N'1432', 214)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 13, 57, 14, N'3214', 220)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 13, 58, 13, N'1234', 224)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 13, 59, 16, N'1432', 226)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 13, 60, 10, N'3214', 229)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 13, 61, 11, N'1234', 234)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 14, 62, 33, N'1234', 238)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 14, 63, 34, N'3214', 244)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 14, 64, 35, N'1234', 246)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 14, 65, 36, N'2314', 251)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 14, 66, 29, N'1432', 256)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 14, 67, 32, N'3214', 257)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 14, 68, 31, N'2314', 262)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 14, 69, 30, N'2314', 268)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 15, 70, 9, N'3214', 270)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (7, 15, 71, 8, N'1234', 274)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 7, 32, 12, N'1432', 118)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 7, 33, 11, N'3214', 122)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 8, 34, 2, N'1234', 126)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 8, 35, 3, N'3214', 131)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 8, 36, 4, N'3214', 134)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 8, 37, 1, N'1234', 138)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 9, 38, 40, N'1234', 143)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 10, 39, 7, N'1234', 146)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 10, 40, 8, N'1234', 149)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 10, 41, 6, N'2314', 156)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 10, 42, 5, N'3214', 157)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 43, 13, N'1234', 162)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 44, 14, N'1432', 165)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 45, 15, N'3214', 171)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 46, 16, N'1234', 174)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 47, 17, N'1234', 179)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 48, 18, N'2314', 181)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 49, 19, N'3214', 186)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 50, 20, N'1234', 192)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 51, 21, N'1432', 194)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 52, 22, N'3214', 199)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 53, 23, N'1234', 201)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 12, 54, 24, N'2314', 208)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 13, 55, 26, N'1234', 209)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 13, 56, 31, N'1432', 214)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 13, 57, 30, N'1234', 220)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 13, 58, 27, N'1234', 224)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 13, 59, 28, N'1234', 226)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 13, 60, 25, N'3214', 229)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 13, 61, 29, N'1234', 234)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 14, 62, 33, N'2314', 238)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 14, 63, 35, N'1432', 244)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 14, 64, 36, N'3214', 246)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 14, 65, 34, N'2314', 251)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 14, 66, 38, N'2314', 256)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 14, 67, 39, N'1234', 257)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 14, 68, 32, N'1234', 262)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 14, 69, 37, N'3214', 268)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 15, 70, 9, N'1234', 270)
INSERT [dbo].[tbl_ChiTietDeThiHoanVi] ([MaDeHV], [MaNhom], [MaCauHoi], [ThuTu], [HoanViTraLoi], [DapAn]) VALUES (8, 15, 71, 10, N'2314', 274)
GO
SET IDENTITY_INSERT [dbo].[tbl_DeThi] ON 

INSERT [dbo].[tbl_DeThi] ([MaDeThi], [MaMonHoc], [TenDeThi], [NgayTao], [NguoiTao], [GhiChu], [LuuTam], [DaDuyet], [TongSoDeHoanVi], [BoChuongPhan]) VALUES (1, 1, N'ĐỀ THI-TIẾNG_ANH-2024_04_12', CAST(N'2024-11-04T00:00:00.000' AS DateTime), -1, NULL, 1, 0, 4, 1)
INSERT [dbo].[tbl_DeThi] ([MaDeThi], [MaMonHoc], [TenDeThi], [NgayTao], [NguoiTao], [GhiChu], [LuuTam], [DaDuyet], [TongSoDeHoanVi], [BoChuongPhan]) VALUES (2, 2, N'ĐỀ THI-TỔNG-HỢP-MÔN-2024_06_19', CAST(N'2024-06-19T00:00:00.000' AS DateTime), -1, NULL, 1, 0, 4, 0)
SET IDENTITY_INSERT [dbo].[tbl_DeThi] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_DeThiHoanVi] ON 

INSERT [dbo].[tbl_DeThiHoanVi] ([MaDeHV], [MaDeThi], [KyHieuDe], [NgayTao], [Guid]) VALUES (1, 1, N'', CAST(N'2024-04-12T00:00:00.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tbl_DeThiHoanVi] ([MaDeHV], [MaDeThi], [KyHieuDe], [NgayTao], [Guid]) VALUES (2, 1, N'', CAST(N'2024-04-12T00:00:00.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tbl_DeThiHoanVi] ([MaDeHV], [MaDeThi], [KyHieuDe], [NgayTao], [Guid]) VALUES (3, 1, N'', CAST(N'2024-04-12T00:00:00.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tbl_DeThiHoanVi] ([MaDeHV], [MaDeThi], [KyHieuDe], [NgayTao], [Guid]) VALUES (4, 1, N'', CAST(N'2024-04-12T00:00:00.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tbl_DeThiHoanVi] ([MaDeHV], [MaDeThi], [KyHieuDe], [NgayTao], [Guid]) VALUES (5, 2, N'', CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[tbl_DeThiHoanVi] ([MaDeHV], [MaDeThi], [KyHieuDe], [NgayTao], [Guid]) VALUES (6, 2, N'', CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'00000000-0000-0000-0000-000000000001')
INSERT [dbo].[tbl_DeThiHoanVi] ([MaDeHV], [MaDeThi], [KyHieuDe], [NgayTao], [Guid]) VALUES (7, 2, N'', CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'00000000-0000-0000-0000-000000000002')
INSERT [dbo].[tbl_DeThiHoanVi] ([MaDeHV], [MaDeThi], [KyHieuDe], [NgayTao], [Guid]) VALUES (8, 2, N'', CAST(N'2024-06-25T00:00:00.000' AS DateTime), N'00000000-0000-0000-0000-000000000003')
SET IDENTITY_INSERT [dbo].[tbl_DeThiHoanVi] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_NhomCauHoi] ON 

INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (1, 1, N'Phần 1: phát âm', N'<b> Mark the letter A, B, C, or D on your answer sheet to indicate the word whose underlined part differs from the other three in pronunciation in each of the following questions.</b>', 2, 0, 1, -1, 2, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (2, 1, N'Phần 2: ngữ pháp', N'<b> Mark the letter A, B, C, or D on your answer sheet to indicate the correct answer to each of the following questions. </b>', 12, 0, 2, -1, 12, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (3, 1, N'Phần 3: từ trái nghĩa', N'<b> Mark the letter A, B, C, or D on your answer sheet to indicate the word(s) OPPOSITE in meaning to the underlined word(s) in each of the following questions.</b>', 2, 0, 3, -1, 2, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (4, 1, N'Phần 4: từ đồng nghĩa', N'<b> Mark the letter A, B, C, or D on your answer sheet to indicate the word(s) CLOSEST in meaning to the underlined word(s) in each of the following questions.</b>', 2, 0, 4, -1, 2, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (5, 1, N'Phần 5: câu hỏi nhóm', N'"<b>Read the following passage and mark the letter A, B, C, or D on your answer sheet to indicate the correct word or phrase that best fits each of the numbered blanks.<b><p>Urbanisation programmes are being ___(28)___ in many parts of the world, especially in densely populated regions with limited land and resources. It is the natural outcome of economic development and ___(29)___.  It has brought a lot of benefits to our society. ___(30)___, it also poses various problems for local authorities and town planners in the process of maintaining sustainable urbanisation, especially in developing countries.</p>
<p>When too many people cram into a small area, urban infrastructure can''t be effective. There will be a ___(31)___ of livable housing, energy and water supply. This will create overcrowded urban districts with no proper facilities.</p>
<p>Currently, fast urbanisation is taking place predominantly in developing countries where sustainable urbanisation has little relevance to people''s lives. Their houses are just shabby slums with poor sanitation. Their children only manage to get basic education. Hence, the struggle for survival is their first priority rather than anything else. Only when the quality of their existence is improved can they seek ___(32)___ other high values in their life.</p>"
', 5, 1, 5, -1, 5, 1)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (6, 1, N'Phần 6: nghe', N'<b>Listen to the presentation about unusual British festivals and choose the correct option to complete the sentence.</b><br/><audio controls><source src="./audio/helloim-going-to-talk-about-b1672025838.mp3"/> </audio>', 8, 1, 6, -1, 8, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (7, 2, N'Chương 1: Ngôn ngữ', N'<b> Mark the letter A, B, C, or D on your answer sheet for pronunciation', 2, 1, 1, -1, 2, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (8, 2, N'Chương 2: Database', N'<b> Mark the letter A, B, C, or D on your answer sheet to indicate the correct answer to each of the following questions "DATABASE". </b>', 4, 1, 2, -1, 4, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (9, 2, N'Chương 3: Phát âm', N'<b> Mark the letter A, B, C, or D on your answer sheet to indicate the word whose underlined part differs from the other three in pronunciation in each of the following questions.</b>', 1, 1, 3, -1, 1, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (10, 2, N'Chương 4: Dạng chuẩn', N'<b> Mark the letter A, B, C, or D on your answer sheet for BCN', 4, 1, 4, -1, 4, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (11, 2, N'Chương 5: Nhóm câu hỏi TA', N'<b>Read the following passage and mark the letter A, B, C or D to indicate the correct word or phrase that best fits each of the numbered blanks.</b>
', 1, 1, 5, -1, 1, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (12, 2, N'Chương 5.1: Nội dung câu hỏi nhóm', N'<p>Nowadays, everybody knows Apples and (*) ____ everybody knows that the company was founded by Steve Jobs, an American inventor and entrepreneur. He is (*) ____ recognized as a pioneer in the field of microcomputer revolution. He helped design the first Macintosh computer, (*) ____ a small computer graphics company into Pixar, the company behind Toy Story and The Monster Inc. </p><p>His countercultural lifestyle and philosophy was a product of the time and place of his (*) ____. Jobs was adopted and raised in San Francisco Bay Area during the 1960s. In 1972, Jobs attended Reed College from which he (*) ____ in next to no time. Jobs co-founded Apple in 1976 in order to sell Apple I personal computer. At that moment, he might (*) ____ imagine that only a year later the company tasted impressive victory with Apple II, one of the first highly successful (*) ____ personal computers. (*) ____, in 1985, following a long power struggle, Jobs was forced out of Apple. After leaving Apple, Jobs took (*) ____ of its members with him to found NeXT, a computer development company which was then bought by Apple. The purchase (*) ____ Jobs to become the company''s CEO once again.</p><p>Steve Jobs died in 2011 after battling with pancreatic cancer (*) ____ nearly a decade. Millions first learned of Job''s death on a (*) ____ which had been invented by himself.</p>
', 12, 0, 6, 11, 12, 1)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (13, 2, N'Chương 6: Toán học', N'<b> Mark the letter A, B, C, or D on your answer sheet', 7, 1, 7, -1, 7, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (14, 2, N'Chương 7: Nghe', N'<b>Listen to the presentation about unusual British festivals and choose the correct option to complete the sentence.</b><br/><audio controls><source src="./audio/What_are_you_going_to_do.mp3"/> </audio>', 8, 1, 8, -1, 8, 0)
INSERT [dbo].[tbl_NhomCauHoi] ([MaNhom], [MaDeThi], [TenNhom], [NoiDung], [SoCauHoi], [HoanVi], [ThuTu], [MaNhomCha], [SoCauLay], [LaCauHoiNhom]) VALUES (15, 2, N'Chương 8: Hóa', N'<b> Mark the letter A, B, C, or D on your answer sheet', 2, 1, 9, -1, 2, 0)
SET IDENTITY_INSERT [dbo].[tbl_NhomCauHoi] OFF
GO
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (1, 1, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (1, 2, 2)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (1, 3, 3)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (1, 4, 4)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (1, 5, 5)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (1, 6, 6)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (2, 1, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (2, 2, 2)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (2, 3, 3)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (2, 4, 4)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (2, 5, 6)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (2, 6, 5)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (3, 1, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (3, 2, 2)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (3, 3, 3)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (3, 4, 4)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (3, 5, 5)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (3, 6, 6)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (4, 1, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (4, 2, 2)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (4, 3, 3)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (4, 4, 4)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (4, 5, 6)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (4, 6, 5)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (5, 7, 2)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (5, 8, 4)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (5, 9, 5)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (5, 10, 7)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (5, 11, 3)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (5, 12, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (5, 13, 6)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (5, 14, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (5, 15, 8)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (6, 7, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (6, 8, 8)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (6, 9, 6)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (6, 10, 4)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (6, 11, 3)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (6, 12, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (6, 13, 2)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (6, 14, 5)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (6, 15, 7)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (7, 7, 3)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (7, 8, 8)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (7, 9, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (7, 10, 2)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (7, 11, 6)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (7, 12, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (7, 13, 5)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (7, 14, 7)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (7, 15, 4)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (8, 7, 4)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (8, 8, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (8, 9, 8)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (8, 10, 2)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (8, 11, 5)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (8, 12, 1)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (8, 13, 6)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (8, 14, 7)
INSERT [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom], [ThuTu]) VALUES (8, 15, 3)
GO
INSERT [dbo].[User] ([UserId], [LoginName], [Email], [Name], [Password], [DateCreated], [IsDeleted], [IsLockedOut], [LastActivityDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPwdAttemptCount], [FailedPwdAttemptWindowStart], [FailedPwdAnswerCount], [FailedPwdAnswerWindowStart], [PasswordSalt], [Comment], [IsBuildInUser]) VALUES (N'47b854c1-1a8d-487a-881b-13c4442de60c', N'khaothi', N'khaothi@examsuite.vn', N'Phòng Kh?o Thí', N'19-A2-85-41-44-B6-3A-8F-76-17-A6-F2-25-01-9B-12', CAST(N'2010-03-25T17:30:18.677' AS DateTime), 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', 1)
INSERT [dbo].[User] ([UserId], [LoginName], [Email], [Name], [Password], [DateCreated], [IsDeleted], [IsLockedOut], [LastActivityDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPwdAttemptCount], [FailedPwdAttemptWindowStart], [FailedPwdAnswerCount], [FailedPwdAnswerWindowStart], [PasswordSalt], [Comment], [IsBuildInUser]) VALUES (N'f4a86e92-737d-4214-b6b2-520a76e71fc2', N'daotao', N'daotao@examsuite.vn', N'Phòng Ц#224;o t?o', N'19-A2-85-41-44-B6-3A-8F-76-17-A6-F2-25-01-9B-12', CAST(N'2010-03-25T17:30:18.677' AS DateTime), 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', 1)
INSERT [dbo].[User] ([UserId], [LoginName], [Email], [Name], [Password], [DateCreated], [IsDeleted], [IsLockedOut], [LastActivityDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPwdAttemptCount], [FailedPwdAttemptWindowStart], [FailedPwdAnswerCount], [FailedPwdAnswerWindowStart], [PasswordSalt], [Comment], [IsBuildInUser]) VALUES (N'21bf922b-cc11-448c-a9c6-c98acab7c085', N'admin', N'admin@examsuite.vn', N'Administrator', N'19-A2-85-41-44-B6-3A-8F-76-17-A6-F2-25-01-9B-12', CAST(N'2010-03-25T17:30:18.677' AS DateTime), 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', 1)
INSERT [dbo].[User] ([UserId], [LoginName], [Email], [Name], [Password], [DateCreated], [IsDeleted], [IsLockedOut], [LastActivityDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPwdAttemptCount], [FailedPwdAttemptWindowStart], [FailedPwdAnswerCount], [FailedPwdAnswerWindowStart], [PasswordSalt], [Comment], [IsBuildInUser]) VALUES (N'3ac347e7-0d07-451d-bbf4-d56370a8804a', N'ttcntt', N'ttcntt@examsuite.vn', N'TT CNTT', N'C3-1A-C6-05-79-3F-58-0B-38-6C-0F-B5-3F-1B-97-75', CAST(N'2010-03-25T17:30:18.677' AS DateTime), 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'', N'', 1)
GO
ALTER TABLE [dbo].[ca_thi] ADD  CONSTRAINT [DF_ca_thi_IsActivated]  DEFAULT ((0)) FOR [IsActivated]
GO
ALTER TABLE [dbo].[ca_thi] ADD  CONSTRAINT [DF_ca_thi_ThoiGianThi]  DEFAULT ((0)) FOR [ThoiGianThi]
GO
ALTER TABLE [dbo].[ca_thi] ADD  CONSTRAINT [DF_ca_thi_KetThuc]  DEFAULT ((0)) FOR [KetThuc]
GO
ALTER TABLE [dbo].[ca_thi] ADD  CONSTRAINT [DF_ca_thi_Approved]  DEFAULT ((0)) FOR [Approved]
GO
ALTER TABLE [dbo].[chi_tiet_bai_thi] ADD  CONSTRAINT [DF_chi_tiet_bai_thi_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[chi_tiet_bai_thi] ADD  CONSTRAINT [DF_chi_tiet_bai_thi_ThuTu]  DEFAULT ((0)) FOR [ThuTu]
GO
ALTER TABLE [dbo].[chi_tiet_ca_thi] ADD  CONSTRAINT [DF_chi_tiet_ca_thi_da_thi]  DEFAULT ((0)) FOR [da_thi]
GO
ALTER TABLE [dbo].[chi_tiet_ca_thi] ADD  CONSTRAINT [DF_chi_tiet_ca_thi_da_hoan_thanh]  DEFAULT ((0)) FOR [da_hoan_thanh]
GO
ALTER TABLE [dbo].[chi_tiet_ca_thi] ADD  CONSTRAINT [DF_chi_tiet_ca_thi_diem]  DEFAULT ((-1)) FOR [diem]
GO
ALTER TABLE [dbo].[chi_tiet_ca_thi] ADD  CONSTRAINT [DF_chi_tiet_ca_thi_tong_so_cau]  DEFAULT ((0)) FOR [tong_so_cau]
GO
ALTER TABLE [dbo].[chi_tiet_ca_thi] ADD  CONSTRAINT [DF_chi_tiet_ca_thi_so_cau_dung]  DEFAULT ((0)) FOR [so_cau_dung]
GO
ALTER TABLE [dbo].[chi_tiet_ca_thi] ADD  CONSTRAINT [DF_chi_tiet_ca_thi_gio_cong_them_1]  DEFAULT ((0)) FOR [gio_cong_them]
GO
ALTER TABLE [dbo].[tbl_AudioListened] ADD  CONSTRAINT [DF_tbl_AudioListened_ListenedCount]  DEFAULT ((0)) FOR [ListenedCount]
GO
ALTER TABLE [dbo].[tbl_CauHoi] ADD  CONSTRAINT [DF_tbl_CauHoi_KieuNoiDung]  DEFAULT ((-1)) FOR [KieuNoiDung]
GO
ALTER TABLE [dbo].[tbl_CauHoi] ADD  CONSTRAINT [DF_tbl_CauHoi_HoanVi]  DEFAULT ((1)) FOR [HoanVi]
GO
ALTER TABLE [dbo].[tbl_CauTraLoi] ADD  CONSTRAINT [DF_tbl_CauTraLoi_MaCauHoi]  DEFAULT ((-1)) FOR [MaCauHoi]
GO
ALTER TABLE [dbo].[tbl_CauTraLoi] ADD  CONSTRAINT [DF_Table_1_ViTri]  DEFAULT ((1)) FOR [ThuTu]
GO
ALTER TABLE [dbo].[tbl_CauTraLoi] ADD  CONSTRAINT [DF_tbl_CauTraLoi_LaDapAn]  DEFAULT ((0)) FOR [LaDapAn]
GO
ALTER TABLE [dbo].[tbl_CauTraLoi] ADD  CONSTRAINT [DF_tbl_CauTraLoi_HoanVi]  DEFAULT ((0)) FOR [HoanVi]
GO
ALTER TABLE [dbo].[tbl_ChiTietDeThi] ADD  CONSTRAINT [DF_tbl_ChiTietDeThi_ThuTu]  DEFAULT ((1)) FOR [ThuTu]
GO
ALTER TABLE [dbo].[tbl_ChiTietDeThiHoanVi] ADD  CONSTRAINT [DF_tbl_ChiTietDeThiHoanVi_ThuTu]  DEFAULT ((1)) FOR [ThuTu]
GO
ALTER TABLE [dbo].[tbl_danhmuc_CaThiTrongNgay] ADD  CONSTRAINT [DF_tbl_danhmuc_CaThiTrongNgay_CaThiCode]  DEFAULT ((-1)) FOR [CaThiCode]
GO
ALTER TABLE [dbo].[tbl_DeThi] ADD  CONSTRAINT [DF_tbl_DeThi_MaMonHoc]  DEFAULT ((-1)) FOR [MaMonHoc]
GO
ALTER TABLE [dbo].[tbl_DeThi] ADD  CONSTRAINT [DF_tbl_DeThi_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[tbl_DeThi] ADD  CONSTRAINT [DF_tbl_DeThi_NguoiTao]  DEFAULT ((-1)) FOR [NguoiTao]
GO
ALTER TABLE [dbo].[tbl_DeThi] ADD  CONSTRAINT [DF_tbl_DeThi_LuuTam]  DEFAULT ((1)) FOR [LuuTam]
GO
ALTER TABLE [dbo].[tbl_DeThi] ADD  CONSTRAINT [DF_tbl_DeThi_DaDuyet]  DEFAULT ((0)) FOR [DaDuyet]
GO
ALTER TABLE [dbo].[tbl_DeThi] ADD  CONSTRAINT [DF_tbl_DeThi_BoChuongPhan_1]  DEFAULT ((0)) FOR [BoChuongPhan]
GO
ALTER TABLE [dbo].[tbl_DeThiHoanVi] ADD  CONSTRAINT [DF_tbl_DeThiHoanVi_MaDeThi]  DEFAULT ((-1)) FOR [MaDeThi]
GO
ALTER TABLE [dbo].[tbl_DeThiHoanVi] ADD  CONSTRAINT [DF_tbl_DeThiHoanVi_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[tbl_NhomCauHoi] ADD  CONSTRAINT [DF_tbl_NhomCauHoi_MaDeThi]  DEFAULT ((-1)) FOR [MaDeThi]
GO
ALTER TABLE [dbo].[tbl_NhomCauHoi] ADD  CONSTRAINT [DF_tbl_NhomCauHoi_SoCauHoi]  DEFAULT ((0)) FOR [SoCauHoi]
GO
ALTER TABLE [dbo].[tbl_NhomCauHoi] ADD  CONSTRAINT [DF_tbl_NhomCauHoi_HoanVi]  DEFAULT ((0)) FOR [HoanVi]
GO
ALTER TABLE [dbo].[tbl_NhomCauHoi] ADD  CONSTRAINT [DF_tbl_NhomCauHoi_MaNhomCha]  DEFAULT ((-1)) FOR [MaNhomCha]
GO
ALTER TABLE [dbo].[tbl_NhomCauHoi] ADD  CONSTRAINT [DF_tbl_NhomCauHoi_SoCauLay_1]  DEFAULT ((-1)) FOR [SoCauLay]
GO
ALTER TABLE [dbo].[tbl_NhomCauHoi] ADD  CONSTRAINT [DF_tbl_NhomCauHoi_LaCauHoiNhom_1]  DEFAULT ((0)) FOR [LaCauHoiNhom]
GO
ALTER TABLE [dbo].[tbl_NhomCauHoiHoanVi] ADD  CONSTRAINT [DF_tbl_NhomHoanVi_ThuTu]  DEFAULT ((1)) FOR [ThuTu]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_Users_IsLockedOut]  DEFAULT ((0)) FOR [IsLockedOut]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_Users_IsBuildInUser]  DEFAULT ((0)) FOR [IsBuildInUser]
GO
ALTER TABLE [dbo].[ca_thi]  WITH CHECK ADD  CONSTRAINT [FK_ca_thi_chi_tiet_dot_thi] FOREIGN KEY([ma_chi_tiet_dot_thi])
REFERENCES [dbo].[chi_tiet_dot_thi] ([ma_chi_tiet_dot_thi])
GO
ALTER TABLE [dbo].[ca_thi] CHECK CONSTRAINT [FK_ca_thi_chi_tiet_dot_thi]
GO
ALTER TABLE [dbo].[chi_tiet_bai_thi]  WITH CHECK ADD  CONSTRAINT [FK_chi_tiet_bai_thi_chi_tiet_ca_thi] FOREIGN KEY([ma_chi_tiet_ca_thi])
REFERENCES [dbo].[chi_tiet_ca_thi] ([ma_chi_tiet_ca_thi])
GO
ALTER TABLE [dbo].[chi_tiet_bai_thi] CHECK CONSTRAINT [FK_chi_tiet_bai_thi_chi_tiet_ca_thi]
GO
ALTER TABLE [dbo].[chi_tiet_ca_thi]  WITH CHECK ADD  CONSTRAINT [FK_chi_tiet_ca_thi_ca_thi] FOREIGN KEY([ma_ca_thi])
REFERENCES [dbo].[ca_thi] ([ma_ca_thi])
GO
ALTER TABLE [dbo].[chi_tiet_ca_thi] CHECK CONSTRAINT [FK_chi_tiet_ca_thi_ca_thi]
GO
ALTER TABLE [dbo].[chi_tiet_ca_thi]  WITH CHECK ADD  CONSTRAINT [FK_chi_tiet_ca_thi_sinh_vien] FOREIGN KEY([ma_sinh_vien])
REFERENCES [dbo].[sinh_vien] ([ma_sinh_vien])
GO
ALTER TABLE [dbo].[chi_tiet_ca_thi] CHECK CONSTRAINT [FK_chi_tiet_ca_thi_sinh_vien]
GO
ALTER TABLE [dbo].[chi_tiet_dot_thi]  WITH CHECK ADD  CONSTRAINT [FK_chi_tiet_dot_thi_dot_thi1] FOREIGN KEY([ma_dot_thi])
REFERENCES [dbo].[dot_thi] ([ma_dot_thi])
GO
ALTER TABLE [dbo].[chi_tiet_dot_thi] CHECK CONSTRAINT [FK_chi_tiet_dot_thi_dot_thi1]
GO
ALTER TABLE [dbo].[chi_tiet_dot_thi]  WITH CHECK ADD  CONSTRAINT [FK_chi_tiet_dot_thi_lop_ao] FOREIGN KEY([ma_lop_ao])
REFERENCES [dbo].[lop_ao] ([ma_lop_ao])
GO
ALTER TABLE [dbo].[chi_tiet_dot_thi] CHECK CONSTRAINT [FK_chi_tiet_dot_thi_lop_ao]
GO
ALTER TABLE [dbo].[lop]  WITH CHECK ADD  CONSTRAINT [FK_lop_khoa] FOREIGN KEY([ma_khoa])
REFERENCES [dbo].[khoa] ([ma_khoa])
GO
ALTER TABLE [dbo].[lop] CHECK CONSTRAINT [FK_lop_khoa]
GO
ALTER TABLE [dbo].[lop_ao]  WITH CHECK ADD  CONSTRAINT [FK_lop_ao_mon_hoc] FOREIGN KEY([ma_mon_hoc])
REFERENCES [dbo].[mon_hoc] ([ma_mon_hoc])
GO
ALTER TABLE [dbo].[lop_ao] CHECK CONSTRAINT [FK_lop_ao_mon_hoc]
GO
ALTER TABLE [dbo].[tbl_CauTraLoi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CauTraLoi_tbl_CauHoi] FOREIGN KEY([MaCauHoi])
REFERENCES [dbo].[tbl_CauHoi] ([MaCauHoi])
GO
ALTER TABLE [dbo].[tbl_CauTraLoi] CHECK CONSTRAINT [FK_tbl_CauTraLoi_tbl_CauHoi]
GO
ALTER TABLE [dbo].[tbl_ChiTietDeThiHoanVi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ChiTietDeThiHoanVi_tbl_NhomCauHoiHoanVi] FOREIGN KEY([MaDeHV], [MaNhom])
REFERENCES [dbo].[tbl_NhomCauHoiHoanVi] ([MaDeHV], [MaNhom])
GO
ALTER TABLE [dbo].[tbl_ChiTietDeThiHoanVi] CHECK CONSTRAINT [FK_tbl_ChiTietDeThiHoanVi_tbl_NhomCauHoiHoanVi]
GO
ALTER TABLE [dbo].[tbl_DeThiHoanVi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_DeThiHoanVi_tbl_DeThi1] FOREIGN KEY([MaDeThi])
REFERENCES [dbo].[tbl_DeThi] ([MaDeThi])
GO
ALTER TABLE [dbo].[tbl_DeThiHoanVi] CHECK CONSTRAINT [FK_tbl_DeThiHoanVi_tbl_DeThi1]
GO
ALTER TABLE [dbo].[tbl_NhomCauHoi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_NhomCauHoi_tbl_DeThi] FOREIGN KEY([MaDeThi])
REFERENCES [dbo].[tbl_DeThi] ([MaDeThi])
GO
ALTER TABLE [dbo].[tbl_NhomCauHoi] CHECK CONSTRAINT [FK_tbl_NhomCauHoi_tbl_DeThi]
GO
ALTER TABLE [dbo].[tbl_NhomCauHoiHoanVi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_NhomCauHoiHoanVi_tbl_DeThiHoanVi] FOREIGN KEY([MaDeHV])
REFERENCES [dbo].[tbl_DeThiHoanVi] ([MaDeHV])
GO
ALTER TABLE [dbo].[tbl_NhomCauHoiHoanVi] CHECK CONSTRAINT [FK_tbl_NhomCauHoiHoanVi_tbl_DeThiHoanVi]
GO
/****** Object:  StoredProcedure [dbo].[ca_thi_Activate]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_Activate]
	@ma_ca_thi [int],
	@IsActivated [bit]
WITH EXECUTE AS CALLER
AS
UPDATE [ca_thi] 
SET
	[IsActivated]	= @IsActivated,
	[ActivatedDate] = getDate()
WHERE
	[ma_ca_thi] = @ma_ca_thi

GO
/****** Object:  StoredProcedure [dbo].[ca_thi_CanInsertStudent]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_CanInsertStudent]
	@MaCaThi [int]
WITH EXECUTE AS CALLER
AS
SELECT	count(*)
					
	FROM	[ca_thi] CT 

	WHERE	CT.ma_ca_thi	= @MaCaThi
		AND	CT.KetThuc		= 0


GO
/****** Object:  StoredProcedure [dbo].[ca_thi_ForceDelete]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_ForceDelete]
	@ma_ca_thi [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [chi_tiet_bai_thi]
WHERE	ma_chi_tiet_ca_thi in(
	SELECT	ma_chi_tiet_ca_thi
	FROM	[chi_tiet_ca_thi] 
	WHERE	[ma_ca_thi] = @ma_ca_thi)

DELETE FROM [chi_tiet_ca_thi]
WHERE [ma_ca_thi] = @ma_ca_thi

DELETE FROM [ca_thi]
WHERE	[ma_ca_thi] = @ma_ca_thi

GO
/****** Object:  StoredProcedure [dbo].[ca_thi_GetAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT	*

FROM	[ca_thi] CT 

LEFT JOIN [chi_tiet_dot_thi] CTDT 
	ON CT.ma_chi_tiet_dot_thi = CTDT.ma_chi_tiet_dot_thi

LEFT JOIN 
	tbl_DeThi DT ON CT.MaDeThi = DT.MaDeThi
GO
/****** Object:  StoredProcedure [dbo].[ca_thi_GetAll1]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_GetAll1]
WITH EXECUTE AS CALLER
AS
SELECT	[ma_ca_thi], [ten_ca_thi], [thoi_gian_bat_dau], [ThoiGianThi], [TenDeThi]

FROM		[ca_thi] CT 

LEFT JOIN	[chi_tiet_dot_thi] CTDT 
	ON		CT.ma_chi_tiet_dot_thi = CTDT.ma_chi_tiet_dot_thi

LEFT JOIN	[tbl_DeThi] DT 
	ON		CT.MaDeThi = DT.MaDeThi



GO
/****** Object:  StoredProcedure [dbo].[ca_thi_GetCount]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_GetCount]
WITH EXECUTE AS CALLER
AS
SELECT	count(*)
					
	FROM	[ca_thi] CT 

	LEFT JOIN [chi_tiet_dot_thi] CTDT 
		ON CT.ma_chi_tiet_dot_thi = CTDT.ma_chi_tiet_dot_thi

	LEFT JOIN 
		tbl_DeThi DT ON CT.MaDeThi = DT.MaDeThi


GO
/****** Object:  StoredProcedure [dbo].[ca_thi_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_Insert]
	@ten_ca_thi [nvarchar](50),
	@ma_chi_tiet_dot_thi [int],
	@thoi_gian_bat_dau [datetime],
	@MaDeThi [int],
	@ThoiGianThi [int]
WITH EXECUTE AS CALLER
AS
IF EXISTS (
	SELECT	* 
	FROM	[ca_thi] 
	WHERE	[ten_ca_thi] = @ten_ca_thi
		and [ma_chi_tiet_dot_thi] = @ma_chi_tiet_dot_thi
)
	set @ten_ca_thi = @ten_ca_thi + '_01'

INSERT INTO [ca_thi] 
(
	[ten_ca_thi],
	[ma_chi_tiet_dot_thi],
	[thoi_gian_bat_dau],
	[MaDeThi],
	--[IsActivated],
	[ThoiGianThi]
) 
VALUES 
(
	@ten_ca_thi,
	@ma_chi_tiet_dot_thi,
	@thoi_gian_bat_dau,
	@MaDeThi,
	--@IsActivated,
	@ThoiGianThi
)

SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [dbo].[ca_thi_IsExists]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_IsExists]
	@MaCaThi [int]
WITH EXECUTE AS CALLER
AS
SELECT	count(*)
					
	FROM	[ca_thi] CT 

	WHERE	CT.ma_ca_thi = @MaCaThi


GO
/****** Object:  StoredProcedure [dbo].[ca_thi_Ketthuc]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_Ketthuc]
	@ma_ca_thi [int]
WITH EXECUTE AS CALLER
AS
IF NOT EXISTS (
	SELECT	* FROM [ca_thi] 
	WHERE	[ma_ca_thi] = @ma_ca_thi
		AND [KetThuc]	= 1)
BEGIN
	UPDATE [ca_thi] 
	SET
		[KetThuc]	= 1,
		[ThoiDiemKetThuc] = getDate()
	WHERE
		[ma_ca_thi] = @ma_ca_thi
END
GO
/****** Object:  StoredProcedure [dbo].[ca_thi_Ketthuc1]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_Ketthuc1]
	@ma_ca_thi [int],
	@is_ket_thuc [bit]
WITH EXECUTE AS CALLER
AS
IF NOT EXISTS (
	SELECT	* FROM [ca_thi] 
	WHERE	[ma_ca_thi] = @ma_ca_thi
		AND [KetThuc]	= @is_ket_thuc)
BEGIN
	UPDATE [ca_thi] 
	SET
		[KetThuc] = @is_ket_thuc,
		[ThoiDiemKetThuc] = getDate()
	WHERE
		[ma_ca_thi] = @ma_ca_thi
END


GO
/****** Object:  StoredProcedure [dbo].[ca_thi_Remove]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_Remove]
	@ma_ca_thi [int]
WITH EXECUTE AS CALLER
AS
IF NOT EXISTS (
	SELECT	bt.* 
	FROM	chi_tiet_bai_thi bt
	JOIN	chi_tiet_ca_thi ctct 
		ON	ctct.ma_chi_tiet_ca_thi = bt.ma_chi_tiet_ca_thi
	WHERE	ctct.ma_ca_thi = @ma_ca_thi
)
BEGIN

	-- chac an thoi, thuc te ko can
	DELETE FROM [chi_tiet_bai_thi]
	WHERE	ma_chi_tiet_ca_thi in(
		SELECT	ma_chi_tiet_ca_thi
		FROM	[chi_tiet_ca_thi] 
		WHERE	[ma_ca_thi] = @ma_ca_thi)

	DELETE FROM [chi_tiet_ca_thi]
	WHERE [ma_ca_thi] = @ma_ca_thi

	DELETE FROM [ca_thi]
	WHERE	[ma_ca_thi] = @ma_ca_thi

END
GO
/****** Object:  StoredProcedure [dbo].[ca_thi_SelectBy_ma_chi_tiet_dot_thi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_SelectBy_ma_chi_tiet_dot_thi]
	@ma_chi_tiet_dot_thi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT *, (select COUNT(ma_chi_tiet_ca_thi) from chi_tiet_ca_thi ctct where ctct.ma_ca_thi = CT.ma_ca_thi) as 'SoLuongSinhVien'
FROM ca_thi CT
LEFT JOIN [chi_tiet_dot_thi] CTDT ON CT.ma_chi_tiet_dot_thi=CTDT.ma_chi_tiet_dot_thi 
LEFT JOIN tbl_DeThi DT ON CT.MaDeThi = DT.MaDeThi
WHERE CT.ma_chi_tiet_dot_thi = @ma_chi_tiet_dot_thi
GO
/****** Object:  StoredProcedure [dbo].[ca_thi_SelectBy_MaDotThi_MaLop]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_SelectBy_MaDotThi_MaLop]
	@ma_dot_thi [int] = NULL,
	@ma_lop [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	ct.* 

FROM	[dbo].[ca_thi] ct 

JOIN	[dbo].[chi_tiet_dot_thi] ctdt 
	ON	ct.[ma_chi_tiet_dot_thi]	= ctdt.[ma_chi_tiet_dot_thi] 

JOIN	[dbo].[dot_thi] dt 
	ON	dt.[ma_dot_thi]	= ctdt.ma_dot_thi

JOIN	[dbo].[lop_ao] la 
	ON	la.[ma_lop_ao]	= ctdt.ma_lop_ao

WHERE	dt.ma_dot_thi	= @ma_dot_thi 
	AND la.[ma_lop_ao]	= @ma_lop

GO
/****** Object:  StoredProcedure [dbo].[ca_thi_SelectByMonHoc]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_SelectByMonHoc]
	@ma_mon_hoc [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	* 
	FROM	ca_thi ct

	LEFT JOIN [chi_tiet_dot_thi] ctdt
	ON	ct.ma_chi_tiet_dot_thi = ctdt.ma_chi_tiet_dot_thi 

	LEFT JOIN [lop_ao] la
	ON	la.ma_lop_ao = ctdt.ma_lop_ao

	WHERE la.ma_mon_hoc = @ma_mon_hoc


GO
/****** Object:  StoredProcedure [dbo].[ca_thi_SelectByMonThi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_SelectByMonThi]
	@ma_mon_hoc [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	* 
	FROM	ca_thi ct

	LEFT JOIN [chi_tiet_dot_thi] ctdt
	ON	ct.ma_chi_tiet_dot_thi = ctdt.ma_chi_tiet_dot_thi 

	LEFT JOIN [lop_ao] la
	ON	la.ma_lop_ao = ctdt.ma_lop_ao

	WHERE la.ma_mon_hoc = @ma_mon_hoc


GO
/****** Object:  StoredProcedure [dbo].[ca_thi_SelectCongGioMax]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_SelectCongGioMax]
	@ma_ca_thi [int]
WITH EXECUTE AS CALLER
AS
SELECT	'GIO_CONG_THEM_MAX' = MAX([gio_cong_them]) 
FROM	[chi_tiet_ca_thi] ctct
WHERE	[ma_ca_thi] = @ma_ca_thi
 

GO
/****** Object:  StoredProcedure [dbo].[ca_thi_SelectKetThuc]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_SelectKetThuc]
	@ma_ca_thi [int]
WITH EXECUTE AS CALLER
AS
IF EXISTS (	
		SELECT	*
		FROM	[ca_thi]
		WHERE	[ma_ca_thi] = @ma_ca_thi			
			AND [KetThuc]	= 1
	)
SELECT 1
ELSE
SELECT 0




GO
/****** Object:  StoredProcedure [dbo].[ca_thi_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_SelectOne]
	@ma_ca_thi [int]
WITH EXECUTE AS CALLER
AS
SELECT *
FROM
	[ca_thi]
WHERE
	[ma_ca_thi] = @ma_ca_thi

GO
/****** Object:  StoredProcedure [dbo].[ca_thi_SelectPage]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_SelectPage]
	@PageNumber [int],
	@PageSize [int]
WITH EXECUTE AS CALLER
AS
DECLARE @PageLowerBound int
DECLARE @PageUpperBound int


SET @PageLowerBound = (@PageSize * @PageNumber) - @PageSize
SET @PageUpperBound = @PageLowerBound + @PageSize + 1


CREATE TABLE #PageIndex 
(
	IndexID int IDENTITY (1, 1) NOT NULL,
	ma_ca_thi int
)

BEGIN

	INSERT INTO #PageIndex ( 
		ma_ca_thi
	)

	SELECT	[ma_ca_thi]
					
	FROM	[ca_thi] CT 

	LEFT JOIN [chi_tiet_dot_thi] CTDT 
		ON CT.ma_chi_tiet_dot_thi = CTDT.ma_chi_tiet_dot_thi

	LEFT JOIN 
		tbl_DeThi DT ON CT.MaDeThi = DT.MaDeThi

	ORDER BY [IsActivated], [thoi_gian_bat_dau] desc,  [ten_ca_thi]
END


SELECT	*

FROM	[ca_thi] CT 

LEFT JOIN [chi_tiet_dot_thi] CTDT 
	ON CT.ma_chi_tiet_dot_thi = CTDT.ma_chi_tiet_dot_thi

LEFT JOIN 
	tbl_DeThi DT ON CT.MaDeThi = DT.MaDeThi

JOIN	#PageIndex t2
ON			
		CT.[ma_ca_thi] = t2.[ma_ca_thi]
		
WHERE
		t2.IndexID > @PageLowerBound 
		AND t2.IndexID < @PageUpperBound
		
ORDER BY t2.IndexID

DROP TABLE #PageIndex


GO
/****** Object:  StoredProcedure [dbo].[ca_thi_SelectPaged]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_SelectPaged]
	@ma_dot_thi [int],
	@ma_mon_hoc [int],
	@ma_lop_ao [int],
	@lan_thi [nvarchar](200)
WITH EXECUTE AS CALLER
AS
SELECT		CT.[ma_ca_thi], 
			CT.[ten_ca_thi], 
			CT.[thoi_gian_bat_dau], 
			CT.[ThoiGianThi], 
			DT.[TenDeThi]

FROM		[dbo].[ca_thi] CT

LEFT JOIN	[dbo].[chi_tiet_dot_thi] CTDT 
	ON		CT.[ma_chi_tiet_dot_thi] = CTDT.[ma_chi_tiet_dot_thi]

LEFT JOIN	[dbo].[lop_ao] la
	ON		la.[ma_lop_ao] = CTDT.[ma_lop_ao]

LEFT JOIN	[dbo].[tbl_DeThi] DT 
	ON		CT.[MaDeThi] = DT.[MaDeThi]

WHERE	(	CTDT.[ma_dot_thi]	= @ma_dot_thi)
	AND	(	la.[ma_mon_hoc]		= @ma_mon_hoc
		OR	@ma_mon_hoc = -1 OR	@ma_mon_hoc IS NULL)
	AND	(	CTDT.[ma_lop_ao]	= @ma_lop_ao
		OR	@ma_lop_ao = -1 OR	@ma_lop_ao IS NULL)
	AND	(	CTDT.[lan_thi]	= @lan_thi
		OR	@lan_thi = N'Tt c' OR	@lan_thi IS NULL)
GO
/****** Object:  StoredProcedure [dbo].[ca_thi_SelectResult]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_SelectResult]
	@ma_ca_thi [int]
WITH EXECUTE AS CALLER
AS
SELECT	'MaDeThi'		= ctct.ma_de_thi,
		'DiemThi'		= ctct.diem,
		'DaThi'			= ctct.da_thi,
		'DaHoanThanh'	= ctct.da_hoan_thanh,
		'TenCaThi'		= ct.ten_ca_thi,
		'NgayThi'		= ct.thoi_gian_bat_dau,
		'ThoiLuongThi'	= ct.ThoiGianThi,
		'MSSV'			= sv.ma_so_sinh_vien,
		'Ho'			= sv.ho_va_ten_lot,
		'Ten'			= sv.ten_sinh_vien,
		'GioiTinh'		= sv.gioi_tinh,
		'SoCauDung'		= ctct.so_cau_dung,
		'TongSoCau'		= ctct.tong_so_cau
		--,'NgaySinh'		= sv.ngay_sinh

FROM	[chi_tiet_ca_thi] ctct

LEFT OUTER JOIN [ca_thi] ct
	ON	ctct.[ma_ca_thi] = ct.[ma_ca_thi] 

LEFT OUTER JOIN [sinh_vien] sv
	ON	ctct.[ma_sinh_vien] = sv.[ma_sinh_vien] 

WHERE	ctct.[ma_ca_thi] = @ma_ca_thi

ORDER BY	sv.[ten_sinh_vien], sv.[ho_va_ten_lot]
GO
/****** Object:  StoredProcedure [dbo].[ca_thi_SelectRunning]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_SelectRunning]
WITH EXECUTE AS CALLER
AS
SELECT	*

FROM	[ca_thi] ct

LEFT JOIN	[chi_tiet_dot_thi] ctdt 
	ON	ct.[ma_chi_tiet_dot_thi] = ctdt.[ma_chi_tiet_dot_thi]

LEFT JOIN	[tbl_DeThi] dt 
	ON	ct.MaDeThi			= dt.MaDeThi

WHERE	ct.[IsActivated]	= 1
	AND	ct.[KetThuc]		= 0
GO
/****** Object:  StoredProcedure [dbo].[ca_thi_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_Update]
	@ma_ca_thi [int],
	@ten_ca_thi [nvarchar](50),
	@ma_chi_tiet_dot_thi [int],
	@thoi_gian_bat_dau [datetime],
	@MaDeThi [int],
	@ThoiGianThi [int]
WITH EXECUTE AS CALLER
AS
UPDATE [ca_thi] 
SET
	[ten_ca_thi] = @ten_ca_thi,
	[ma_chi_tiet_dot_thi] = @ma_chi_tiet_dot_thi,
	[thoi_gian_bat_dau] = @thoi_gian_bat_dau,
	[MaDeThi] = @MaDeThi,
	--[IsActivated ]=@IsActivated,
	[ThoiGianThi]=@ThoiGianThi
WHERE
	[ma_ca_thi] = @ma_ca_thi

GO
/****** Object:  StoredProcedure [dbo].[ca_thi_UpdateApproved]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ca_thi_UpdateApproved]
	@ma_ca_thi [int],
	@Approved [bit],
	@ApprovedDate [datetime],
	@ApprovedComments [nvarchar](500)
WITH EXECUTE AS CALLER
AS
UPDATE [ca_thi] 
SET
	Approved = @Approved,
	ApprovedDate = @ApprovedDate,
	ApprovedComments = @ApprovedComments
WHERE
	[ma_ca_thi] = @ma_ca_thi

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bai_thi_Delete]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_bai_thi_Delete]
	@MaChiTietBaiThi [bigint]
WITH EXECUTE AS CALLER
AS
DELETE FROM [chi_tiet_bai_thi]
WHERE
	[MaChiTietBaiThi] = @MaChiTietBaiThi

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bai_thi_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_bai_thi_Insert]
	@ma_chi_tiet_ca_thi [int],
	@MaDeHV [bigint],
	@MaNhom [int],
	@MaCauHoi [int],
	@NgayTao [datetime],
	@ThuTu [int]
WITH EXECUTE AS CALLER
AS
-- kiem tra ton tai
if not exists (select * from [chi_tiet_bai_thi]
	where	[ma_chi_tiet_ca_thi] = @ma_chi_tiet_ca_thi
		and [MaDeHV]	= @MaDeHV
		and [MaNhom]	= @MaNhom
		and [MaCauHoi]	= @MaCauHoi)
begin
	INSERT INTO [chi_tiet_bai_thi] 
	(
		[ma_chi_tiet_ca_thi],
		[MaDeHV],
		[MaNhom],
		[MaCauHoi],
		[NgayTao],
		[ThuTu]
	) 
	VALUES 
	(
		@ma_chi_tiet_ca_thi,
		@MaDeHV,
		@MaNhom,
		@MaCauHoi,
		@NgayTao,
		@ThuTu
	)
end

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bai_thi_SelectAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_bai_thi_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[chi_tiet_bai_thi]


GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bai_thi_SelectBy_ma_chi_tiet_ca_thi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_bai_thi_SelectBy_ma_chi_tiet_ca_thi]
	@ma_chi_tiet_ca_thi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	bt.* 
FROM	chi_tiet_bai_thi bt

--left outer join tbl_NhomCauHoiHoanVi nhv
--	on nhv.MaDeHV = bt.MaDeHV
--	and nhv.MaNhom = bt.MaNhom
--	and nhv.MaNhom in(
--		select MaNhom from tbl_NhomCauHoi
--		where MaNhomCha = -1 or MaNhomCha is null)
	
--left outer join tbl_NhomCauHoiHoanVi nhv2
--	on nhv2.MaDeHV = bt.MaDeHV
--	and nhv2.MaNhom = bt.MaNhom
--	and nhv2.MaNhom not in(
--		select MaNhom from tbl_NhomCauHoi
--		where MaNhomCha = -1 or MaNhomCha is null)

--left outer join tbl_ChiTietDeThiHoanVi cthv
--	on cthv.MaDeHV = bt.MaDeHV
--	and cthv.MaNhom = bt.MaNhom
--	and cthv.MaCauHoi = bt.MaCauHoi

WHERE	 bt.ma_chi_tiet_ca_thi = @ma_chi_tiet_ca_thi
			
order by bt.ThuTu--	nhv.ThuTu, nhv2.ThuTu, cthv.ThuTu
GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bai_thi_SelectBy_ma_chi_tiet_ca_thi_Count]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_bai_thi_SelectBy_ma_chi_tiet_ca_thi_Count]
	@ma_chi_tiet_ca_thi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT		count(*)

	FROM		chi_tiet_bai_thi

	WHERE		ma_chi_tiet_ca_thi = @ma_chi_tiet_ca_thi


GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bai_thi_SelectBy_ma_chi_tiet_ca_thi_Paged]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_bai_thi_SelectBy_ma_chi_tiet_ca_thi_Paged]
	@ma_chi_tiet_ca_thi [int] = NULL,
	@PageSize [int] = 10,
	@PageNumber [int] = 1
WITH EXECUTE AS CALLER
AS
DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	SET @PageLowerBound = (@PageSize * @PageNumber) - @PageSize
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	create TABLE #PageIndex
	(
		IndexID int IDENTITY (1, 1) NOT NULL,
		MaChiTietBaiThi bigint
	)

	BEGIN

	INSERT INTO #PageIndex 
	(
		MaChiTietBaiThi
	)

	SELECT		MaChiTietBaiThi

	FROM		chi_tiet_bai_thi

	WHERE		ma_chi_tiet_ca_thi = @ma_chi_tiet_ca_thi

	ORDER BY	ThuTu

	END

	DECLARE @TotalRows int
	DECLARE @TotalPages int
	DECLARE @Remainder int

	SET @TotalRows = (SELECT Count(*) FROM #PageIndex)
	SET @TotalPages = @TotalRows / @PageSize
	SET @Remainder = @TotalRows % @PageSize
	IF	@Remainder > 0
	SET @TotalPages = @TotalPages + 1

	SELECT
			t.*,
			'STT' = t2.IndexID
	FROM
			[dbo].chi_tiet_bai_thi t

	JOIN	#PageIndex t2
	ON		t.MaChiTietBaiThi = t2.MaChiTietBaiThi

	WHERE
			t2.IndexID > @PageLowerBound
		AND t2.IndexID < @PageUpperBound
			
	ORDER BY t2.IndexID

	DROP TABLE #PageIndex

			
			
GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bai_thi_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_bai_thi_SelectOne]
	@MaChiTietBaiThi [bigint]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[chi_tiet_bai_thi]
WHERE
	[MaChiTietBaiThi] = @MaChiTietBaiThi


GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bai_thi_SelectOne_v2]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_bai_thi_SelectOne_v2]
	@ma_chi_tiet_ca_thi [int],
	@MaDeHV [bigint],
	@MaNhom [int],
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
SELECT 	bt.*,
		dt.HoanViTraLoi,
		dt.DapAn
		
FROM	[chi_tiet_bai_thi] bt

LEFT OUTER JOIN [tbl_ChiTietDeThiHoanVi] dt
	ON dt.MaDeHV = bt.MaDeHV 

WHERE
	bt.ma_chi_tiet_ca_thi	= @ma_chi_tiet_ca_thi
AND	bt.MaDeHV				= @MaDeHV
AND bt.MaNhom				= @MaNhom
AND bt.MaCauHoi				= @MaCauHoi


GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_bai_thi_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_bai_thi_Update]
	@MaChiTietBaiThi [bigint],
	@CauTraLoi [int],
	@NgayCapNhat [datetime],
	@KetQua [bit]
WITH EXECUTE AS CALLER
AS
UPDATE [chi_tiet_bai_thi] 
SET
	[CauTraLoi]		= @CauTraLoi,
	[NgayCapNhat]	= @NgayCapNhat,
	[KetQua]		= @KetQua
	--[ThuTu]			= @ThuTu
WHERE
	[MaChiTietBaiThi] = @MaChiTietBaiThi
 

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_CongGio]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_CongGio]
	@ma_chi_tiet_ca_thi [int],
	@gio_cong_them [int],
	@thoi_diem_cong [datetime],
	@ly_do_cong [nvarchar](max)
WITH EXECUTE AS CALLER
AS
UPDATE [chi_tiet_ca_thi] 
SET
	[gio_cong_them] = @gio_cong_them,
	[thoi_diem_cong] = @thoi_diem_cong,
	[ly_do_cong] = @ly_do_cong
WHERE
	[ma_chi_tiet_ca_thi] = @ma_chi_tiet_ca_thi
 


GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_GetAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[chi_tiet_ca_thi] CTCT JOIN [sinh_vien] SV ON CTCT.ma_sinh_vien = SV.ma_sinh_vien
	JOIN [ca_thi] CT ON CTCT.ma_ca_thi = CT.ma_ca_thi


GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_Insert]
	@ma_ca_thi [int],
	@ma_sinh_vien [bigint],
	@ma_de_thi [bigint],
	@tong_so_cau [int]
WITH EXECUTE AS CALLER
AS
INSERT INTO [chi_tiet_ca_thi] 
(
	[ma_ca_thi],
	[ma_sinh_vien],
	[ma_de_thi],
	[tong_so_cau]
) 
VALUES 
(
	@ma_ca_thi,
	@ma_sinh_vien,
	@ma_de_thi,
	@tong_so_cau
)

SELECT @@IDENTITY




GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_Remove]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_Remove]
	@ma_chi_tiet_ca_thi [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [chi_tiet_ca_thi]
WHERE
	[ma_chi_tiet_ca_thi] = @ma_chi_tiet_ca_thi



GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_Select_GioCongThem]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_Select_GioCongThem]
	@ma_chi_tiet_ca_thi [int]
WITH EXECUTE AS CALLER
AS
SELECT	[gio_cong_them]
FROM	[chi_tiet_ca_thi]
WHERE	[ma_chi_tiet_ca_thi] = @ma_chi_tiet_ca_thi




GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi]
	@ma_ca_thi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	* 
FROM	[chi_tiet_ca_thi] CTCT 

JOIN	[sinh_vien] SV 
	ON	CTCT.ma_sinh_vien = SV.ma_sinh_vien

JOIN	[ca_thi] CT 
	ON	CTCT.ma_ca_thi = CT.ma_ca_thi

WHERE CTCT.ma_ca_thi = @ma_ca_thi


GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi_Count]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi_Count]
	@ma_ca_thi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	count(*)

	FROM	[chi_tiet_ca_thi]

	WHERE	[ma_ca_thi] = @ma_ca_thi


GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi_CountForSearch]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi_CountForSearch]
	@ma_ca_thi [int] = NULL,
	@Keyword [nvarchar](100)
WITH EXECUTE AS CALLER
AS
SELECT	count(CTCT.[ma_chi_tiet_ca_thi])

	FROM	[chi_tiet_ca_thi] CTCT

	JOIN	[sinh_vien] sv
		ON	CTCT.ma_sinh_vien = sv.ma_sinh_vien

	WHERE	[ma_ca_thi] = @ma_ca_thi
		AND (
			sv.[ma_so_sinh_vien] LIKE '%' + @Keyword + '%'
		OR sv.[ten_sinh_vien] LIKE '%' + @Keyword + '%'
		OR sv.[ho_va_ten_lot] LIKE '%' + @Keyword + '%')

	

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi_Paged]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi_Paged]
	@ma_ca_thi [int] = NULL,
	@PageNumber [int] = 1,
	@PageSize [int] = 20
WITH EXECUTE AS CALLER
AS
DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	SET @PageLowerBound = (@PageSize * @PageNumber) - @PageSize
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	create TABLE #PageIndex
	(
		IndexID int IDENTITY (1, 1) NOT NULL,
		MaChiTietCaThi int
	)

	BEGIN

	INSERT INTO #PageIndex 
	(
		MaChiTietCaThi
	)

	SELECT	[ma_chi_tiet_ca_thi]

	FROM	[chi_tiet_ca_thi]

	WHERE	[ma_ca_thi] = @ma_ca_thi

	END


	DECLARE @Remainder int
	DECLARE @TotalPages int
	DECLARE @TotalRecords int
	
	SET @TotalRecords = (SELECT Count(*) FROM #PageIndex)
	SET @TotalPages = @TotalRecords / @PageSize
	SET @Remainder = @TotalRecords % @PageSize
	IF	@Remainder > 0
	SET @TotalPages = @TotalPages + 1

	SELECT	CTCT.*, SV.*, CT.*,
			'STT'=t2.IndexID

	FROM	[chi_tiet_ca_thi] CTCT

	JOIN	[sinh_vien] SV 
		ON	CTCT.ma_sinh_vien = SV.ma_sinh_vien

	JOIN	[ca_thi] CT 
		ON	CTCT.ma_ca_thi = CT.ma_ca_thi

	JOIN	#PageIndex t2
	ON		CTCT.[ma_chi_tiet_ca_thi] = t2.MaChiTietCaThi

	WHERE
			t2.IndexID > @PageLowerBound
		AND t2.IndexID < @PageUpperBound
			
	ORDER BY SV.ma_so_sinh_vien, t2.IndexID

	DROP TABLE #PageIndex

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi_Search_Paged]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi_Search_Paged]
	@ma_ca_thi [int] = NULL,
	@Keyword [nvarchar](100),
	@PageNumber [int] = 1,
	@PageSize [int] = 20
WITH EXECUTE AS CALLER
AS
DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	SET @PageLowerBound = (@PageSize * @PageNumber) - @PageSize
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	create TABLE #PageIndex
	(
		IndexID int IDENTITY (1, 1) NOT NULL,
		MaChiTietCaThi int
	)

	BEGIN

	INSERT INTO #PageIndex 
	(
		MaChiTietCaThi
	)

	SELECT	CTCT.[ma_chi_tiet_ca_thi]

	FROM	[chi_tiet_ca_thi] CTCT

	JOIN	[sinh_vien] sv
		ON	CTCT.ma_sinh_vien = sv.ma_sinh_vien

	WHERE	[ma_ca_thi] = @ma_ca_thi
		AND (
			sv.[ma_so_sinh_vien] LIKE '%' + @Keyword + '%'
		OR sv.[ten_sinh_vien] LIKE '%' + @Keyword + '%'
		OR sv.[ho_va_ten_lot] LIKE '%' + @Keyword + '%')

	END


	DECLARE @Remainder int
	DECLARE @TotalPages int
	DECLARE @TotalRecords int
	
	SET @TotalRecords = (SELECT Count(*) FROM #PageIndex)
	SET @TotalPages = @TotalRecords / @PageSize
	SET @Remainder = @TotalRecords % @PageSize
	IF	@Remainder > 0
	SET @TotalPages = @TotalPages + 1

	SELECT	CTCT.*, SV.*, CT.*,
			'STT'=t2.IndexID

	FROM	[chi_tiet_ca_thi] CTCT

	JOIN	[sinh_vien] SV 
		ON	CTCT.ma_sinh_vien = SV.ma_sinh_vien

	JOIN	[ca_thi] CT 
		ON	CTCT.ma_ca_thi = CT.ma_ca_thi

	JOIN	#PageIndex t2
	ON		CTCT.[ma_chi_tiet_ca_thi] = t2.MaChiTietCaThi

	WHERE
			t2.IndexID > @PageLowerBound
		AND t2.IndexID < @PageUpperBound
			
	ORDER BY SV.ma_so_sinh_vien, t2.IndexID

	DROP TABLE #PageIndex

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi1]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_SelectBy_ma_ca_thi1]
	@ma_ca_thi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	ma_so_sinh_vien, 
		ho_va_ten_lot, 
		ten_sinh_vien 
FROM	chi_tiet_ca_thi CTCT 
JOIN	[sinh_vien] SV 
	ON	CTCT.ma_sinh_vien = SV.ma_sinh_vien
JOIN	[ca_thi] CT 
	ON	CTCT.ma_ca_thi = CT.ma_ca_thi
WHERE	CTCT.ma_ca_thi = @ma_ca_thi
GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_SelectBy_ma_de_thi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_SelectBy_ma_de_thi]
	@ma_de_thi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	ctct.*,
		--dethi.MaDeThi,
		ct.ten_ca_thi,
		ct.ThoiGianThi,
		'ThoiDiemKichHoat' = ct.ActivatedDate,
		mon.ten_mon_hoc

FROM
	[chi_tiet_ca_thi] ctct

LEFT OUTER JOIN [ca_thi] ct
	ON	ct.ma_ca_thi = ctct.ma_ca_thi 
	
LEFT OUTER JOIN	[tbl_DeThi] dethi 
	ON	dethi.MaDeThi			= CT.MaDeThi

LEFT OUTER JOIN	[mon_hoc] mon 
	ON	dethi.MaMonHoc			= mon.ma_mon_hoc
	
WHERE ctct.ma_de_thi = @ma_de_thi




GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_SelectBy_ma_sinh_vien]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_SelectBy_ma_sinh_vien]
	@ma_sinh_vien [bigint] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	ctct.*,
		--dethi.MaDeThi,
		ct.ten_ca_thi,
		ct.ThoiGianThi,
		'ThoiDiemKichHoat' = ct.ActivatedDate,
		mon.ten_mon_hoc

FROM
	[chi_tiet_ca_thi] ctct

LEFT OUTER JOIN [ca_thi] ct
	ON	ct.ma_ca_thi = ctct.ma_ca_thi 
	
LEFT OUTER JOIN	[tbl_DeThi] dethi 
	ON	dethi.MaDeThi			= CT.MaDeThi

LEFT OUTER JOIN	[mon_hoc] mon 
	ON	dethi.MaMonHoc			= mon.ma_mon_hoc
	
WHERE ctct.ma_sinh_vien = @ma_sinh_vien

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_SelectBy_MaCaThi_MaSinhVien]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_SelectBy_MaCaThi_MaSinhVien]
	@ma_ca_thi [int] = NULL,
	@ma_sinh_vien [bigint] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	ctct.*,
		--dethi.MaDeThi,
		ct.ten_ca_thi,
		ct.ThoiGianThi,
		'ThoiDiemKichHoat' = ct.ActivatedDate,
		mon.ten_mon_hoc

FROM
	[chi_tiet_ca_thi] ctct

LEFT OUTER JOIN [ca_thi] ct
	ON	ct.ma_ca_thi = ctct.ma_ca_thi 
	
LEFT OUTER JOIN	[tbl_DeThi] dethi 
	ON	dethi.MaDeThi			= CT.MaDeThi

LEFT OUTER JOIN	[mon_hoc] mon 
	ON	dethi.MaMonHoc			= mon.ma_mon_hoc
	
WHERE	ctct.ma_ca_thi		= @ma_ca_thi 
	AND ctct.ma_sinh_vien	= @ma_sinh_vien
			
	
GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_SelectBy_MaSinhVienThi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_SelectBy_MaSinhVienThi]
	@ma_sinh_vien [bigint] = NULL,
	@ngay_hien_tai [datetime] = NULL
WITH EXECUTE AS CALLER
AS
SELECT 	CTCT.*,
		CT.ten_ca_thi,
		CT.ThoiGianThi,
		CT.thoi_gian_bat_dau,
		CT.ActivatedDate,
		'ThoiDiemKichHoat' = ct.ActivatedDate,
		CT.ThoiGianThi,
		mon.ten_mon_hoc

FROM	[chi_tiet_ca_thi] CTCT 

LEFT OUTER JOIN	[ca_thi] CT 
	ON	CTCT.ma_ca_thi			= CT.ma_ca_thi

LEFT OUTER JOIN	[tbl_DeThi] dethi 
	ON	dethi.MaDeThi			= CT.MaDeThi

LEFT OUTER JOIN	[mon_hoc] mon 
	ON	dethi.MaMonHoc			= mon.ma_mon_hoc

WHERE	CTCT.ma_sinh_vien		= @ma_sinh_vien 
	--AND year(CT.thoi_gian_bat_dau)	= year(@ngay_hien_tai)
	--AND month(CT.thoi_gian_bat_dau) = month(@ngay_hien_tai)
	--AND day(CT.thoi_gian_bat_dau)	= day(@ngay_hien_tai)
	--AND (@ngay_hien_tai between CT.thoi_gian_bat_dau and  CT.thoi_gian_ket_thuc)
	AND CT.KetThuc				= 0 -- ca thi chua ket thuc	
	----AND CT.thoi_gian_bat_dau	<= @ngay_hien_tai  
	AND CT.IsActivated			= 1 -- da kich hoat
	AND	CTCT.da_hoan_thanh		= 0 -- chua thi xong
	--AND DATEADD(MINUTE, CT.ThoiGianThi, CT.ActivatedDate) >= GETDATE() -- Chưa hết giờ
	AND (CTCT.thoi_gian_bat_dau IS NULL
		OR DATEADD(MINUTE, CT.ThoiGianThi, CTCT.thoi_gian_bat_dau) >= GETDATE()) -- Chưa hết giờ
GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_SelectOne]
	@ma_chi_tiet_ca_thi [int]
WITH EXECUTE AS CALLER
AS
SELECT	ctct.*,
		--dethi.MaDeThi,
		ct.ten_ca_thi,
		ct.ThoiGianThi,
		'ThoiDiemKichHoat' = ct.ActivatedDate,
		mon.ten_mon_hoc

FROM
	[chi_tiet_ca_thi] ctct

LEFT OUTER JOIN [ca_thi] ct
	ON	ct.ma_ca_thi = ctct.ma_ca_thi 
	
LEFT OUTER JOIN	[tbl_DeThi] dethi 
	ON	dethi.MaDeThi			= CT.MaDeThi

LEFT OUTER JOIN	[mon_hoc] mon 
	ON	dethi.MaMonHoc			= mon.ma_mon_hoc

WHERE
	ctct.[ma_chi_tiet_ca_thi] = @ma_chi_tiet_ca_thi






GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_Update]
	@ma_chi_tiet_ca_thi [int],
	@ma_ca_thi [int],
	@ma_sinh_vien [bigint],
	@ma_de_thi [bigint],
	@tong_so_cau [int]
WITH EXECUTE AS CALLER
AS
UPDATE [chi_tiet_ca_thi] SET
	[ma_ca_thi] = @ma_ca_thi,
	[ma_sinh_vien] = @ma_sinh_vien,
	[ma_de_thi] = @ma_de_thi,
	[tong_so_cau] = @tong_so_cau 
WHERE
	[ma_chi_tiet_ca_thi] = @ma_chi_tiet_ca_thi
 


GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_UpdateBatDau]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_UpdateBatDau]
	@ma_chi_tiet_ca_thi [int],
	@thoi_gian_bat_dau [datetime]
WITH EXECUTE AS CALLER
AS
IF EXISTS (SELECT * FROM [chi_tiet_ca_thi]
	WHERE	[ma_chi_tiet_ca_thi] = @ma_chi_tiet_ca_thi
		and [thoi_gian_bat_dau] is NULL)
BEGIN

UPDATE [chi_tiet_ca_thi] 
SET
	thoi_gian_bat_dau = @thoi_gian_bat_dau,
	da_thi = 1 --da thi
WHERE
	[ma_chi_tiet_ca_thi] = @ma_chi_tiet_ca_thi
 
END

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_ca_thi_UpdateKetThuc]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_ca_thi_UpdateKetThuc]
	@ma_chi_tiet_ca_thi [int],
	@thoi_gian_ket_thuc [datetime],
	@diem [float],
	@so_cau_dung [int],
	@tong_so_cau [int]
WITH EXECUTE AS CALLER
AS
UPDATE [chi_tiet_ca_thi] 
SET
	thoi_gian_ket_thuc = @thoi_gian_ket_thuc,
	diem = @diem,
	so_cau_dung = @so_cau_dung,
	tong_so_cau = @tong_so_cau,
	da_hoan_thanh = 1 --da hoan thanh
WHERE
	[ma_chi_tiet_ca_thi] = @ma_chi_tiet_ca_thi
 


GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_dot_thi_GetAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_dot_thi_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[chi_tiet_dot_thi] CTDT LEFT JOIN [dot_thi] DT ON CTDT.ma_dot_thi=DT.ma_dot_thi
	LEFT JOIN [lop_ao] LA ON CTDT.ma_lop_ao=LA.ma_lop_ao

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_dot_thi_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_dot_thi_Insert]
	@ten_chi_tiet_dot_thi [nvarchar](200),
	@ma_lop_ao [int],
	@ma_dot_thi [int],
	@lan_thi [nvarchar](200)
WITH EXECUTE AS CALLER
AS
INSERT INTO [chi_tiet_dot_thi] (
	[ten_chi_tiet_dot_thi],
	[ma_lop_ao],
	[ma_dot_thi],
	[lan_thi]
) VALUES (
	@ten_chi_tiet_dot_thi,
	@ma_lop_ao,
	@ma_dot_thi,
	@lan_thi
)

SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_dot_thi_Remove]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_dot_thi_Remove]
	@ma_chi_tiet_dot_thi [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [chi_tiet_dot_thi]
WHERE
	[ma_chi_tiet_dot_thi] = @ma_chi_tiet_dot_thi

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_dot_thi_SelectBy_ma_dot_thi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_dot_thi_SelectBy_ma_dot_thi]
	@ma_dot_thi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM chi_tiet_dot_thi CTDT LEFT JOIN [dot_thi] DT ON CTDT.ma_dot_thi=DT.ma_dot_thi
	LEFT JOIN [lop_ao] LA ON CTDT.ma_lop_ao=LA.ma_lop_ao
WHERE CTDT.ma_dot_thi = @ma_dot_thi

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_dot_thi_SelectBy_ma_lop_ao]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_dot_thi_SelectBy_ma_lop_ao]
	@ma_lop_ao [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM chi_tiet_dot_thi
WHERE ma_lop_ao = @ma_lop_ao
			
			
		
			
			
		
------------------------------------------------------------------------------------------------------------------------
-- Date Created: Friday, December 25, 2009
-- Created By:   LXMANH
------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_dot_thi_SelectBy_MaCTDT_MaDotThi_MaLopAo]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_dot_thi_SelectBy_MaCTDT_MaDotThi_MaLopAo]
	@ma_chi_tiet_dot_thi [int] = NULL,
	@ma_dot_thi [int] = NULL,
	@ma_lop_ao [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM chi_tiet_dot_thi CTDT LEFT JOIN [dot_thi] DT ON CTDT.ma_dot_thi=DT.ma_dot_thi
	LEFT JOIN [lop_ao] LA ON CTDT.ma_lop_ao=LA.ma_lop_ao
WHERE CTDT.ma_dot_thi = @ma_dot_thi AND CTDT.ma_lop_ao = @ma_lop_ao AND CTDT.ma_chi_tiet_dot_thi != @ma_chi_tiet_dot_thi

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_dot_thi_SelectBy_MaCTDT_MaLopAo_LanThi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_dot_thi_SelectBy_MaCTDT_MaLopAo_LanThi]
	@ma_chi_tiet_dot_thi [int] = NULL,
	@ma_lop_ao [int] = NULL,
	@lan_thi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM chi_tiet_dot_thi CTDT LEFT JOIN [dot_thi] DT ON CTDT.ma_dot_thi=DT.ma_dot_thi
	LEFT JOIN [lop_ao] LA ON CTDT.ma_lop_ao=LA.ma_lop_ao
WHERE CTDT.lan_thi = @lan_thi AND CTDT.ma_lop_ao = @ma_lop_ao AND CTDT.ma_chi_tiet_dot_thi != @ma_chi_tiet_dot_thi

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_dot_thi_SelectBy_MaDotThi_MaLopAo]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_dot_thi_SelectBy_MaDotThi_MaLopAo]
	@ma_dot_thi [int] = NULL,
	@ma_lop_ao [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM chi_tiet_dot_thi CTDT LEFT JOIN [dot_thi] DT ON CTDT.ma_dot_thi=DT.ma_dot_thi
	LEFT JOIN [lop_ao] LA ON CTDT.ma_lop_ao=LA.ma_lop_ao
WHERE CTDT.ma_dot_thi = @ma_dot_thi AND CTDT.ma_lop_ao = @ma_lop_ao

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_dot_thi_SelectBy_MaLopAo_LanThi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_dot_thi_SelectBy_MaLopAo_LanThi]
	@ma_lop_ao [int] = NULL,
	@lan_thi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM chi_tiet_dot_thi CTDT LEFT JOIN [dot_thi] DT ON CTDT.ma_dot_thi=DT.ma_dot_thi
	LEFT JOIN [lop_ao] LA ON CTDT.ma_lop_ao=LA.ma_lop_ao
WHERE CTDT.lan_thi = @lan_thi AND CTDT.ma_lop_ao = @ma_lop_ao

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_dot_thi_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_dot_thi_SelectOne]
	@ma_chi_tiet_dot_thi [int]
WITH EXECUTE AS CALLER
AS
SELECT *
FROM
	[chi_tiet_dot_thi]
WHERE
	[ma_chi_tiet_dot_thi] = @ma_chi_tiet_dot_thi

GO
/****** Object:  StoredProcedure [dbo].[chi_tiet_dot_thi_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chi_tiet_dot_thi_Update]
	@ma_chi_tiet_dot_thi [int],
	@ten_chi_tiet_dot_thi [nvarchar](200),
	@ma_lop_ao [int],
	@ma_dot_thi [int],
	@lan_thi [nvarchar](200)
WITH EXECUTE AS CALLER
AS
UPDATE [chi_tiet_dot_thi] SET
	[ten_chi_tiet_dot_thi] = @ten_chi_tiet_dot_thi,
	[ma_lop_ao] = @ma_lop_ao,
	[ma_dot_thi] = @ma_dot_thi,
	[lan_thi] = @lan_thi
WHERE
	[ma_chi_tiet_dot_thi] = @ma_chi_tiet_dot_thi

GO
/****** Object:  StoredProcedure [dbo].[dot_thi_GetAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dot_thi_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[dot_thi]

GO
/****** Object:  StoredProcedure [dbo].[dot_thi_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dot_thi_Insert]
	@ten_dot_thi [nvarchar](150),
	@thoi_gian_bat_dau [datetime],
	@thoi_gian_ket_thuc [datetime],
	@NamHoc [int]
WITH EXECUTE AS CALLER
AS
INSERT INTO [dot_thi] (
	[ten_dot_thi],
	[thoi_gian_bat_dau],
	[thoi_gian_ket_thuc],
	[NamHoc]
) VALUES (
	@ten_dot_thi,
	@thoi_gian_bat_dau,
	@thoi_gian_ket_thuc,
	@NamHoc 
)

SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [dbo].[dot_thi_Remove]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dot_thi_Remove]
	@ma_dot_thi [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [chi_tiet_bai_thi] 
WHERE [chi_tiet_bai_thi].[ma_chi_tiet_ca_thi] IN
(
	SELECT  [chi_tiet_ca_thi].[ma_chi_tiet_ca_thi]   
	FROM [chi_tiet_ca_thi]
	WHERE [chi_tiet_ca_thi].[ma_ca_thi] IN (
		SELECT [ca_thi].[ma_ca_thi]  FROM [ca_thi]  
		WHERE [ca_thi].[ma_chi_tiet_dot_thi] IN
			(	SELECT	[chi_tiet_dot_thi].[ma_chi_tiet_dot_thi] 
				FROM	[chi_tiet_dot_thi] 
				WHERE	[ma_dot_thi] = @ma_dot_thi))
)

DELETE FROM [chi_tiet_ca_thi]  
WHERE [chi_tiet_ca_thi].[ma_ca_thi] IN (
	SELECT [ca_thi].[ma_ca_thi]  FROM [ca_thi]  
	WHERE [ca_thi].[ma_chi_tiet_dot_thi] IN
		(	SELECT	[chi_tiet_dot_thi].[ma_chi_tiet_dot_thi] 
			FROM	[chi_tiet_dot_thi] 
			WHERE	[ma_dot_thi] = @ma_dot_thi))

DELETE FROM [ca_thi]  
WHERE [ma_chi_tiet_dot_thi] IN
	(	SELECT	[chi_tiet_dot_thi].[ma_chi_tiet_dot_thi] 
		FROM	[chi_tiet_dot_thi] 
		WHERE	[ma_dot_thi] = @ma_dot_thi)


DELETE FROM [chi_tiet_dot_thi] 
WHERE [ma_dot_thi] = @ma_dot_thi 

DELETE FROM [dot_thi]
WHERE [ma_dot_thi] = @ma_dot_thi
GO
/****** Object:  StoredProcedure [dbo].[dot_thi_SelectByMaNamHoc]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dot_thi_SelectByMaNamHoc]
	@NamHoc [int]
WITH EXECUTE AS CALLER
AS
SELECT	*
FROM
	[dot_thi]
WHERE
	[NamHoc] = @NamHoc 
	 

GO
/****** Object:  StoredProcedure [dbo].[dot_thi_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dot_thi_SelectOne]
	@ma_dot_thi [int]
WITH EXECUTE AS CALLER
AS
SELECT	*
FROM
	[dot_thi]
WHERE
	[ma_dot_thi] = @ma_dot_thi

GO
/****** Object:  StoredProcedure [dbo].[dot_thi_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dot_thi_Update]
	@ma_dot_thi [int],
	@ten_dot_thi [nvarchar](150),
	@thoi_gian_bat_dau [datetime],
	@thoi_gian_ket_thuc [datetime],
	@NamHoc [int]
WITH EXECUTE AS CALLER
AS
UPDATE [dot_thi] SET
	[ten_dot_thi] = @ten_dot_thi,
	[thoi_gian_bat_dau] = @thoi_gian_bat_dau,
	[thoi_gian_ket_thuc] = @thoi_gian_ket_thuc,
	[NamHoc] = @NamHoc 
WHERE
	[ma_dot_thi] = @ma_dot_thi

GO
/****** Object:  StoredProcedure [dbo].[khoa_GetAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[khoa_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[khoa]

GO
/****** Object:  StoredProcedure [dbo].[khoa_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[khoa_Insert]
	@ten_khoa [nvarchar](30),
	@ngay_thanh_lap [datetime]
WITH EXECUTE AS CALLER
AS
INSERT INTO [khoa] (
	[ten_khoa],
	[ngay_thanh_lap]
) VALUES (
	@ten_khoa,
	@ngay_thanh_lap
)

SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [dbo].[khoa_Remove]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[khoa_Remove]
	@ma_khoa [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [khoa]
WHERE
	[ma_khoa] = @ma_khoa

GO
/****** Object:  StoredProcedure [dbo].[khoa_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[khoa_SelectOne]
	@ma_khoa [int]
WITH EXECUTE AS CALLER
AS
SELECT
	[ma_khoa],
	[ten_khoa],
	[ngay_thanh_lap]
FROM
	[khoa]
WHERE
	[ma_khoa] = @ma_khoa

GO
/****** Object:  StoredProcedure [dbo].[khoa_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[khoa_Update]
	@ma_khoa [int],
	@ten_khoa [nvarchar](30),
	@ngay_thanh_lap [datetime]
WITH EXECUTE AS CALLER
AS
UPDATE [khoa] SET
	[ten_khoa] = @ten_khoa,
	[ngay_thanh_lap] = @ngay_thanh_lap
WHERE
	[ma_khoa] = @ma_khoa

GO
/****** Object:  StoredProcedure [dbo].[lop_ao_GetAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_ao_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[lop_ao] LA LEFT JOIN [mon_hoc] MH ON LA.ma_mon_hoc=MH.ma_mon_hoc


GO
/****** Object:  StoredProcedure [dbo].[lop_ao_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_ao_Insert]
	@ten_lop_ao [nvarchar](200),
	@ngay_bat_dau [datetime],
	@ma_mon_hoc [int]
WITH EXECUTE AS CALLER
AS
INSERT INTO [lop_ao] (
	[ten_lop_ao],
	[ngay_bat_dau],
	[ma_mon_hoc]
) VALUES (
	@ten_lop_ao,
	@ngay_bat_dau,
	@ma_mon_hoc
)

SELECT @@IDENTITY


GO
/****** Object:  StoredProcedure [dbo].[lop_ao_Remove]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_ao_Remove]
	@ma_lop_ao [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [lop_ao]
WHERE
	[ma_lop_ao] = @ma_lop_ao

GO
/****** Object:  StoredProcedure [dbo].[lop_ao_SelectBy_ma_mon_hoc]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_ao_SelectBy_ma_mon_hoc]
	@ma_mon_hoc [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM lop_ao
WHERE ma_mon_hoc = @ma_mon_hoc

GO
/****** Object:  StoredProcedure [dbo].[lop_ao_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_ao_SelectOne]
	@ma_lop_ao [int]
WITH EXECUTE AS CALLER
AS
SELECT
	[ma_lop_ao],
	[ten_lop_ao],
	[ngay_bat_dau],
	[ma_mon_hoc]
FROM
	[lop_ao]
WHERE
	[ma_lop_ao] = @ma_lop_ao


GO
/****** Object:  StoredProcedure [dbo].[lop_ao_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_ao_Update]
	@ma_lop_ao [int],
	@ten_lop_ao [nvarchar](200),
	@ngay_bat_dau [datetime],
	@ma_mon_hoc [int]
WITH EXECUTE AS CALLER
AS
UPDATE [lop_ao] SET
	[ten_lop_ao] = @ten_lop_ao,
	[ngay_bat_dau] = @ngay_bat_dau,
	[ma_mon_hoc] = @ma_mon_hoc
WHERE
	[ma_lop_ao] = @ma_lop_ao
 

GO
/****** Object:  StoredProcedure [dbo].[lop_GetAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[lop] L LEFT JOIN [khoa] K ON L.ma_khoa = K.ma_khoa

GO
/****** Object:  StoredProcedure [dbo].[lop_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_Insert]
	@ten_lop [nvarchar](50),
	@ngay_bat_dau [datetime],
	@ma_khoa [int]
WITH EXECUTE AS CALLER
AS
INSERT INTO [lop] (
	[ten_lop],
	[ngay_bat_dau],
	[ma_khoa]
) VALUES (
	@ten_lop,
	@ngay_bat_dau,
	@ma_khoa
)

SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [dbo].[lop_Remove]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_Remove]
	@ma_lop [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [lop]
WHERE
	[ma_lop] = @ma_lop

GO
/****** Object:  StoredProcedure [dbo].[lop_SelectBy_ma_khoa]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_SelectBy_ma_khoa]
	@ma_khoa [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM lop
WHERE ma_khoa = @ma_khoa

GO
/****** Object:  StoredProcedure [dbo].[lop_SelectBy_ten_lop]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_SelectBy_ten_lop]
	@ten_lop [nvarchar](50) = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM lop
WHERE ten_lop = @ten_lop

GO
/****** Object:  StoredProcedure [dbo].[lop_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_SelectOne]
	@ma_lop [int]
WITH EXECUTE AS CALLER
AS
SELECT
	[ma_lop],
	[ten_lop],
	[ngay_bat_dau],
	[ma_khoa]
FROM
	[lop]
WHERE
	[ma_lop] = @ma_lop

GO
/****** Object:  StoredProcedure [dbo].[lop_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[lop_Update]
	@ma_lop [int],
	@ten_lop [nvarchar](50),
	@ngay_bat_dau [datetime],
	@ma_khoa [int]
WITH EXECUTE AS CALLER
AS
UPDATE [lop] SET
	[ten_lop] = @ten_lop,
	[ngay_bat_dau] = @ngay_bat_dau,
	[ma_khoa] = @ma_khoa
WHERE
	[ma_lop] = @ma_lop

GO
/****** Object:  StoredProcedure [dbo].[menu_GetAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menu_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[menu]


GO
/****** Object:  StoredProcedure [dbo].[menu_GetFather]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menu_GetFather]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[menu]
WHERE menu_parent_id = 0


GO
/****** Object:  StoredProcedure [dbo].[menu_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menu_Insert]
	@menu_title [nvarchar](100),
	@menu_description [nvarchar](200),
	@menu_url [nvarchar](100),
	@menu_valuepath [nvarchar](100),
	@menu_parent_id [int],
	@menu_order [int]
WITH EXECUTE AS CALLER
AS
INSERT INTO [menu] (
	[menu_title],
	[menu_description],
	[menu_url],
	[menu_valuepath],
	[menu_parent_id],
	[menu_order]
) VALUES (
	@menu_title,
	@menu_description,
	@menu_url,
	@menu_valuepath,
	@menu_parent_id,
	@menu_order
)

SELECT @@IDENTITY


GO
/****** Object:  StoredProcedure [dbo].[menu_Remove]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menu_Remove]
	@menu_id [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [menu]
WHERE
	[menu_id] = @menu_id

GO
/****** Object:  StoredProcedure [dbo].[menu_SelectBy_menu_parent_id]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menu_SelectBy_menu_parent_id]
	@menu_parent_id [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM menu
WHERE menu_parent_id = @menu_parent_id

GO
/****** Object:  StoredProcedure [dbo].[menu_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menu_SelectOne]
	@menu_id [int]
WITH EXECUTE AS CALLER
AS
SELECT
	[menu_id],
	[menu_title],
	[menu_description],
	[menu_url],
	[menu_valuepath],
	[menu_parent_id],
	[menu_order]
FROM
	[menu]
WHERE
	[menu_id] = @menu_id


GO
/****** Object:  StoredProcedure [dbo].[menu_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[menu_Update]
	@menu_id [int],
	@menu_title [nvarchar](100),
	@menu_description [nvarchar](200),
	@menu_url [nvarchar](100),
	@menu_valuepath [nvarchar](100),
	@menu_parent_id [int],
	@menu_order [int]
WITH EXECUTE AS CALLER
AS
UPDATE [menu] SET
	[menu_title] = @menu_title,
	[menu_description] = @menu_description,
	[menu_url] = @menu_url,
	[menu_valuepath] = @menu_valuepath,
	[menu_parent_id] = @menu_parent_id,
	[menu_order] = @menu_order
WHERE
	[menu_id] = @menu_id
 

GO
/****** Object:  StoredProcedure [dbo].[mon_hoc_GetAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mon_hoc_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[mon_hoc]

GO
/****** Object:  StoredProcedure [dbo].[mon_hoc_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mon_hoc_Insert]
	@ma_so_mon_hoc [nvarchar](50),
	@ten_mon_hoc [nvarchar](200)
WITH EXECUTE AS CALLER
AS
INSERT INTO [mon_hoc] (
	[ma_so_mon_hoc],
	[ten_mon_hoc]
) VALUES (
	@ma_so_mon_hoc,
	@ten_mon_hoc
)

SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [dbo].[mon_hoc_Remove]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mon_hoc_Remove]
	@ma_mon_hoc [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [mon_hoc]
WHERE
	[ma_mon_hoc] = @ma_mon_hoc

GO
/****** Object:  StoredProcedure [dbo].[mon_hoc_SelectBy_MaSoMonHoc]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mon_hoc_SelectBy_MaSoMonHoc]
	@ma_so_mon_hoc [nvarchar](50)
WITH EXECUTE AS CALLER
AS
SELECT
	[ma_mon_hoc],
	[ma_so_mon_hoc],
	[ten_mon_hoc]
FROM
	[mon_hoc]
WHERE
	lower([ma_so_mon_hoc]) = lower(@ma_so_mon_hoc)

GO
/****** Object:  StoredProcedure [dbo].[mon_hoc_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mon_hoc_SelectOne]
	@ma_mon_hoc [int]
WITH EXECUTE AS CALLER
AS
SELECT
	[ma_mon_hoc],
	[ma_so_mon_hoc],
	[ten_mon_hoc]
FROM
	[mon_hoc]
WHERE
	[ma_mon_hoc] = @ma_mon_hoc

GO
/****** Object:  StoredProcedure [dbo].[mon_hoc_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mon_hoc_Update]
	@ma_mon_hoc [int],
	@ma_so_mon_hoc [nvarchar](50),
	@ten_mon_hoc [nvarchar](200)
WITH EXECUTE AS CALLER
AS
UPDATE [mon_hoc] SET
	[ma_so_mon_hoc] = @ma_so_mon_hoc,
	[ten_mon_hoc] = @ten_mon_hoc
WHERE
	[ma_mon_hoc] = @ma_mon_hoc

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_GetAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[sinh_vien] SV LEFT JOIN [lop] L ON SV.ma_lop = L.ma_lop
LEFT JOIN [khoa] K ON L.ma_khoa = K.ma_khoa


GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_Insert]
	@ho_va_ten_lot [nvarchar](300),
	@ten_sinh_vien [nvarchar](50),
	@gioi_tinh [smallint],
	@ngay_sinh [datetime],
	@ma_lop [int],
	@dia_chi [text],
	@email [nvarchar](200),
	@dien_thoai [nvarchar](50),
	@ma_so_sinh_vien [nvarchar](50),
	@student_id [uniqueidentifier]
WITH EXECUTE AS CALLER
AS
-- THIS STORED PROCEDURE NEEDS TO BE MANUALLY COMPLETED
-- MULITPLE PRIMARY KEY MEMBERS OR NON-GUID/INT PRIMARY KEY

INSERT INTO [sinh_vien] (
	[ho_va_ten_lot],
	[ten_sinh_vien],
	[gioi_tinh],
	[ngay_sinh],
	[ma_lop],
	[dia_chi],
	[email],
	[dien_thoai],
	[ma_so_sinh_vien],
	[student_id]
) VALUES (
	@ho_va_ten_lot,
	@ten_sinh_vien,
	@gioi_tinh,
	@ngay_sinh,
	@ma_lop,
	@dia_chi,
	@email,
	@dien_thoai,
	@ma_so_sinh_vien,
	@student_id
)

select @@identity
GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_Login]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_Login]
	@ma_sinh_vien [bigint],
	@last_logged_in [datetime]
WITH EXECUTE AS CALLER
AS
UPDATE [sinh_vien] 
SET
	[is_logged_in] = 1,
	[last_logged_in] = @last_logged_in
WHERE
	[ma_sinh_vien] = @ma_sinh_vien
 

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_Logout]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_Logout]
	@ma_sinh_vien [bigint],
	@last_logged_out [datetime]
WITH EXECUTE AS CALLER
AS
UPDATE [sinh_vien] 
SET
	[is_logged_in] = 0,
	[last_logged_out] = @last_logged_out
WHERE
	[ma_sinh_vien] = @ma_sinh_vien
 

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_lop_ao_GetAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_lop_ao_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[sinh_vien_lop_ao]



GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_lop_ao_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_lop_ao_Insert]
	@ma_sinh_vien [bigint],
	@ma_lop_ao [int]
WITH EXECUTE AS CALLER
AS
-- THIS STORED PROCEDURE NEEDS TO BE MANUALLY COMPLETED
-- MULITPLE PRIMARY KEY MEMBERS OR NON-GUID/INT PRIMARY KEY

INSERT INTO [sinh_vien_lop_ao] (
	[ma_sinh_vien],
	[ma_lop_ao]
) VALUES (
	@ma_sinh_vien,
	@ma_lop_ao
)



GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_lop_ao_Remove]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_lop_ao_Remove]
	@ma_sinh_vien_lop_ao [bigint]
WITH EXECUTE AS CALLER
AS
DELETE FROM [sinh_vien_lop_ao]
WHERE
	[ma_sinh_vien_lop_ao] = @ma_sinh_vien_lop_ao


GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_lop_ao_SelectBy_ma_lop_ao]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_lop_ao_SelectBy_ma_lop_ao]
	@ma_lop_ao [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM sinh_vien_lop_ao SVLA JOIN sinh_vien SV ON SVLA.ma_sinh_vien=SV.ma_sinh_vien 
JOIN lop_ao LA ON SVLA.ma_lop_ao = LA.ma_lop_ao
LEFT JOIN lop L ON L.ma_lop = SV.ma_lop
WHERE LA.ma_lop_ao = @ma_lop_ao


GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_lop_ao_SelectBy_ma_sinh_vien]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_lop_ao_SelectBy_ma_sinh_vien]
	@ma_sinh_vien [bigint] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM sinh_vien_lop_ao SVLA JOIN sinh_vien SV ON SVLA.ma_sinh_vien=SV.ma_sinh_vien 
JOIN lop_ao LA ON SVLA.ma_lop_ao = LA.ma_lop_ao
WHERE SV.ma_sinh_vien = @ma_sinh_vien


GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_lop_ao_SelectBy_MaSinhVien_MaLopAo]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_lop_ao_SelectBy_MaSinhVien_MaLopAo]
	@ma_sinh_vien [bigint] = NULL,
	@ma_lop_ao [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * 
	FROM sinh_vien_lop_ao
	WHERE ma_sinh_vien = @ma_sinh_vien AND ma_lop_ao = @ma_lop_ao


GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_lop_ao_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_lop_ao_SelectOne]
	@ma_sinh_vien_lop_ao [bigint]
WITH EXECUTE AS CALLER
AS
SELECT
	[ma_sinh_vien_lop_ao],
	[ma_sinh_vien],
	[ma_lop_ao]
FROM
	[sinh_vien_lop_ao]
WHERE
	[ma_sinh_vien_lop_ao] = @ma_sinh_vien_lop_ao



GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_lop_ao_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_lop_ao_Update]
	@ma_sinh_vien_lop_ao [bigint],
	@ma_sinh_vien [bigint],
	@ma_lop_ao [int]
WITH EXECUTE AS CALLER
AS
UPDATE [sinh_vien_lop_ao] SET
	[ma_sinh_vien] = @ma_sinh_vien,
	[ma_lop_ao] = @ma_lop_ao
WHERE
	[ma_sinh_vien_lop_ao] = @ma_sinh_vien_lop_ao
 

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_Remove]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_Remove]
	@ma_sinh_vien [bigint]
WITH EXECUTE AS CALLER
AS
DELETE FROM [sinh_vien]
WHERE
	[ma_sinh_vien] = @ma_sinh_vien

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_SelectBy_ma_khoa]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_SelectBy_ma_khoa]
	@ma_khoa [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM sinh_vien SV JOIN LOP L ON SV.ma_lop=L.ma_lop
JOIN khoa K ON L.ma_khoa=K.ma_khoa
WHERE K.ma_khoa = @ma_khoa

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_SelectBy_ma_khoa_ma_lop]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_SelectBy_ma_khoa_ma_lop]
	@ma_khoa [int] = NULL,
	@ma_lop [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM sinh_vien SV JOIN LOP L ON SV.ma_lop=L.ma_lop
JOIN khoa K ON L.ma_khoa=K.ma_khoa
WHERE K.ma_khoa = @ma_khoa AND L.ma_lop = @ma_lop

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_SelectBy_ma_lop]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_SelectBy_ma_lop]
	@ma_lop [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM sinh_vien SV JOIN lop L ON SV.ma_lop = L.ma_lop
LEFT JOIN khoa K ON K.ma_khoa = L.ma_khoa
WHERE L.ma_lop = @ma_lop

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_SelectBy_ma_so_sinh_vien]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_SelectBy_ma_so_sinh_vien]
	@ma_so_sinh_vien [nvarchar](50) = NULL
WITH EXECUTE AS CALLER
AS
SELECT * 
FROM sinh_vien 
WHERE ma_so_sinh_vien = @ma_so_sinh_vien

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_SelectBy_ma_so_sinh_vien1]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_SelectBy_ma_so_sinh_vien1]
	@ma_so_sinh_vien [nvarchar](50) = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM sinh_vien
WHERE ma_so_sinh_vien = @ma_so_sinh_vien

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_SelectBy_student_id]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_SelectBy_student_id]
	@student_id [uniqueidentifier] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	* 
FROM	[sinh_vien]
WHERE	[student_id] = @student_id

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_SelectBy_ten]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_SelectBy_ten]
	@ten [nvarchar](1) = NULL
WITH EXECUTE AS CALLER
AS
SELECT	* 
FROM	sinh_vien
WHERE	(ho_va_ten_lot + ' ' + ten_sinh_vien) like @ten

GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_SelectOne]
	@ma_sinh_vien [bigint]
WITH EXECUTE AS CALLER
AS
SELECT *
FROM
	[sinh_vien]
WHERE
	[ma_sinh_vien] = @ma_sinh_vien


GO
/****** Object:  StoredProcedure [dbo].[sinh_vien_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sinh_vien_Update]
	@ma_sinh_vien [bigint],
	@ho_va_ten_lot [nvarchar](300),
	@ten_sinh_vien [nvarchar](50),
	@gioi_tinh [smallint],
	@ngay_sinh [datetime],
	@ma_lop [int],
	@dia_chi [text],
	@email [nvarchar](200),
	@dien_thoai [nvarchar](50),
	@ma_so_sinh_vien [nvarchar](50)
WITH EXECUTE AS CALLER
AS
UPDATE [sinh_vien] SET
	[ho_va_ten_lot] = @ho_va_ten_lot,
	[ten_sinh_vien] = @ten_sinh_vien,
	[gioi_tinh] = @gioi_tinh,
	[ngay_sinh] = @ngay_sinh,
	[ma_lop] = @ma_lop,
	[dia_chi] = @dia_chi,
	[email] = @email,
	[dien_thoai] = @dien_thoai,
	[ma_so_sinh_vien] = @ma_so_sinh_vien
WHERE
	[ma_sinh_vien] = @ma_sinh_vien
 

GO
/****** Object:  StoredProcedure [dbo].[tbl_AudioListened_Delete]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_AudioListened_Delete]
	@MaChiTietCaThi [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [dbo].[tbl_AudioListened]
WHERE
	[MaChiTietCaThi] = @MaChiTietCaThi


GO
/****** Object:  StoredProcedure [dbo].[tbl_AudioListened_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[tbl_AudioListened_Insert]
	@MaChiTietCaThi [int],
	@FileName [nvarchar](max),
	@ListenedCount [int]
WITH EXECUTE AS CALLER
AS
INSERT INTO 	[dbo].[tbl_AudioListened] 
(
				[MaChiTietCaThi],
				[FileName],
				[ListenedCount]
) 

VALUES 
(
				@MaChiTietCaThi,
				@FileName,
				@ListenedCount
				
)
SELECT @@IDENTITY

GO
/****** Object:  StoredProcedure [dbo].[tbl_AudioListened_Save]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[tbl_AudioListened_Save]
	@MaChiTietCaThi [int],
	@FileName [nvarchar](max)
WITH EXECUTE AS CALLER
AS
IF NOT EXISTS (
	SELECT * FROM [dbo].[tbl_AudioListened] 
	WHERE	[MaChiTietCaThi] = @MaChiTietCaThi
		AND	[FileName] = @FileName
	)
	BEGIN
		INSERT INTO 	[dbo].[tbl_AudioListened] 
		(
						[MaChiTietCaThi],
						[FileName],
						[ListenedCount]
		) 

		VALUES 
		(
						@MaChiTietCaThi,
						@FileName,
						1 -- lần đầu là +1
						
		)
		SELECT @@IDENTITY
	END
ELSE
	BEGIN
		UPDATE 		[dbo].[tbl_AudioListened] 

		SET			[ListenedCount] = [ListenedCount] + 1
					
		WHERE
					[MaChiTietCaThi] = @MaChiTietCaThi
				AND	[FileName] = @FileName
		
		SELECT @@ROWCOUNT
	END


GO
/****** Object:  StoredProcedure [dbo].[tbl_AudioListened_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[tbl_AudioListened_SelectOne]
	@MaChiTietCaThi [int],
	@FileName [nvarchar](max)
WITH EXECUTE AS CALLER
AS
SELECT	[ListenedCount]
		
FROM
		[dbo].[tbl_AudioListened]
		
WHERE
		[MaChiTietCaThi] = @MaChiTietCaThi
	AND	[FileName] = @FileName



GO
/****** Object:  StoredProcedure [dbo].[tbl_AudioListened_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[tbl_AudioListened_Update]
	@MaChiTietCaThi [int],
	@FileName [nvarchar](max),
	@ListenedCount [int]
WITH EXECUTE AS CALLER
AS
UPDATE 		[dbo].[tbl_AudioListened] 

SET
			[ListenedCount] = @ListenedCount
			
WHERE
			[MaChiTietCaThi] = @MaChiTietCaThi
		AND	[FileName] = @FileName



GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoi_Delete]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoi_Delete]
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
-- Xóa câu tra loi
DELETE FROM [dbo].[tbl_CauTraLoi]
WHERE	[MaCauHoi] = @MaCauHoi

-- Xoa cac chi tiet de hoan vi
DELETE FROM [dbo].[tbl_ChiTietDeThiHoanVi]
WHERE	[MaCauHoi] = @MaCauHoi

-- Xoa cac chi tiet de de thi (nhom)
DELETE FROM [dbo].[tbl_ChiTietDeThi]
WHERE	[MaCauHoi] = @MaCauHoi

-- Xoa luon cac Bai lam cua Sinh vien ????
DELETE FROM [dbo].[chi_tiet_bai_thi]
WHERE	[MaCauHoi] = @MaCauHoi

DELETE FROM [tbl_CauHoi]
WHERE	[MaCauHoi] = @MaCauHoi


GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoi_Insert]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoi_Insert]
	@TieuDe [nvarchar](250),
	@KieuNoiDung [int],
	@NoiDung [ntext],
	@GhiChu [nvarchar](100),
	@HoanVi [bit]
WITH EXECUTE AS CALLER
AS
INSERT INTO [tbl_CauHoi] (
	[TieuDe],
	[KieuNoiDung],
	[NoiDung],
	[GhiChu],
	[HoanVi]
) VALUES (
	@TieuDe,
	@KieuNoiDung,
	@NoiDung,
	@GhiChu,
	@HoanVi
)

SELECT @@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoi_SelectAll]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoi_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[tbl_CauHoi]



GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoi_SelectDapAn]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoi_SelectDapAn]
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
SELECT TOP 1 MaCauTraLoi
FROM	[tbl_CauTraLoi]
WHERE	[MaCauHoi]  = @MaCauHoi
	AND	[LaDapAn]	= 1
ORDER BY ThuTu



GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoi_SelectOne]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoi_SelectOne]
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[tbl_CauHoi]
WHERE
	[MaCauHoi] = @MaCauHoi



GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoi_Update]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoi_Update]
	@MaCauHoi [int],
	@TieuDe [nvarchar](250),
	@KieuNoiDung [int],
	@NoiDung [ntext],
	@GhiChu [nvarchar](100),
	@HoanVi [bit]
WITH EXECUTE AS CALLER
AS
UPDATE [tbl_CauHoi] 
SET
	[TieuDe] = @TieuDe,
	[KieuNoiDung] = @KieuNoiDung,
	[NoiDung] = @NoiDung,
	[GhiChu] = @GhiChu,
	[HoanVi] = @HoanVi
WHERE
	[MaCauHoi] = @MaCauHoi
 


GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoiMa_Delete]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoiMa_Delete]
	@MaCauHoiMa [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [dbo].[tbl_CauHoiMa]
WHERE
	[MaCauHoiMa] = @MaCauHoiMa

GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoiMa_GetCount]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoiMa_GetCount]
WITH EXECUTE AS CALLER
AS
SELECT COUNT(*) FROM [dbo].[tbl_CauHoiMa]


GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoiMa_GetCountBy_MaChiTietCaThi]    Script Date: 26/08/2024 10:41:56 SA ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoiMa_GetCountBy_MaChiTietCaThi]
	@MaChiTietCaThi [int]
WITH EXECUTE AS CALLER
AS
SELECT COUNT(*) FROM [dbo].[tbl_CauHoiMa]
WHERE	[MaChiTietCaThi] = @MaChiTietCaThi


GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoiMa_Insert]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoiMa_Insert]
	@MaNhom [int],
	@ThuTu [int],
	@MaChiTietCaThi [int]
WITH EXECUTE AS CALLER
AS
IF NOT EXISTS (
	SELECT	* 
	FROM	[dbo].[tbl_CauHoiMa] 
	WHERE	[MaChiTietCaThi]	= @MaChiTietCaThi
		AND	[MaNhom]			= @MaNhom
		AND	[ThuTu]				= @ThuTu )
	BEGIN
			
		INSERT INTO 	[dbo].[tbl_CauHoiMa] 
		(
						[MaNhom],
						[ThuTu],
						[MaChiTietCaThi]
		) 
		VALUES 
		(
						@MaNhom,
						@ThuTu,
						@MaChiTietCaThi
						
		)
		SELECT @@IDENTITY 

	END
ELSE SELECT -1

GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoiMa_SelectAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoiMa_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT	chm.*,
		'TieuDe' = n.TenNhom,
		'NoiDung' = n.NoiDung
		
FROM	[dbo].[tbl_CauHoiMa] chm

LEFT OUTER JOIN	[tbl_NhomCauHoi] n
	ON	chm.MaNhom = n.MaNhom
GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoiMa_SelectOne]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[tbl_CauHoiMa_SelectOne]
	@MaCauHoiMa [int]
WITH EXECUTE AS CALLER
AS
SELECT	chm.*,
		'TieuDe' = n.TenNhom,
		'NoiDung' = n.NoiDung
		
FROM
		[dbo].[tbl_CauHoiMa] chm
		
LEFT OUTER JOIN	[tbl_NhomCauHoi] n
	ON	chm.MaNhom = n.MaNhom
		
WHERE
		chm.[MaCauHoiMa] = @MaCauHoiMa


GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoiMa_SelectPage]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[tbl_CauHoiMa_SelectPage]
	@PageNumber [int],
	@PageSize [int]
WITH EXECUTE AS CALLER
AS
DECLARE @PageLowerBound int
DECLARE @PageUpperBound int


SET @PageLowerBound = (@PageSize * @PageNumber) - @PageSize
SET @PageUpperBound = @PageLowerBound + @PageSize + 1

/*
Note: temp tables use the server default for collation not the database default
so if adding character columns be sure and specify to use the database collation like this
to avoid collation errors:

CREATE TABLE #PageIndexForUsers
(
IndexID int IDENTITY (1, 1) NOT NULL,
UserName nvarchar(50) COLLATE DATABASE_DEFAULT,
LoginName nvarchar(50) COLLATE DATABASE_DEFAULT
) 


*/

CREATE TABLE #PageIndex 
(
	IndexID int IDENTITY (1, 1) NOT NULL,
MaCauHoiMa Int
)

BEGIN

INSERT INTO #PageIndex ( 
MaCauHoiMa
)

SELECT
		[MaCauHoiMa]
		
FROM
		[dbo].[tbl_CauHoiMa]
		
-- WHERE

-- ORDER BY

END


SELECT
		t1.*,
		'TieuDe' = n.TenNhom,
		'NoiDung' = n.NoiDung
		
FROM
		[dbo].[tbl_CauHoiMa] t1

JOIN			#PageIndex t2
	ON			
		t1.[MaCauHoiMa] = t2.[MaCauHoiMa]
		
LEFT OUTER JOIN	[tbl_NhomCauHoi] n
	ON	t1.MaNhom = n.MaNhom
		
WHERE
		t2.IndexID > @PageLowerBound 
		AND t2.IndexID < @PageUpperBound
		
ORDER BY t2.IndexID

DROP TABLE #PageIndex


GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoiMa_SelectPage_V2]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[tbl_CauHoiMa_SelectPage_V2]
	@MaChiTietCaThi [int],
	@PageNumber [int],
	@PageSize [int]
WITH EXECUTE AS CALLER
AS
DECLARE @PageLowerBound int
DECLARE @PageUpperBound int


SET @PageLowerBound = (@PageSize * @PageNumber) - @PageSize
SET @PageUpperBound = @PageLowerBound + @PageSize + 1

CREATE TABLE #PageIndex 
(
	IndexID int IDENTITY (1, 1) NOT NULL,
MaCauHoiMa Int
)

BEGIN

INSERT INTO #PageIndex ( 
MaCauHoiMa
)

SELECT
		[MaCauHoiMa]
		
FROM
		[dbo].[tbl_CauHoiMa]
		
		
WHERE   [MaChiTietCaThi] = @MaChiTietCaThi

-- ORDER BY

END


SELECT
		t1.*,
		'TieuDe' = n.TenNhom,
		'NoiDung' = n.NoiDung
		
FROM
		[dbo].[tbl_CauHoiMa] t1

JOIN			#PageIndex t2
	ON			
		t1.[MaCauHoiMa] = t2.[MaCauHoiMa]
		
LEFT OUTER JOIN	[tbl_NhomCauHoi] n
	ON	t1.MaNhom = n.MaNhom
		
WHERE
		t2.IndexID > @PageLowerBound 
		AND t2.IndexID < @PageUpperBound
		
ORDER BY t2.IndexID

DROP TABLE #PageIndex


GO
/****** Object:  StoredProcedure [dbo].[tbl_CauHoiMa_Update]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauHoiMa_Update]
	@MaCauHoiMa [int],
	@MaNhom [int],
	@ThuTu [int],
	@MaChiTietCaThi [int]
WITH EXECUTE AS CALLER
AS
UPDATE 		[dbo].[tbl_CauHoiMa] 

SET
			[MaNhom]	= @MaNhom,
			[ThuTu]		= @ThuTu,
			[MaChiTietCaThi] = @MaChiTietCaThi
			
			
WHERE
			[MaCauHoiMa] = @MaCauHoiMa


GO
/****** Object:  StoredProcedure [dbo].[tbl_CauTraLoi_CountBy_MaCauHoi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauTraLoi_CountBy_MaCauHoi]
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
SELECT	count(*)
FROM	tbl_CauTraLoi
WHERE	MaCauHoi = @MaCauHoi

GO
/****** Object:  StoredProcedure [dbo].[tbl_CauTraLoi_Delete]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauTraLoi_Delete]
	@MaCauTraLoi [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [tbl_CauTraLoi]
WHERE
	[MaCauTraLoi] = @MaCauTraLoi


GO
/****** Object:  StoredProcedure [dbo].[tbl_CauTraLoi_Insert]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauTraLoi_Insert]
	@MaCauHoi [int],
	@ThuTu [int],
	@NoiDung [ntext],
	@LaDapAn [bit],
	@HoanVi [bit]
WITH EXECUTE AS CALLER
AS
INSERT INTO [tbl_CauTraLoi] (
	[MaCauHoi],
	[ThuTu],
	[NoiDung],
	[LaDapAn],
	[HoanVi]
) 
VALUES (
	@MaCauHoi,
	@ThuTu,
	@NoiDung,
	@LaDapAn,
	@HoanVi
)

SELECT @@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[tbl_CauTraLoi_SelectAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauTraLoi_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[tbl_CauTraLoi]



GO
/****** Object:  StoredProcedure [dbo].[tbl_CauTraLoi_SelectBy_MaCauHoi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauTraLoi_SelectBy_MaCauHoi]
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
SELECT	* 
FROM	tbl_CauTraLoi
WHERE	MaCauHoi = @MaCauHoi

GO
/****** Object:  StoredProcedure [dbo].[tbl_CauTraLoi_SelectOne]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauTraLoi_SelectOne]
	@MaCauTraLoi [int]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[tbl_CauTraLoi]
WHERE
	[MaCauTraLoi] = @MaCauTraLoi



GO
/****** Object:  StoredProcedure [dbo].[tbl_CauTraLoi_Update]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_CauTraLoi_Update]
	@MaCauTraLoi [int],
	@MaCauHoi [int],
	@ThuTu [int],
	@NoiDung [ntext],
	@LaDapAn [bit],
	@HoanVi [bit]
WITH EXECUTE AS CALLER
AS
UPDATE [tbl_CauTraLoi] 
SET
	[MaCauHoi] = @MaCauHoi,
	[ThuTu] = @ThuTu,
	[NoiDung] = @NoiDung,
	[LaDapAn] = @LaDapAn,
	[HoanVi]	= @HoanVi
WHERE
	[MaCauTraLoi] = @MaCauTraLoi
 


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietCauHoiMa_CountBy_MaCauHoiMa]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietCauHoiMa_CountBy_MaCauHoiMa]
	@MaCauHoiMa [int]
WITH EXECUTE AS CALLER
AS
SELECT	COUNT(*)
FROM	[dbo].[tbl_ChiTietCauHoiMa]
WHERE	[MaCauHoiMa] = @MaCauHoiMa

GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietCauHoiMa_Delete]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietCauHoiMa_Delete]
	@MaCauHoiMa [int],
	@MaChiTietBaiThi [bigint]
WITH EXECUTE AS CALLER
AS
DELETE FROM [dbo].[tbl_ChiTietCauHoiMa]
WHERE
	[MaCauHoiMa] = @MaCauHoiMa
	AND [MaChiTietBaiThi] = @MaChiTietBaiThi

GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietCauHoiMa_DeleteBy_MaCauHoiMa]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietCauHoiMa_DeleteBy_MaCauHoiMa]
	@MaCauHoiMa [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [dbo].[tbl_ChiTietCauHoiMa]
WHERE
	[MaCauHoiMa] = @MaCauHoiMa

GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietCauHoiMa_Insert]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietCauHoiMa_Insert]
	@MaCauHoiMa [int],
	@MaChiTietBaiThi [bigint]
WITH EXECUTE AS CALLER
AS
IF NOT EXISTS (SELECT * FROM [dbo].[tbl_ChiTietCauHoiMa]  WHERE [MaCauHoiMa] = @MaCauHoiMa AND [MaChiTietBaiThi] = @MaChiTietBaiThi)
BEGIN
	INSERT INTO 		[dbo].[tbl_ChiTietCauHoiMa] 
	(
						[MaCauHoiMa],
						[MaChiTietBaiThi]
	) 

	VALUES 
	(
						@MaCauHoiMa,
						@MaChiTietBaiThi
	)
END


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThi_CountBy_MaNhom]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThi_CountBy_MaNhom]
	@MaNhom [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	COUNT(ct.MaCauHoi)

FROM	tbl_ChiTietDeThi ct

WHERE	ct.MaNhom = @MaNhom
			
			


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThi_Delete]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThi_Delete]
	@MaNhom [int],
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [tbl_ChiTietDeThi]
WHERE
	[MaNhom] = @MaNhom
	AND [MaCauHoi] = @MaCauHoi


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThi_Insert]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThi_Insert]
	@MaNhom [int],
	@MaCauHoi [int],
	@ThuTu [int]
WITH EXECUTE AS CALLER
AS
IF NOT EXISTS (SELECT * FROM [tbl_ChiTietDeThi] 
	WHERE MaNhom = @MaNhom AND MaCauHoi = @MaCauHoi)
BEGIN
	INSERT INTO [tbl_ChiTietDeThi] 
	(
		[MaNhom],
		[MaCauHoi],
		[ThuTu]
	) 
	VALUES 
	(
		@MaNhom,
		@MaCauHoi,
		@ThuTu
	)
END


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThi_SelectAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThi_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[tbl_ChiTietDeThi]



GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThi_SelectBy_MaCauHoi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThi_SelectBy_MaCauHoi]
	@MaCauHoi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM tbl_ChiTietDeThi
WHERE MaCauHoi = @MaCauHoi


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThi_SelectBy_MaNhom]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThi_SelectBy_MaNhom]
	@MaNhom [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	ct.* ,
		ch.HoanVi,
		ch.NoiDung

FROM	tbl_ChiTietDeThi ct

LEFT OUTER JOIN tbl_CauHoi ch
	ON	ct.MaCauHoi = ch.MaCauHoi

WHERE	ct.MaNhom = @MaNhom
			
			
		
			
			
		
------------------------------------------------------------------------------------------------------------------------
-- Date Created: 21/12/2009
-- Created By:   Le Xuan Manh
------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThi_SelectBy_MaNhom_v2]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThi_SelectBy_MaNhom_v2]
	@MaNhom [int] = NULL,
	@SoCauLay [int]
WITH EXECUTE AS CALLER
AS
DECLARE @Count int
SELECT	@Count = COUNT(ct.MaCauHoi)
FROM	tbl_ChiTietDeThi ct
LEFT OUTER JOIN tbl_CauHoi ch
	ON	ct.MaCauHoi = ch.MaCauHoi
WHERE	ct.MaNhom = @MaNhom
IF(@SoCauLay > @Count OR @SoCauLay < 0)
--Begin	
	SET @SoCauLay = @Count
--end
--ELSE IF (@SoCauLay < 0)
--	SET @SoCauLay = 0


DECLARE @IsHoanVi bit
SELECT	@IsHoanVi = nh.HoanVi
FROM	dbo.tbl_NhomCauHoi nh
WHERE	nh.MaNhom = @MaNhom


SELECT TOP (@SoCauLay)	
		ct.* ,
		ch.HoanVi,
		ch.NoiDung

FROM	tbl_ChiTietDeThi ct

LEFT OUTER JOIN tbl_CauHoi ch
	ON	ct.MaCauHoi = ch.MaCauHoi

WHERE	ct.MaNhom = @MaNhom
			
ORDER BY
	CASE @IsHoanVi
		WHEN 1 THEN (RANK() OVER (ORDER BY NEWID()))
		ELSE (RANK() OVER (ORDER BY [ThuTu], ch.[MaCauHoi]))
	END
		
			
			
		
------------------------------------------------------------------------------------------------------------------------
-- Date Created: 21/12/2009
-- Created By:   Le Xuan Manh
------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThi_SelectOne]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThi_SelectOne]
	@MaNhom [int],
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[tbl_ChiTietDeThi]
WHERE
	[MaNhom] = @MaNhom
	AND [MaCauHoi] = @MaCauHoi



GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThi_Update]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThi_Update]
	@MaNhom [int],
	@MaCauHoi [int],
	@ThuTu [int]
WITH EXECUTE AS CALLER
AS
UPDATE [tbl_ChiTietDeThi] SET
	[ThuTu] = @ThuTu
WHERE
	[MaNhom] = @MaNhom
	AND [MaCauHoi] = @MaCauHoi
 


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_Delete]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_Delete]
	@MaDeHV [bigint],
	@MaNhom [int],
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [tbl_ChiTietDeThiHoanVi]
WHERE
	[MaDeHV] = @MaDeHV
	AND [MaNhom] = @MaNhom
	AND [MaCauHoi] = @MaCauHoi


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_GetAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_GetAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[tbl_ChiTietDeThiHoanVi]


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_Insert]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_Insert]
	@MaDeHV [bigint],
	@MaNhom [int],
	@MaCauHoi [int],
	@ThuTu [int],
	@HoanViTraLoi [nvarchar](4),
	@DapAn [int]
WITH EXECUTE AS CALLER
AS
-- THIS STORED PROCEDURE NEEDS TO BE MANUALLY COMPLETED
-- MULITPLE PRIMARY KEY MEMBERS OR NON-GUID/INT PRIMARY KEY

INSERT INTO [tbl_ChiTietDeThiHoanVi] (
	[MaDeHV],
	[MaNhom],
	[MaCauHoi],
	[ThuTu],
	[HoanViTraLoi],
	[DapAn]
) 
VALUES 
(
	@MaDeHV,
	@MaNhom,
	@MaCauHoi,
	@ThuTu,
	@HoanViTraLoi,
	@DapAn
)



GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_Remove]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_Remove]
	@MaDeHV [bigint],
	@MaNhom [int],
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [tbl_ChiTietDeThiHoanVi]
WHERE
	[MaDeHV] = @MaDeHV
	AND [MaNhom] = @MaNhom
	AND [MaCauHoi] = @MaCauHoi


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT	*
FROM	[tbl_ChiTietDeThiHoanVi]



GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_DapAn]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_DapAn]
	@DapAn [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM tbl_ChiTietDeThiHoanVi
WHERE DapAn = @DapAn

GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaCauHoi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaCauHoi]
	@MaCauHoi [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT * FROM tbl_ChiTietDeThiHoanVi
WHERE MaCauHoi = @MaCauHoi
			
			
		
			
			
		
------------------------------------------------------------------------------------------------------------------------
-- Date Created: 24/12/2009
-- Created By:   Le Xuan Manh
------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV]
	@MaDeHV [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	ct.* 

FROM	tbl_ChiTietDeThiHoanVi ct

LEFT OUTER JOIN tbl_NhomCauHoi nch
	ON nch.MaNhom = ct.MaNhom

WHERE	ct.MaDeHV = @MaDeHV 

ORDER BY ct.ThuTu, nch.ThuTu

			
			
		
			
			
		
------------------------------------------------------------------------------------------------------------------------
-- Date Created: 24/12/2009
-- Created By:   Le Xuan Manh
------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV_MaCauHoi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV_MaCauHoi]
	@MaDeHV [bigint],
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
SELECT * FROM tbl_ChiTietDeThiHoanVi
WHERE MaDeHV = @MaDeHV and MaCauHoi = @MaCauHoi		
			
		


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV_MaNhom]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV_MaNhom]
	@MaDeHV [bigint],
	@MaNhom [int]
WITH EXECUTE AS CALLER
AS
DECLARE @MANHOMCHA INT
DECLARE @TONGCAUHOI INT

SELECT	@MANHOMCHA	= n.MaNhomCha
FROM	tbl_ChiTietDeThiHoanVi ct
LEFT OUTER JOIN tbl_NhomCauHoi n
	ON	n.MaNhom	= ct.MaNhom		
WHERE	ct.MaNhom	= @MaNhom 
	AND ct.MaDeHV	= @MaDeHV

IF (@MANHOMCHA = -1 OR @MANHOMCHA IS NULL)
	
BEGIN

	SELECT @TONGCAUHOI = SUM(SOCAUHOI) 
	FROM
	(
		SELECT	COUNT(ct.MACAUHOI) AS SOCAUHOI

		FROM	TBL_CHITIETDETHI ct

		WHERE	ct.MaNhom IN
		(
			SELECT	MaNhom 
			FROM	TBL_NHOMCAUHOIHOANVI			
			WHERE	MaDeHV = @MaDeHV 
				AND	ThuTu <
				(	
					SELECT	ThuTu 
					FROM	TBL_NHOMCAUHOIHOANVI
					WHERE	MaDeHV = @MaDeHV
						AND	MaNhom = @MaNhom
				)
				AND MaNhom IN
				(	SELECT	MaNhom 
					FROM	TBL_NHOMCAUHOI
					WHERE	MaNhomCha = -1 OR MaNhomCha IS NULL
				)
		)
		GROUP BY ct.MaNhom

		UNION ALL

		SELECT	COUNT(ct.MACAUHOI) AS SOCAUHOI

		FROM	TBL_CHITIETDETHI ct

		WHERE	ct.MaNhom IN
		(
			SELECT	MaNhom 
			FROM	TBL_NHOMCAUHOI
			WHERE	MaNhomCha IN
			(	SELECT	MaNhom 
				FROM	TBL_NHOMCAUHOIHOANVI			
				WHERE	MaDeHV = @MaDeHV 
					AND	ThuTu <
					(	
						SELECT	ThuTu 
						FROM	TBL_NHOMCAUHOIHOANVI
						WHERE	MaDeHV = @MaDeHV
							AND	MaNhom = @MaNhom
					)
					AND MaNhom IN
					(	SELECT	MaNhom 
						FROM	TBL_NHOMCAUHOI
						WHERE	MaNhomCha = -1 OR MaNhomCha IS NULL
					)
			)
		)
		GROUP BY ct.MaNhom

	) AS TBL_TEMP

	IF @TONGCAUHOI IS NULL
		SET @TONGCAUHOI = 0


	SELECT	CTDHV.*,
			CH.*,
			'ThuTuSapXep' = @TONGCAUHOI + CTDHV.ThuTu,
			@TONGCAUHOI

	FROM	tbl_ChiTietDeThiHoanVi CTDHV

	JOIN	tbl_CauHoi CH 
		ON	CTDHV.MaCauHoi	= CH.MaCauHoi

	WHERE	CTDHV.MaNhom = @MaNhom 
		AND CTDHV.MaDeHV = @MaDeHV

	ORDER BY CTDHV.ThuTu			
END

ELSE -- khong phai nhom cap 1

BEGIN

	SELECT	@TONGCAUHOI = SUM(SOCAUHOI) 
	FROM
	(
		SELECT	COUNT(ct.MACAUHOI) AS SOCAUHOI

		FROM	TBL_CHITIETDETHI ct

		WHERE	ct.MaNhom IN
			(
			SELECT	MaNhom 
			FROM	TBL_NHOMCAUHOIHOANVI			
			WHERE	MaDeHV = @MaDeHV 
				AND	ThuTu <=
				(	
					SELECT	DISTINCT NHV.ThuTu 
					FROM	TBL_NHOMCAUHOIHOANVI NHV
					LEFT OUTER JOIN TBL_NHOMCAUHOI N
						ON	N.MaNhom = NHV.MaNhom
					WHERE	NHV.MaDeHV = @MaDeHV
						AND	n.MaNhom IN
							(SELECT MaNhomCha FROM TBL_NHOMCAUHOI WHERE MaNhom = @MaNhom)
				)
				AND MaNhom IN
				(	SELECT	MaNhom 
					FROM	TBL_NHOMCAUHOI
					WHERE	MaNhomCha = -1 OR MaNhomCha IS NULL
				)
			)
		GROUP BY ct.MaNhom

		UNION ALL

		SELECT	COUNT(ct.MACAUHOI) AS SOCAUHOI

		FROM	TBL_CHITIETDETHI ct

		WHERE	ct.MaNhom IN
		(
			SELECT	MaNhom 
			FROM	TBL_NHOMCAUHOI
			WHERE	MaNhomCha IN
				(	SELECT	MaNhom 
					FROM	TBL_NHOMCAUHOIHOANVI			
					WHERE	MaDeHV = @MaDeHV 
						AND	ThuTu <=
						(	
							SELECT	DISTINCT NHV.ThuTu 
							FROM	TBL_NHOMCAUHOIHOANVI NHV
							LEFT OUTER JOIN TBL_NHOMCAUHOI N
								ON	N.MaNhom = NHV.MaNhom
							WHERE	NHV.MaDeHV = @MaDeHV
								AND	N.MaNhom IN
									(SELECT MaNhomCha FROM TBL_NHOMCAUHOI WHERE MaNhom = @MaNhom)
						)
						AND MaNhom IN
						(	SELECT	MaNhom 
							FROM	TBL_NHOMCAUHOI
							WHERE	MaNhomCha = -1 OR MaNhomCha IS NULL
						)
				)
				AND MaNhom IN
				(	SELECT	MaNhom 
					FROM	TBL_NHOMCAUHOIHOANVI			
					WHERE	MaDeHV = @MaDeHV 
						AND	ThuTu <
						(	
							SELECT	ThuTu 
							FROM	TBL_NHOMCAUHOIHOANVI
							WHERE	MaDeHV	= @MaDeHV
								AND	MaNhom	= @MaNhom
						)
--						AND MaNhom IN
--						(	SELECT	MaNhom 
--							FROM	TBL_NHOMCAUHOI
--							WHERE	MaNhomCha in (SELECT MaNhomCha FROM TBL_NHOMCAUHOI WHERE MaNhom = @MaNhom)
--						)
				)
		)
		GROUP BY ct.MaNhom

	) AS TBL_TEMP

	IF @TONGCAUHOI IS NULL
		SET @TONGCAUHOI = 0

	SELECT	CTDHV.*,
			CH.*,
			'ThuTuSapXep' = @TONGCAUHOI + CTDHV.ThuTu,
			@TONGCAUHOI

	FROM	tbl_ChiTietDeThiHoanVi CTDHV

	JOIN	tbl_CauHoi CH 
		ON	CTDHV.MaCauHoi	= CH.MaCauHoi

	WHERE	CTDHV.MaNhom = @MaNhom 
		AND CTDHV.MaDeHV = @MaDeHV

	ORDER BY CTDHV.ThuTu			
END		
			
		


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV_MaNhom_MaChiTietCaThi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV_MaNhom_MaChiTietCaThi]
	@MaDeHV [bigint],
	@MaNhom [int],
	@MaChiTietCaThi [int]
WITH EXECUTE AS CALLER
AS
DECLARE @MANHOMCHA INT
DECLARE @TONGCAUHOI INT

SELECT	@MANHOMCHA	= n.MaNhomCha
FROM	tbl_ChiTietDeThiHoanVi ct
LEFT OUTER JOIN tbl_NhomCauHoi n
	ON	n.MaNhom	= ct.MaNhom		
WHERE	ct.MaNhom	= @MaNhom 
	AND ct.MaDeHV	= @MaDeHV

IF (@MANHOMCHA = -1 OR @MANHOMCHA IS NULL)
	
BEGIN

	SELECT @TONGCAUHOI = SUM(SOCAUHOI) 
	FROM
	(
		SELECT	COUNT(ct.MACAUHOI) AS SOCAUHOI

		FROM	TBL_CHITIETDETHI ct

		WHERE	ct.MaNhom IN
		(
			SELECT	MaNhom 
			FROM	TBL_NHOMCAUHOIHOANVI			
			WHERE	MaDeHV = @MaDeHV 
				AND	ThuTu <
				(	
					SELECT	ThuTu 
					FROM	TBL_NHOMCAUHOIHOANVI
					WHERE	MaDeHV = @MaDeHV
						AND	MaNhom = @MaNhom
				)
				AND MaNhom IN
				(	SELECT	MaNhom 
					FROM	TBL_NHOMCAUHOI
					WHERE	MaNhomCha = -1 OR MaNhomCha IS NULL
				)
		)
		GROUP BY ct.MaNhom

		UNION ALL

		SELECT	COUNT(ct.MACAUHOI) AS SOCAUHOI

		FROM	TBL_CHITIETDETHI ct

		WHERE	ct.MaNhom IN
		(
			SELECT	MaNhom 
			FROM	TBL_NHOMCAUHOI
			WHERE	MaNhomCha IN
			(	SELECT	MaNhom 
				FROM	TBL_NHOMCAUHOIHOANVI			
				WHERE	MaDeHV = @MaDeHV 
					AND	ThuTu <
					(	
						SELECT	ThuTu 
						FROM	TBL_NHOMCAUHOIHOANVI
						WHERE	MaDeHV = @MaDeHV
							AND	MaNhom = @MaNhom
					)
					AND MaNhom IN
					(	SELECT	MaNhom 
						FROM	TBL_NHOMCAUHOI
						WHERE	MaNhomCha = -1 OR MaNhomCha IS NULL
					)
			)
		)
		GROUP BY ct.MaNhom

	) AS TBL_TEMP

	IF @TONGCAUHOI IS NULL
		SET @TONGCAUHOI = 0


	SELECT	CTDHV.*,
			CH.*,
			'ThuTuSapXep' = @TONGCAUHOI + CTDHV.ThuTu,
			@TONGCAUHOI,
			'MaTraLoiDaLuu' = bt.CauTraLoi

	FROM	tbl_ChiTietDeThiHoanVi CTDHV

	JOIN	tbl_CauHoi CH 
		ON	CTDHV.MaCauHoi	= CH.MaCauHoi

	LEFT OUTER JOIN	
			[chi_tiet_bai_thi] bt
		ON	(bt.MaCauHoi	= CTDHV.MaCauHoi
			AND	bt.MaNhom	= CTDHV.MaNhom
			AND bt.MaDeHV	= CTDHV.MaDeHV
			AND bt.Ma_Chi_Tiet_Ca_Thi = @MaChiTietCaThi)

	WHERE	CTDHV.MaNhom = @MaNhom 
		AND CTDHV.MaDeHV = @MaDeHV

	ORDER BY CTDHV.ThuTu			
END

ELSE -- khong phai nhom cap 1

BEGIN

	SELECT	@TONGCAUHOI = SUM(SOCAUHOI) 
	FROM
	(
		SELECT	COUNT(ct.MACAUHOI) AS SOCAUHOI

		FROM	TBL_CHITIETDETHI ct

		WHERE	ct.MaNhom IN
			(
			SELECT	MaNhom 
			FROM	TBL_NHOMCAUHOIHOANVI			
			WHERE	MaDeHV = @MaDeHV 
				AND	ThuTu <=
				(	
					SELECT	DISTINCT NHV.ThuTu 
					FROM	TBL_NHOMCAUHOIHOANVI NHV
					LEFT OUTER JOIN TBL_NHOMCAUHOI N
						ON	N.MaNhom = NHV.MaNhom
					WHERE	NHV.MaDeHV = @MaDeHV
						AND	n.MaNhom IN
							(SELECT MaNhomCha FROM TBL_NHOMCAUHOI WHERE MaNhom = @MaNhom)
				)
				AND MaNhom IN
				(	SELECT	MaNhom 
					FROM	TBL_NHOMCAUHOI
					WHERE	MaNhomCha = -1 OR MaNhomCha IS NULL
				)
			)
		GROUP BY ct.MaNhom

		UNION ALL

		SELECT	COUNT(ct.MACAUHOI) AS SOCAUHOI

		FROM	TBL_CHITIETDETHI ct

		WHERE	ct.MaNhom IN
		(
			SELECT	MaNhom 
			FROM	TBL_NHOMCAUHOI
			WHERE	MaNhomCha IN
				(	SELECT	MaNhom 
					FROM	TBL_NHOMCAUHOIHOANVI			
					WHERE	MaDeHV = @MaDeHV 
						AND	ThuTu <=
						(	
							SELECT	DISTINCT NHV.ThuTu 
							FROM	TBL_NHOMCAUHOIHOANVI NHV
							LEFT OUTER JOIN TBL_NHOMCAUHOI N
								ON	N.MaNhom = NHV.MaNhom
							WHERE	NHV.MaDeHV = @MaDeHV
								AND	N.MaNhom IN
									(SELECT MaNhomCha FROM TBL_NHOMCAUHOI WHERE MaNhom = @MaNhom)
						)
						AND MaNhom IN
						(	SELECT	MaNhom 
							FROM	TBL_NHOMCAUHOI
							WHERE	MaNhomCha = -1 OR MaNhomCha IS NULL
						)
				)
				AND MaNhom IN
				(	SELECT	MaNhom 
					FROM	TBL_NHOMCAUHOIHOANVI			
					WHERE	MaDeHV = @MaDeHV 
						AND	ThuTu <
						(	
							SELECT	ThuTu 
							FROM	TBL_NHOMCAUHOIHOANVI
							WHERE	MaDeHV	= @MaDeHV
								AND	MaNhom	= @MaNhom
						)
--						AND MaNhom IN
--						(	SELECT	MaNhom 
--							FROM	TBL_NHOMCAUHOI
--							WHERE	MaNhomCha in (SELECT MaNhomCha FROM TBL_NHOMCAUHOI WHERE MaNhom = @MaNhom)
--						)
				)
		)
		GROUP BY ct.MaNhom

	) AS TBL_TEMP

	IF @TONGCAUHOI IS NULL
		SET @TONGCAUHOI = 0

	SELECT	CTDHV.*,
			CH.*,
			'ThuTuSapXep' = @TONGCAUHOI + CTDHV.ThuTu,
			@TONGCAUHOI,
			'MaTraLoiDaLuu' = bt.CauTraLoi

	FROM	tbl_ChiTietDeThiHoanVi CTDHV

	JOIN	tbl_CauHoi CH 
		ON	CTDHV.MaCauHoi	= CH.MaCauHoi

	LEFT OUTER JOIN	
			[chi_tiet_bai_thi] bt
		ON	(bt.MaCauHoi = CH.MaCauHoi
		AND	bt.MaNhom = @MaNhom
		AND bt.MaDeHV = @MaDeHV
		AND bt.Ma_Chi_Tiet_Ca_Thi = @MaChiTietCaThi)

	WHERE	CTDHV.MaNhom = @MaNhom 
		AND CTDHV.MaDeHV = @MaDeHV

	ORDER BY CTDHV.ThuTu			
END		
			
		


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV_MaNhom_MaChiTietCaThi_v2]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV_MaNhom_MaChiTietCaThi_v2]
	@MaDeHV [bigint],
	@MaNhom [int],
	@MaChiTietCaThi [int]
WITH EXECUTE AS CALLER
AS
CREATE TABLE #DeThiIndex 
(
	IndexID int IDENTITY (1, 1) NOT NULL,
	MaCauHoi int
)

BEGIN

INSERT INTO #DeThiIndex ( 
	MaCauHoi
)

SELECT	
		MaCauHoi
		
FROM	tbl_ChiTietDeThiHoanVi
		
WHERE	MaDeHV = @MaDeHV

ORDER BY [MaNhom], [ThuTu]

END

--select * from #DeThiIndex
	SELECT	CTDHV.*,
			CH.*,
			'ThuTuSapXep' = p.IndexID,
			--@TONGCAUHOI,
			'MaTraLoiDaLuu' = bt.CauTraLoi

	FROM	tbl_ChiTietDeThiHoanVi CTDHV

	JOIN	tbl_CauHoi CH 
		ON	CTDHV.MaCauHoi	= CH.MaCauHoi

	LEFT OUTER JOIN	
			[chi_tiet_bai_thi] bt
		ON	(bt.MaCauHoi = CH.MaCauHoi
		AND	bt.MaNhom = @MaNhom
		AND bt.MaDeHV = @MaDeHV
		AND bt.Ma_Chi_Tiet_Ca_Thi = @MaChiTietCaThi)

	JOIN	#DeThiIndex p 
		ON  CTDHV.MaCauHoi = p.MaCauHoi
		

	WHERE	CTDHV.MaDeHV = @MaDeHV
		AND	CTDHV.MaNhom = @MaNhom 
		

	ORDER BY p.IndexID	
			
		
DROP TABLE #DeThiIndex

GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV_MaNhom_MaChiTietCaThi_v3]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaDeHV_MaNhom_MaChiTietCaThi_v3]
	@MaDeHV [bigint],
	@MaNhom [int],
	@MaChiTietCaThi [int]
WITH EXECUTE AS CALLER
AS
SELECT	CTDHV.*,
		CH.*,
		'ThuTuSapXep' = bt.ThuTu,
		--@TONGCAUHOI,
		'MaTraLoiDaLuu' = bt.CauTraLoi

FROM	tbl_ChiTietDeThiHoanVi CTDHV

JOIN	tbl_CauHoi CH 
	ON	CTDHV.MaCauHoi	= CH.MaCauHoi

LEFT OUTER JOIN	
		[chi_tiet_bai_thi] bt
	ON	(bt.MaCauHoi = CH.MaCauHoi
	AND	bt.MaNhom = @MaNhom
	AND bt.MaDeHV = @MaDeHV
	AND bt.Ma_Chi_Tiet_Ca_Thi = @MaChiTietCaThi)
	

WHERE	CTDHV.MaDeHV = @MaDeHV
	AND	CTDHV.MaNhom = @MaNhom 
	

ORDER BY bt.ThuTu	
			

GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaNhom]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectBy_MaNhom]
	@MaNhom [int] = NULL
WITH EXECUTE AS CALLER
AS
create TABLE #PageIndex
(
	STT int IDENTITY (1, 1) NOT NULL,
	MaNhom Int
--	Version  Int,
)

BEGIN

INSERT INTO #PageIndex (
	MaNhom
)

SELECT MaNhom FROM tbl_ChiTietDeThiHoanVi
WHERE MaNhom = @MaNhom

END

SELECT	n.* ,
		p.STT

FROM	tbl_ChiTietDeThiHoanVi n

INNER JOIN #PageIndex p
ON	p.MaNhom = n.MaNhom

WHERE	n.MaNhom = @MaNhom


DROP TABLE #PageIndex

			
			
		
			
			
		
------------------------------------------------------------------------------------------------------------------------
-- Date Created: 24/12/2009
-- Created By:   Le Xuan Manh
------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectNhom1By_MaDeHV]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectNhom1By_MaDeHV]
	@MaDeHV [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	ct.* 

FROM	tbl_ChiTietDeThiHoanVi ct

LEFT OUTER JOIN tbl_NhomCauHoiHoanVi nhv
	ON	nhv.MaDeHV = ct.MaDeHV
	AND nhv.MaNhom = ct.MaNhom

LEFT OUTER JOIN tbl_NhomCauHoi nch
	ON nch.MaNhom = ct.MaNhom

WHERE	ct.MaDeHV = @MaDeHV 
	AND	(nch.MaNhomCha = -1 OR nch.MaNhomCha IS NULL)

ORDER BY ct.ThuTu, nch.ThuTu

			
			
		
			
			
		
------------------------------------------------------------------------------------------------------------------------
-- Date Created: 24/12/2009
-- Created By:   Le Xuan Manh
------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_SelectOne]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_SelectOne]
	@MaDeHV [bigint],
	@MaNhom [int],
	@MaCauHoi [int]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[tbl_ChiTietDeThiHoanVi]
WHERE
	[MaDeHV] = @MaDeHV
	AND [MaNhom] = @MaNhom
	AND [MaCauHoi] = @MaCauHoi



GO
/****** Object:  StoredProcedure [dbo].[tbl_ChiTietDeThiHoanVi_Update]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_ChiTietDeThiHoanVi_Update]
	@MaDeHV [bigint],
	@MaNhom [int],
	@MaCauHoi [int],
	@ThuTu [int],
	@HoanViTraLoi [nvarchar](4),
	@DapAn [int]
WITH EXECUTE AS CALLER
AS
UPDATE [tbl_ChiTietDeThiHoanVi] SET
	[ThuTu] = @ThuTu,
	[HoanViTraLoi] = @HoanViTraLoi,
	[DapAn] = @DapAn
WHERE
	[MaDeHV] = @MaDeHV
	AND [MaNhom] = @MaNhom
	AND [MaCauHoi] = @MaCauHoi
 


GO
/****** Object:  StoredProcedure [dbo].[tbl_danhmuc_CaThiTrongNgay_Delete]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_danhmuc_CaThiTrongNgay_Delete]
	@MaCaTrongNgay [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [tbl_danhmuc_CaThiTrongNgay]
WHERE	[MaCaTrongNgay] = @MaCaTrongNgay

GO
/****** Object:  StoredProcedure [dbo].[tbl_danhmuc_CaThiTrongNgay_Insert]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_danhmuc_CaThiTrongNgay_Insert]
	@TenCaTrongNgay [nvarchar](100),
	@GioBatDau [int],
	@PhutBatDau [int],
	@GioKetThuc [int],
	@PhutKetThuc [int],
	@CaThiCode [int]
WITH EXECUTE AS CALLER
AS
INSERT INTO [tbl_danhmuc_CaThiTrongNgay] 
(
	[TenCaTrongNgay],
	[GioBatDau],
	[PhutBatDau],
	[GioKetThuc],
	[PhutKetThuc],
	[CaThiCode]
) 
VALUES (
	@TenCaTrongNgay,
	@GioBatDau,
	@PhutBatDau,
	@GioKetThuc,
	@PhutKetThuc,
	@CaThiCode
)

SELECT @@IDENTITY


GO
/****** Object:  StoredProcedure [dbo].[tbl_danhmuc_CaThiTrongNgay_SelectAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_danhmuc_CaThiTrongNgay_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT	*
FROM	[tbl_danhmuc_CaThiTrongNgay]


GO
/****** Object:  StoredProcedure [dbo].[tbl_danhmuc_CaThiTrongNgay_SelectByCode]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_danhmuc_CaThiTrongNgay_SelectByCode]
	@CaThiCode [int]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[tbl_danhmuc_CaThiTrongNgay]
WHERE	[CaThiCode] = @CaThiCode


GO
/****** Object:  StoredProcedure [dbo].[tbl_danhmuc_CaThiTrongNgay_SelectCurrent]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_danhmuc_CaThiTrongNgay_SelectCurrent]
WITH EXECUTE AS CALLER
AS
Declare @Current float
SET @Current = cast(datepart(hh,getDate()) as float) + cast(datepart(mi,getDate()) as float)/60

--select @Current, getDate()

SELECT 	*
FROM	[tbl_danhmuc_CaThiTrongNgay]
WHERE	@Current
	between cast([GioBatDau] as float)	+ cast(([PhutBatDau]/60) as float)
		and cast([GioKetThuc] as float)	+ cast(([PhutKetThuc]/60) as float)


GO
/****** Object:  StoredProcedure [dbo].[tbl_danhmuc_CaThiTrongNgay_SelectOne]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_danhmuc_CaThiTrongNgay_SelectOne]
	@MaCaTrongNgay [int]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[tbl_danhmuc_CaThiTrongNgay]
WHERE	[MaCaTrongNgay] = @MaCaTrongNgay


GO
/****** Object:  StoredProcedure [dbo].[tbl_danhmuc_CaThiTrongNgay_Update]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_danhmuc_CaThiTrongNgay_Update]
	@MaCaTrongNgay [int],
	@TenCaTrongNgay [nvarchar](100),
	@GioBatDau [int],
	@PhutBatDau [int],
	@GioKetThuc [int],
	@PhutKetThuc [int],
	@CaThiCode [int]
WITH EXECUTE AS CALLER
AS
UPDATE [tbl_danhmuc_CaThiTrongNgay] 
SET
	[TenCaTrongNgay] = @TenCaTrongNgay,
	[GioBatDau]		= @GioBatDau,
	[PhutBatDau]	= @PhutBatDau,
	[GioKetThuc]	= @GioKetThuc,
	[PhutKetThuc]	= @PhutKetThuc,
	[CaThiCode]		= @CaThiCode
WHERE
	[MaCaTrongNgay] = @MaCaTrongNgay
 

GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_AutoUpdate_Stats]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_AutoUpdate_Stats]
	@MaDeThi [int]
WITH EXECUTE AS CALLER
AS
DECLARE @TONGSOHV bigint

SET @TONGSOHV = (SELECT COUNT(*)
	FROM tbl_DeThiHoanVi
	WHERE	MaDeThi = @MaDeThi)

UPDATE [tbl_DeThi] 
SET
	[TongSoDeHoanVi] = @TONGSOHV
WHERE
	[MaDeThi] = @MaDeThi
 



GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_DecreamentTongSoDeHoanVi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_DecreamentTongSoDeHoanVi]
	@MaDeThi [int]
WITH EXECUTE AS CALLER
AS
IF NOT EXISTS ( SELECT * FROM [tbl_DeThi] WHERE [MaDeThi] = @MaDeThi
	AND [TongSoDeHoanVi] <= 0)
BEGIN
	UPDATE [tbl_DeThi] 
	SET
		[TongSoDeHoanVi] = [TongSoDeHoanVi] - 1
	WHERE
		[MaDeThi] = @MaDeThi
 END



GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_Delete]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_Delete]
	@MaDeThi [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM tbl_ChiTietDeThiHoanVi
WHERE [MaDeHV] IN(
	SELECT	[MaDeHV]
	FROM	tbl_DeThiHoanVi
	WHERE	[MaDeThi] = @MaDeThi)

DELETE FROM tbl_NhomCauHoiHoanVi
WHERE [MaDeHV] IN(
	SELECT	[MaDeHV]
	FROM	tbl_DeThiHoanVi
	WHERE	[MaDeThi] = @MaDeThi)

DELETE FROM tbl_DeThiHoanVi
WHERE	[MaDeThi] = @MaDeThi

DELETE FROM	tbl_CauTraLoi
WHERE [MaCauHoi] IN(
	SELECT	[MaCauHoi]
	FROM	tbl_CauHoi
	WHERE [MaCauHoi] IN(
		SELECT	[MaCauHoi]
		FROM	tbl_ChiTietDeThi
		WHERE	[MaNhom] IN(
			SELECT	[MaNhom]
			FROM	tbl_NhomCauHoi
			WHERE	[MaDeThi] = @MaDeThi
		)
	)
)

DELETE FROM	tbl_CauHoi
WHERE [MaCauHoi] IN(
	SELECT	[MaCauHoi]
	FROM	tbl_ChiTietDeThi
	WHERE	[MaNhom] IN(
		SELECT	[MaNhom]
		FROM	tbl_NhomCauHoi
		WHERE	[MaDeThi] = @MaDeThi
	)
)

DELETE FROM tbl_ChiTietDeThi
WHERE [MaNhom] IN(
	SELECT	[MaNhom]
	FROM	tbl_NhomCauHoi
	WHERE	[MaDeThi] = @MaDeThi)

DELETE FROM tbl_NhomCauHoi
WHERE	[MaDeThi] = @MaDeThi

DELETE FROM [tbl_DeThi]
WHERE	[MaDeThi] = @MaDeThi


GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_DeleteAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_DeleteAll]
WITH EXECUTE AS CALLER
AS
DELETE FROM tbl_ChiTietDeThiHoanVi

DELETE FROM tbl_NhomCauHoiHoanVi

DELETE FROM tbl_DeThiHoanVi

DELETE FROM tbl_ChiTietDeThi

DELETE FROM tbl_NhomCauHoi

DELETE FROM	tbl_CauTraLoi

DELETE FROM	tbl_CauHoi

DELETE FROM [tbl_DeThi]
GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_IncreamentTongSoDeHoanVi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_IncreamentTongSoDeHoanVi]
	@MaDeThi [int]
WITH EXECUTE AS CALLER
AS
UPDATE [tbl_DeThi] 
SET
	[TongSoDeHoanVi] = [TongSoDeHoanVi] + 1
WHERE
	[MaDeThi] = @MaDeThi
 



GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_Insert]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_Insert]
	@MaMonHoc [int],
	@TenDeThi [nvarchar](250),
	@NgayTao [datetime],
	@NguoiTao [int],
	@GhiChu [ntext],
	@BoChuongPhan [bit]
WITH EXECUTE AS CALLER
AS
IF EXISTS (
		SELECT	* 
		FROM	[tbl_DeThi] 
		WHERE	[TenDeThi] = @TenDeThi
			and [MaMonHoc] = @MaMonHoc
	)
		set @TenDeThi = @TenDeThi + '_01'

	INSERT INTO [tbl_DeThi] 
	(
		[MaMonHoc],
		[TenDeThi],
		[NgayTao],
		[NguoiTao],
		[GhiChu],
		[BoChuongPhan] 
	) 
	VALUES 
	(
		@MaMonHoc,
		@TenDeThi,
		@NgayTao,
		@NguoiTao,
		@GhiChu,
		@BoChuongPhan 
	)

	SELECT @@IDENTITY



GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_SelectAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[tbl_DeThi]



GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_SelectByMonHoc]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_SelectByMonHoc]
	@MaMonHoc [int]
WITH EXECUTE AS CALLER
AS
SELECT	*
FROM	[tbl_DeThi]
WHERE	[MaMonHoc] = @MaMonHoc


GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_SelectOne]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_SelectOne]
	@MaDeThi [int]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[tbl_DeThi]
WHERE
	[MaDeThi] = @MaDeThi



GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_SelectTongSoDeHV]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_SelectTongSoDeHV]
	@MaDeThi [int]
WITH EXECUTE AS CALLER
AS
SELECT 	TongSoDeHoanVi
FROM	[tbl_DeThi]
WHERE	[MaDeThi] = @MaDeThi



GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_Update]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_Update]
	@MaDeThi [int],
	@MaMonHoc [int],
	@TenDeThi [nvarchar](250),
	@NgayTao [datetime],
	@NguoiTao [int],
	@GhiChu [ntext],
	@BoChuongPhan [bit]
WITH EXECUTE AS CALLER
AS
UPDATE [tbl_DeThi] 
SET
	[MaMonHoc] = @MaMonHoc,
	[TenDeThi] = @TenDeThi,
	[NgayTao] = @NgayTao,
	[NguoiTao] = @NguoiTao,
	[GhiChu] = @GhiChu
	,[BoChuongPhan] = @BoChuongPhan
WHERE
	[MaDeThi] = @MaDeThi
 


GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThi_Update_Stats]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThi_Update_Stats]
	@MaDeThi [int],
	@TongSoDeHoanVi [bigint]
WITH EXECUTE AS CALLER
AS
UPDATE [tbl_DeThi] 
SET
	[TongSoDeHoanVi] = @TongSoDeHoanVi
WHERE
	[MaDeThi] = @MaDeThi
 


GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThiHoanVi_Delete]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThiHoanVi_Delete]
	@MaDeHV [bigint]
WITH EXECUTE AS CALLER
AS
DELETE FROM [tbl_DeThiHoanVi]
WHERE
	[MaDeHV] = @MaDeHV


GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThiHoanVi_Insert]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThiHoanVi_Insert]
	@MaDeThi [int],
	@KyHieuDe [nvarchar](50),
	@NgayTao [datetime],
	@Guid [uniqueidentifier]
WITH EXECUTE AS CALLER
AS
-- THIS STORED PROCEDURE NEEDS TO BE MANUALLY COMPLETED
-- MULITPLE PRIMARY KEY MEMBERS OR NON-GUID/INT PRIMARY KEY

INSERT INTO [tbl_DeThiHoanVi] (
	[MaDeThi],
	[KyHieuDe],
	[NgayTao],
	[Guid]
) VALUES (
	@MaDeThi,
	@KyHieuDe,
	@NgayTao,
	@Guid
)

SELECT @@IDENTITY


GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThiHoanVi_SelectAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThiHoanVi_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[tbl_DeThiHoanVi]



GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThiHoanVi_SelectBy_MaDeThi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThiHoanVi_SelectBy_MaDeThi]
	@MaDeThi [int]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[tbl_DeThiHoanVi]
WHERE
	[MaDeThi] = @MaDeThi

GO
/****** Object:  StoredProcedure [dbo].[tbl_DeThiHoanVi_SelectOne]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_DeThiHoanVi_SelectOne]
	@MaDeHV [bigint]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[tbl_DeThiHoanVi]
WHERE
	[MaDeHV] = @MaDeHV



GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoi_Delete]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoi_Delete]
	@MaNhom [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [tbl_NhomCauHoi]
WHERE
	[MaNhom] = @MaNhom


GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoi_Insert]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoi_Insert]
	@MaDeThi [int],
	@TenNhom [nvarchar](250),
	@NoiDung [ntext],
	@SoCauHoi [int],
	@HoanVi [bit],
	@ThuTu [int],
	@MaNhomCha [int],
	@SoCauLay [int],
	@LaCauHoiNhom [bit]
WITH EXECUTE AS CALLER
AS
INSERT INTO [tbl_NhomCauHoi] (
	[MaDeThi],
	[TenNhom],
	[NoiDung],
	[SoCauHoi],
	[HoanVi],
	[ThuTu],
	[MaNhomCha],
	[SoCauLay],
	[LaCauHoiNhom]
) 
VALUES (
	@MaDeThi,
	@TenNhom,
	@NoiDung,
	@SoCauHoi,
	@HoanVi,
	@ThuTu,
	@MaNhomCha,
	@SoCauLay,
	@LaCauHoiNhom
)

SELECT @@IDENTITY


GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoi_IsCauHoiNhom]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoi_IsCauHoiNhom]
	@MaNhom [int]
WITH EXECUTE AS CALLER
AS
IF EXISTS (
	SELECT 	*
	FROM	[tbl_NhomCauHoi]
	WHERE	[MaNhom] = @MaNhom 
		AND [LaCauHoiNhom] = 1)
	RETURN 1
ELSE RETURN 0



GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoi_SelectAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoi_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[tbl_NhomCauHoi]



GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoi_SelectAllBy_MaDeThi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoi_SelectAllBy_MaDeThi]
	@MaDeThi [int]
WITH EXECUTE AS CALLER
AS
SELECT	* 
FROM	tbl_NhomCauHoi
WHERE	MaDeThi = @MaDeThi
ORDER BY	ThuTu

GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoi_SelectBy_MaDeThi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoi_SelectBy_MaDeThi]
	@MaDeThi [int]
WITH EXECUTE AS CALLER
AS
SELECT	* 
FROM	tbl_NhomCauHoi

WHERE	MaDeThi = @MaDeThi
	AND	(MaNhomCha = -1 OR MaNhomCha IS NULL)

ORDER BY ThuTu

GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoi_SelectBy_MaNhomCha]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoi_SelectBy_MaNhomCha]
	@MaNhomCha [int]
WITH EXECUTE AS CALLER
AS
SELECT	* 

FROM	tbl_NhomCauHoi

WHERE	MaNhomCha = @MaNhomCha
	AND	(MaNhomCha <> -1 AND MaNhomCha IS NOT NULL)

ORDER BY ThuTu

GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoi_SelectHoanViBy_MaDeThi]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoi_SelectHoanViBy_MaDeThi]
	@MaDeThi [int],
	@HoanVi [bit]
WITH EXECUTE AS CALLER
AS
SELECT	* 
	FROM	tbl_NhomCauHoi
	WHERE	MaDeThi	= @MaDeThi
		AND	HoanVi	= @HoanVi
	ORDER BY	ThuTu

GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoi_SelectOne]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoi_SelectOne]
	@MaNhom [int]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[tbl_NhomCauHoi]
WHERE
	[MaNhom] = @MaNhom



GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoi_Update]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoi_Update]
	@MaNhom [int],
	@MaDeThi [int],
	@TenNhom [nvarchar](250),
	@NoiDung [ntext],
	@SoCauHoi [int],
	@HoanVi [bit],
	@ThuTu [int],
	@MaNhomCha [int]
WITH EXECUTE AS CALLER
AS
UPDATE [tbl_NhomCauHoi] 
SET
	[MaDeThi] = @MaDeThi,
	[TenNhom] = @TenNhom,
	[NoiDung] = @NoiDung,
	[SoCauHoi] = @SoCauHoi,
	[HoanVi] = @HoanVi,
	[ThuTu] = @ThuTu,
	[MaNhomCha] = @MaNhomCha
WHERE
	[MaNhom] = @MaNhom
 


GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoiHoanVi_CountBy_MaNhomCha]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoiHoanVi_CountBy_MaNhomCha]
	@MaDeHV [int],
	@MaNhomCha [int]
WITH EXECUTE AS CALLER
AS
SELECT	COUNT(*)

FROM tbl_NhomCauHoiHoanVi nhv

LEFT OUTER JOIN tbl_NhomCauHoi n
on n.MaNhom = nhv.MaNhom

WHERE	nhv.MaDeHV = @MaDeHV
	AND	n.MaNhomCha = @MaNhomCha

		
			
			
		
------------------------------------------------------------------------------------------------------------------------
-- Date Created: 24/12/2009
-- Created By:   Le Xuan Manh
------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoiHoanVi_Delete]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoiHoanVi_Delete]
	@MaDeHV [bigint],
	@MaNhom [int]
WITH EXECUTE AS CALLER
AS
DELETE FROM [tbl_NhomCauHoiHoanVi]
WHERE
	[MaDeHV] = @MaDeHV
	AND [MaNhom] = @MaNhom


GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoiHoanVi_Insert]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoiHoanVi_Insert]
	@MaDeHV [bigint],
	@MaNhom [int],
	@ThuTu [int]
WITH EXECUTE AS CALLER
AS
-- THIS STORED PROCEDURE NEEDS TO BE MANUALLY COMPLETED
-- MULITPLE PRIMARY KEY MEMBERS OR NON-GUID/INT PRIMARY KEY

INSERT INTO [tbl_NhomCauHoiHoanVi] (
	[MaDeHV],
	[MaNhom],
	[ThuTu]
) VALUES (
	@MaDeHV,
	@MaNhom,
	@ThuTu
)



GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoiHoanVi_SelectAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoiHoanVi_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT
	*
FROM
	[tbl_NhomCauHoiHoanVi]



GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoiHoanVi_SelectBy_MaDeHV]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoiHoanVi_SelectBy_MaDeHV]
	@MaDeHV [int] = NULL
WITH EXECUTE AS CALLER
AS
SELECT	nhv.* , 
		n.TenNhom, 
		n.NoiDung,
		n.LaCauHoiNhom

FROM tbl_NhomCauHoiHoanVi nhv

LEFT OUTER JOIN tbl_NhomCauHoi n
on n.MaNhom = nhv.MaNhom

WHERE MaDeHV = @MaDeHV
--and (MaNhomCha = -1 OR MaNhomCha IS NULL)

ORDER BY ThuTu	
			
		
			
			
		
------------------------------------------------------------------------------------------------------------------------
-- Date Created: 24/12/2009
-- Created By:   Le Xuan Manh
------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoiHoanVi_SelectBy_MaNhom]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoiHoanVi_SelectBy_MaNhom]
	@MaNhom [int] = NULL
WITH EXECUTE AS CALLER
AS
create TABLE #PageIndex
(
	STT int IDENTITY (1, 1) NOT NULL,
	MaNhom Int
--	Version  Int,
)

BEGIN

INSERT INTO #PageIndex (
	MaNhom
)

SELECT MaNhom FROM tbl_NhomCauHoiHoanVi
WHERE MaNhom = @MaNhom

END

SELECT	n.* ,
		p.STT

FROM	tbl_NhomCauHoiHoanVi n

INNER JOIN #PageIndex p
ON	p.MaNhom = n.MaNhom

WHERE	MaNhom = @MaNhom


DROP TABLE #PageIndex

GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoiHoanVi_SelectBy_MaNhomCha]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoiHoanVi_SelectBy_MaNhomCha]
	@MaDeHV [int],
	@MaNhomCha [int]
WITH EXECUTE AS CALLER
AS
SELECT	nhv.* , 
		n.TenNhom, 
		n.NoiDung,
		n.LaCauHoiNhom

FROM tbl_NhomCauHoiHoanVi nhv

LEFT OUTER JOIN tbl_NhomCauHoi n
on n.MaNhom = nhv.MaNhom

WHERE	nhv.MaDeHV = @MaDeHV
	AND	n.MaNhomCha = @MaNhomCha

ORDER BY nhv.ThuTu	
			
		
			
			
		
------------------------------------------------------------------------------------------------------------------------
-- Date Created: 24/12/2009
-- Created By:   Le Xuan Manh
------------------------------------------------------------------------------------------------------------------------
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoiHoanVi_SelectOne]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoiHoanVi_SelectOne]
	@MaDeHV [bigint],
	@MaNhom [int]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[tbl_NhomCauHoiHoanVi]
WHERE
	[MaDeHV] = @MaDeHV
	AND [MaNhom] = @MaNhom



GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoiHoanVi_SelectPageBy_MaNhomCha]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoiHoanVi_SelectPageBy_MaNhomCha]
	@MaDeHV [int],
	@MaNhomCha [int],
	@PageNumber [int],
	@PageSize [int]
WITH EXECUTE AS CALLER
AS
--SELECT	nhv.* , 
--		n.TenNhom, 
--		n.NoiDung
--
--FROM tbl_NhomCauHoiHoanVi nhv
--
--LEFT OUTER JOIN tbl_NhomCauHoi n
--on n.MaNhom = nhv.MaNhom
--
--WHERE	nhv.MaDeHV = @MaDeHV
--	AND	n.MaNhomCha = @MaNhomCha
--
--ORDER BY nhv.ThuTu	
			
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int

	SET @PageLowerBound = (@PageSize * @PageNumber) - @PageSize
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1

	create TABLE #PageIndex
	(
		IndexID int IDENTITY (1, 1) NOT NULL,
		MaDeHV	bigint,
		MaNhom	int
	)

	BEGIN

	INSERT INTO #PageIndex 
	(
		MaDeHV,
		MaNhom
	)

	SELECT	nhv.MaDeHV, nhv.MaNhom

	FROM	tbl_NhomCauHoiHoanVi nhv

	LEFT OUTER JOIN tbl_NhomCauHoi n
		on	n.MaNhom = nhv.MaNhom

	WHERE	nhv.MaDeHV = @MaDeHV
		AND	n.MaNhomCha = @MaNhomCha

	ORDER BY nhv.ThuTu

	END

	DECLARE @TotalRecords int
	DECLARE @TotalPages int
	DECLARE @Remainder int

	SET @TotalRecords = (SELECT Count(*) FROM #PageIndex)
	SET @TotalPages = @TotalRecords / @PageSize
	SET @Remainder = @TotalRecords % @PageSize
	IF	@Remainder > 0
	SET @TotalPages = @TotalPages + 1

	SELECT	nhv.* , 
			n.TenNhom, 
			n.NoiDung,
		n.LaCauHoiNhom

	FROM	tbl_NhomCauHoiHoanVi nhv

	LEFT OUTER JOIN tbl_NhomCauHoi n
		on	n.MaNhom = nhv.MaNhom

	JOIN	#PageIndex t2
		ON	nhv.MaDeHV	= t2.MaDeHV
		AND nhv.MaNhom	= t2.MaNhom

	WHERE
			t2.IndexID > @PageLowerBound
		AND t2.IndexID < @PageUpperBound
			
	ORDER BY t2.IndexID

	DROP TABLE #PageIndex
GO
/****** Object:  StoredProcedure [dbo].[tbl_NhomCauHoiHoanVi_Update]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tbl_NhomCauHoiHoanVi_Update]
	@MaDeHV [bigint],
	@MaNhom [int],
	@ThuTu [int]
WITH EXECUTE AS CALLER
AS
UPDATE [tbl_NhomCauHoiHoanVi] SET
	[ThuTu] = @ThuTu
WHERE
	[MaDeHV] = @MaDeHV
	AND [MaNhom] = @MaNhom
 

GO
/****** Object:  StoredProcedure [dbo].[User_Delete]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Delete]
	@UserId [uniqueidentifier]
WITH EXECUTE AS CALLER
AS
-- delete all relative data
-- yeu cau bo sung sau

DELETE FROM dbo.[User]
WHERE	[UserId] = @UserId



GO
/****** Object:  StoredProcedure [dbo].[User_Delete_2]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Delete_2]
	@UserId [uniqueidentifier]
WITH EXECUTE AS CALLER
AS
-- delete all relative data
-- yeu cau bo sung sau

UPDATE [User] 
SET
	[IsDeleted] = 1
WHERE
	[UserId] = @UserId



GO
/****** Object:  StoredProcedure [dbo].[User_Insert]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Insert]
	@UserId [uniqueidentifier],
	@LoginName [nvarchar](100),
	@Email [nvarchar](100),
	@Name [nvarchar](255),
	@Password [nvarchar](128),
	@DateCreated [datetime],
	@PasswordSalt [nvarchar](255),
	@Comment [ntext],
	@IsBuildInUser [bit]
WITH EXECUTE AS CALLER
AS
INSERT INTO [User] (
	[UserId],
	[LoginName],
	[Email],
	[Name],
	[Password],
	[DateCreated],
	[PasswordSalt],
	[Comment],
	[IsBuildInUser]
) 
VALUES 
(
	@UserId,
	@LoginName,
	@Email,
	@Name,
	@Password,
	@DateCreated,
	@PasswordSalt,
	@Comment,
	@IsBuildInUser
)





GO
/****** Object:  StoredProcedure [dbo].[User_Login]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Login]
	@LoginName [nvarchar](50),
	@Password [nvarchar](128),
	@UserName [nvarchar](100) OUTPUT
WITH EXECUTE AS CALLER
AS
SELECT
    @UserName = [Name]

FROM
    [User]

WHERE
		[LoginName] = @LoginName
  		AND [Password] = @Password



GO
/****** Object:  StoredProcedure [dbo].[User_SelectAll]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_SelectAll]
WITH EXECUTE AS CALLER
AS
SELECT	u.*

FROM	[User] u

ORDER BY u.[IsBuildInUser] DESC, u.[LoginName], u.[Name]




GO
/****** Object:  StoredProcedure [dbo].[User_SelectByLoginName]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_SelectByLoginName]
	@LoginName [nvarchar](100)
WITH EXECUTE AS CALLER
AS
SELECT	u.*

FROM	[User] u

WHERE	u.[LoginName] = @LoginName




GO
/****** Object:  StoredProcedure [dbo].[User_SelectOne]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_SelectOne]
	@UserId [uniqueidentifier]
WITH EXECUTE AS CALLER
AS
SELECT 	*
FROM	[User]
WHERE	[UserId] = @UserId





GO
/****** Object:  StoredProcedure [dbo].[User_Update]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Update]
	@UserId [uniqueidentifier],
	@LoginName [nvarchar](100),
	@Email [nvarchar](100),
	@Name [nvarchar](255),
	@Password [nvarchar](128),
	@PasswordSalt [nvarchar](255),
	@Comment [ntext]
WITH EXECUTE AS CALLER
AS
UPDATE [User] 
SET
	[LoginName] = @LoginName,
	[Email] = @Email,
	[Name] = @Name,
	[Password] = @Password,
	[PasswordSalt] = @PasswordSalt,
	[Comment] = @Comment
WHERE
	[UserId] = @UserId
 



GO
/****** Object:  StoredProcedure [dbo].[User_UpdatePassword]    Script Date: 26/08/2024 10:41:57 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_UpdatePassword]
	@UserId [uniqueidentifier],
	@Password [nvarchar](128),
	@PasswordSalt [nvarchar](255)
WITH EXECUTE AS CALLER
AS
UPDATE [User] 
SET
	[Password] = @Password,
	[PasswordSalt] = @PasswordSalt
WHERE
	[UserId] = @UserId
 

GO
