// REQUIRES: amdgpu-registered-target

// Check that appropriate features are defined for every supported AMDGPU
// "-target" and "-mcpu" options.

// RUN: %clang_cc1 -triple amdgcn -target-cpu gfx904 -S -emit-llvm -o - %s | FileCheck --check-prefix=GFX904 %s
// RUN: %clang_cc1 -triple amdgcn -target-cpu gfx906 -S -emit-llvm -o - %s | FileCheck --check-prefix=GFX906 %s
// RUN: %clang_cc1 -triple amdgcn -target-cpu gfx1010 -S -emit-llvm -o - %s | FileCheck --check-prefix=GFX1010 %s
// RUN: %clang_cc1 -triple amdgcn -target-cpu gfx1011 -S -emit-llvm -o - %s | FileCheck --check-prefix=GFX1011 %s
// RUN: %clang_cc1 -triple amdgcn -target-cpu gfx1012 -S -emit-llvm -o - %s | FileCheck --check-prefix=GFX1012 %s
// RUN: %clang_cc1 -triple amdgcn -target-cpu gfx801 -S -emit-llvm -o - %s | FileCheck --check-prefix=GFX801 %s
// RUN: %clang_cc1 -triple amdgcn -target-cpu gfx700 -S -emit-llvm -o - %s | FileCheck --check-prefix=GFX700 %s
// RUN: %clang_cc1 -triple amdgcn -target-cpu gfx600 -S -emit-llvm -o - %s | FileCheck --check-prefix=GFX600 %s
// RUN: %clang_cc1 -triple amdgcn -target-cpu gfx601 -S -emit-llvm -o - %s | FileCheck --check-prefix=GFX601 %s

// GFX904: "target-features"="+16-bit-insts,+ci-insts,+dpp,+fp32-denormals,+fp64-fp16-denormals,+gfx8-insts,+gfx9-insts,+s-memrealtime"
// GFX906: "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dpp,+fp32-denormals,+fp64-fp16-denormals,+gfx8-insts,+gfx9-insts,+s-memrealtime"
// GFX1010: "target-features"="+16-bit-insts,+dl-insts,+dpp,+fp32-denormals,+fp64-fp16-denormals,+gfx10-insts,+gfx9-insts,+s-memrealtime"
// GFX1011: "target-features"="+16-bit-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot5-insts,+dot6-insts,+dpp,+fp32-denormals,+fp64-fp16-denormals,+gfx10-insts,+gfx9-insts,+s-memrealtime"
// GFX1012: "target-features"="+16-bit-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot5-insts,+dot6-insts,+dpp,+fp32-denormals,+fp64-fp16-denormals,+gfx10-insts,+gfx9-insts,+s-memrealtime"
// GFX801: "target-features"="+16-bit-insts,+ci-insts,+dpp,+fp32-denormals,+fp64-fp16-denormals,+gfx8-insts,+s-memrealtime"
// GFX700: "target-features"="+ci-insts,+fp64-fp16-denormals,-fp32-denormals"
// GFX600: "target-features"="+fp64-fp16-denormals,-fp32-denormals"
// GFX601: "target-features"="+fp64-fp16-denormals,-fp32-denormals"

kernel void test() {}
