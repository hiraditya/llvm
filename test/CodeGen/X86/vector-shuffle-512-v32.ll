; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mcpu=x86-64 -mattr=+avx512f -mattr=+avx512bw | FileCheck %s --check-prefix=ALL --check-prefix=AVX512 --check-prefix=AVX512BW

target triple = "x86_64-unknown-unknown"

define <32 x i16> @shuffle_v32i16_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00(<32 x i16> %a)  {
; ALL-LABEL: shuffle_v32i16_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00_00:
; ALL:       # BB#0:
; ALL-NEXT:    vpbroadcastw %xmm0, %zmm0
; ALL-NEXT:    retq
  %c = shufflevector <32 x i16> %a, <32 x i16> undef, <32 x i32> zeroinitializer
  ret <32 x i16> %c
}

define <32 x i16> @shuffle_v32i16_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08(<32 x i16> %a)  {
; ALL-LABEL: shuffle_v32i16_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08_08:
; ALL:       # BB#0:
; ALL-NEXT:    vextracti32x4 $1, %zmm0, %xmm0
; ALL-NEXT:    vpbroadcastw %xmm0, %zmm0
; ALL-NEXT:    retq
  %c = shufflevector <32 x i16> %a, <32 x i16> undef, <32 x i32> <i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8, i32 8>
  ret <32 x i16> %c
}

define <32 x i16> @shuffle_v32i16_02_05_u_u_07_u_0a_01_00_05_u_04_07_u_0a_01_02_05_u_u_07_u_0a_01_00_05_u_04_07_u_0a_1f(<32 x i16> %a)  {
; ALL-LABEL: shuffle_v32i16_02_05_u_u_07_u_0a_01_00_05_u_04_07_u_0a_01_02_05_u_u_07_u_0a_01_00_05_u_04_07_u_0a_1f:
; ALL:       # BB#0:
; ALL-NEXT:    vmovdqu16 {{.*#+}} zmm1 = <2,5,u,u,7,u,10,1,0,5,u,4,7,u,10,1,2,5,u,u,7,u,10,1,0,5,u,4,7,u,10,31>
; ALL-NEXT:    vpermw %zmm0, %zmm1, %zmm0
; ALL-NEXT:    retq
  %c = shufflevector <32 x i16> %a, <32 x i16> undef, <32 x i32> <i32 2, i32 5, i32 undef, i32 undef, i32 7, i32 undef, i32 10, i32 1,  i32 0, i32 5, i32 undef, i32 4, i32 7, i32 undef, i32 10, i32 1, i32 2, i32 5, i32 undef, i32 undef, i32 7, i32 undef, i32 10, i32 1,  i32 0, i32 5, i32 undef, i32 4, i32 7, i32 undef, i32 10, i32 31>
  ret <32 x i16> %c
}

define <32 x i16> @shuffle_v32i16_0f_1f_0e_16_0d_1d_04_1e_0b_1b_0a_1a_09_19_08_18_0f_1f_0e_16_0d_1d_04_1e_0b_1b_0a_1a_09_19_08_38(<32 x i16> %a, <32 x i16> %b)  {
; ALL-LABEL: shuffle_v32i16_0f_1f_0e_16_0d_1d_04_1e_0b_1b_0a_1a_09_19_08_18_0f_1f_0e_16_0d_1d_04_1e_0b_1b_0a_1a_09_19_08_38:
; ALL:       # BB#0:
; ALL-NEXT:    vmovdqu16 {{.*#+}} zmm2 = [15,31,14,22,13,29,4,28,11,27,10,26,9,25,8,24,15,31,14,22,13,29,4,28,11,27,10,26,9,25,8,56]
; ALL-NEXT:    vpermt2w %zmm1, %zmm2, %zmm0
; ALL-NEXT:    retq
  %c = shufflevector <32 x i16> %a, <32 x i16> %b, <32 x i32> <i32 15, i32 31, i32 14, i32 22, i32 13, i32 29, i32 4, i32 28, i32 11, i32 27, i32 10, i32 26, i32 9, i32 25, i32 8, i32 24, i32 15, i32 31, i32 14, i32 22, i32 13, i32 29, i32 4, i32 28, i32 11, i32 27, i32 10, i32 26, i32 9, i32 25, i32 8, i32 56>
  ret <32 x i16> %c
}

define <32 x i16> @shuffle_v16i32_0_32_1_33_2_34_3_35_8_40_9_41_u_u_u_u(<32 x i16> %a, <32 x i16> %b)  {
; ALL-LABEL: shuffle_v16i32_0_32_1_33_2_34_3_35_8_40_9_41_u_u_u_u:
; ALL:       # BB#0:
; ALL-NEXT:    vmovdqu16 {{.*#+}} zmm2 = <0,32,1,33,2,34,3,35,8,40,9,41,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u>
; ALL-NEXT:    vpermt2w %zmm1, %zmm2, %zmm0
; ALL-NEXT:    retq
  %c = shufflevector <32 x i16> %a, <32 x i16> %b, <32 x i32> <i32 0, i32 32, i32 1, i32 33, i32 2, i32 34, i32 3, i32 35, i32 8, i32 40, i32 9, i32 41, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  ret <32 x i16> %c
}

define <32 x i16> @shuffle_v16i32_4_36_5_37_6_38_7_39_12_44_13_45_u_u_u_u(<32 x i16> %a, <32 x i16> %b)  {
; ALL-LABEL: shuffle_v16i32_4_36_5_37_6_38_7_39_12_44_13_45_u_u_u_u:
; ALL:       # BB#0:
; ALL-NEXT:    vmovdqu16 {{.*#+}} zmm2 = <4,36,5,37,6,38,7,39,12,44,13,45,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u,u>
; ALL-NEXT:    vpermt2w %zmm1, %zmm2, %zmm0
; ALL-NEXT:    retq
  %c = shufflevector <32 x i16> %a, <32 x i16> %b, <32 x i32> <i32 4, i32 36, i32 5, i32 37, i32 6, i32 38, i32 7, i32 39, i32 12, i32 44, i32 13, i32 45, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  ret <32 x i16> %c
}

define <32 x i16> @shuffle_v32i16_1_z_3_z_5_z_7_z_9_z_11_z_13_z_15_z_17_z_19_z_21_z_23_z_25_z_27_z_29_z_31_z(<32 x i16> %a, <32 x i16> %b)  {
; ALL-LABEL: shuffle_v32i16_1_z_3_z_5_z_7_z_9_z_11_z_13_z_15_z_17_z_19_z_21_z_23_z_25_z_27_z_29_z_31_z:
; ALL:       # BB#0:
; ALL-NEXT:    vpsrld $16, %zmm0, %zmm0
; ALL-NEXT:    retq
  %c = shufflevector <32 x i16> %a, <32 x i16> zeroinitializer, <32 x i32> <i32 1, i32 34, i32 3, i32 34, i32 5, i32 34, i32 7, i32 34, i32 9, i32 34, i32 11, i32 34, i32 13, i32 34, i32 15, i32 34, i32 17, i32 34, i32 19, i32 34, i32 21, i32 34, i32 23, i32 34, i32 25, i32 34, i32 27, i32 34, i32 29, i32 34, i32 31, i32 34>
  ret <32 x i16> %c
}

define <32 x i16> @shuffle_v32i16_z_0_z_2_z_4_z_6_z_8_z_10_z_12_z_14_z_16_z_18_z_20_z_22_z_24_z_26_z_28_z_30(<32 x i16> %a, <32 x i16> %b)  {
; ALL-LABEL: shuffle_v32i16_z_0_z_2_z_4_z_6_z_8_z_10_z_12_z_14_z_16_z_18_z_20_z_22_z_24_z_26_z_28_z_30:
; ALL:       # BB#0:
; ALL-NEXT:    vpslld $16, %zmm0, %zmm0
; ALL-NEXT:    retq
  %c = shufflevector <32 x i16> %a, <32 x i16> zeroinitializer, <32 x i32> <i32 34, i32 0, i32 34, i32 2, i32 34, i32 4, i32 34, i32 6, i32 34, i32 8, i32 34, i32 10, i32 34, i32 12, i32 34, i32 14, i32 34, i32 16, i32 34, i32 18, i32 34, i32 20, i32 34, i32 22, i32 34, i32 24, i32 34, i32 26, i32 34, i32 28, i32 34, i32 30>
  ret <32 x i16> %c
}
